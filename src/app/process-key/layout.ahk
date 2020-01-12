global alternativeLayoutActive
global layoutKeyActivatesProcessKeyOnRelease
global layoutKeyPressed
global alternativeLayoutActive
global stopManagingLayoutKey



manageLayoutKeyDown(key)
{
    layoutKeyPressed := true
    if (!stopManagingLayoutKey)
    {
        CoordMode, Mouse, Screen
        MouseGetPos, initialMousePositionXAxis, initialMousePositionYAxis
        if (timeoutMouseScrollPoll) {
            SetTimer, TimerGetMouseMovement, %timeoutMouseScrollPoll%
        }
        stopManagingLayoutKey := true
        if (activePressedKeys.Length() > 0)
        {
            send {blind}{%key%}
            sendLayoutKey := false
            debug(key . "|because other keys pressed")
        }
        else
        {
            alternativeLayoutActive := true
            sendLayoutKey := true
            SetTimer, TimerTimeoutSendLayoutKey, OFF
            SetTimer, TimerTimeoutSendLayoutKey, %timeoutStillSendLayoutKey%
            if (layoutKeyActivatesProcessKeyOnRelease)
            {
                processKeyOnRelease := true
            }
            debug(key . "|activates alternative layout")
        }
    }
}


TimerTimeoutSendLayoutKey:
    SetTimer, TimerTimeoutSendLayoutKey, OFF
    sendLayoutKey := false
    if (keyToSendOnUp)
    {
        key := alternativeLayout[keyToSendOnUp]
        processKeyToSend(key)
        processKeyOnRelease := false
        layoutKeyActivatesProcessKeyOnRelease := false
        keyToSendOnUp := ""
        debug(key . "|---*** on alternative layout hard pressed and send key on up")            
    }
return


manageLayoutKeyUp(key)
{
    SetTimer, TimerGetMouseMovement, OFF
    systemCursor(1)
    SetTimer, TimerTimeoutSendLayoutKey, OFF
    stopManagingLayoutKey := false
    layoutKeyPressed := false
    processKeyOnRelease := false
    layoutKeyActivatesProcessKeyOnRelease := false    
    alternativeLayoutActive := false
    if (sendLayoutKey)
    {   
        activeModifiers := getActiveModifiers(key)
        if (!processAhkKeyboardShortcuts(activeModifiers, key))
        {
            send {blind}%activeModifiers%{%key%}
        }
        debug(key . "|UP")
        
        if (keyToSendOnUp)
        {
            processKeyToSend(keyToSendOnUp)
            keyToSendOnUp := ""
            debug(keyToSendOnUp . "|^^^^^^ on alternative layout released before")
        }
        
        return
    }

    debug(key . "|NOT SENT CAUSE CONSUMED")
}


TimerProcessLayoutOnRelease:
    SetTimer, TimerProcessLayoutOnRelease, OFF
    layoutKeyActivatesProcessKeyOnRelease := false 
return
