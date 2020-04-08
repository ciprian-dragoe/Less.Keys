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
        layoutKeyPressed := true
        if (spaceAsClick)
        {
            MOUSE_DRAG_ACTIVE := false
            SetTimer, timerTimeoutSpaceAsMouseClick, off
            SetTimer, TimerClickDrag, 10
            alternativeLayoutActive := true
            return
        }
        if (timeoutMouseScrollPoll) {
            CoordMode, Mouse, Screen
            MouseGetPos, initialMousePositionXAxis, initialMousePositionYAxis
            SetTimer, TimerGetMouseMovement, %timeoutMouseScrollPoll%
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


manageLayoutKeyUp(key)
{
    SetTimer, TimerClickDrag, off
    if (MOUSE_DRAG_ACTIVE)
    {
        send {blind}{LButton up}
    }
    else if (spaceAsClick)
    {
        send {blind}{LButton}
    }
    MOUSE_DRAG_ACTIVE := false
    
    SetTimer, TimerGetMouseMovement, OFF
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
            processKeyToSend(keyToSendOnUp)
            debug(keyToSendOnUp . "|^^^^^^ on alternative layout released before")
            keyToSendOnUp := ""
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
        key := alternativeLayout[keyToSendOnUp]
        processKeyToSend(key)
        processKeyOnRelease := false
        layoutKeyActivatesProcessKeyOnRelease := false
        keyToSendOnUp := ""
        debug(key . "|---*** on alternative layout hard pressed and send key on up")            
    }

}

timerProcessLayoutOnRelease()
{
    SetTimer, TimerProcessLayoutOnRelease, OFF
    layoutKeyActivatesProcessKeyOnRelease := false
}
