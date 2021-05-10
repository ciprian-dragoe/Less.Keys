global alternativeLayoutActive
global layoutKeyActivatesProcessKeyOnRelease
global layoutKeyPressed
global alternativeLayoutActive



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

manageLayoutKeyUp(key)
{
    SetTimer, TimerScrollWithMouseMovement, OFF
    SetTimer, TimerTimeoutSendLayoutKey, OFF
    systemCursor(1)
    
    layoutKeyPressed := false
    processKeyOnRelease := false
    layoutKeyActivatesProcessKeyOnRelease := false
    alternativeLayoutActive := false
    if (sendLayoutKey)
    {   
        activeModifiers := getActiveModifiers(key)
        buffer := keyToSendOnUp
        keyToSendOnUp := ""
        if (!processAhkKeyboardShortcuts(activeModifiers, key))
        {
            if (buffer)
            {
                debug(key . " sent on up")
                debug(buffer . "|^^^^^^ on alternative layout released before")
                processKeyToSend(key)
                processKeyToSend(buffer)
            }
            else
            {
                debug(key . " sent on up")
                processKeyToSend(key)
            }
        }
        return
    }

    debug(key . "|UP NOT SENT CAUSE CONSUMED")
}

timerTimeoutSendLayoutKey()
{
    SetTimer, TimerTimeoutSendLayoutKey, OFF
    sendLayoutKey := false
    if (keyToSendOnUp)
    {
        processKeyOnRelease := false
        layoutKeyActivatesProcessKeyOnRelease := false
        buffer := keyToSendOnUp
        keyToSendOnUp := ""
        key := alternativeLayout[buffer]
        debug(key . "|---*** on alternative layout hard pressed and send key on up")
        processKeyToSend(key)
    }

}

timerProcessLayoutOnRelease()
{
    SetTimer, TimerProcessLayoutOnRelease, OFF
    layoutKeyActivatesProcessKeyOnRelease := false
}
