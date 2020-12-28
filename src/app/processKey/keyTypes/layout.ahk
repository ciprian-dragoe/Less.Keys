global alternativeLayoutActive
global layoutKeyActivatesProcessKeyOnRelease
global layoutKeyPressed
global alternativeLayoutActive
global timeoutStillSendLayoutKey
global timeoutProcessLayoutOnRelease



manageLayoutKeyDown(key)
{
    if (!layoutKeyPressed)
    {
        cancelDoubledModifier()
        layoutKeyPressed := true
        if (timeoutMouseScrollPoll)
        {
            CoordMode, Mouse, Screen
            MouseGetPos, initialMousePositionXAxis, initialMousePositionYAxis
            SetTimer, TimerScrollWithMouseMovement, %timeoutMouseScrollPoll%
        }

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
            SetTimer, TimerTimeoutSendLayoutKey, %timeoutStillSendLayoutKey%
            if (layoutKeyActivatesProcessKeyOnRelease)
            {
                processKeyOnRelease := true
            }
            debug(key . "|activates alternative layout")
        }
    }
}

manageLayoutKeyUp(key)
{
    SetTimer, TimerScrollWithMouseMovement, OFF
    systemCursor(1)
    
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
            temp := keyToSendOnUp
            keyToSendOnUp := ""
            processKeyToSend(temp)
            debug(temp . "|^^^^^^ on alternative layout released before")
        }
        
        return
    }

    debug(key . "|NOT SENT CAUSE CONSUMED")
}

timerTimeoutSendLayoutKey()
{
    SetTimer, TimerTimeoutSendLayoutKey, OFF
    sendLayoutKey := false
    if (keyToSendOnUp)
    {
        temp := keyToSendOnUp
        keyToSendOnUp := ""
        key := alternativeLayout[temp]
        processKeyToSend(key)
        processKeyOnRelease := false
        layoutKeyActivatesProcessKeyOnRelease := false
        debug(key . "|---*** on alternative layout hard pressed and send key on up")            
    }

}

timerProcessLayoutOnRelease()
{
    SetTimer, TimerProcessLayoutOnRelease, OFF
    layoutKeyActivatesProcessKeyOnRelease := false
}
