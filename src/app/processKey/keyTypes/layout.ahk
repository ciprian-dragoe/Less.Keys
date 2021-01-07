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
            if (keyToSendOnUp)
            {
                temp := keyToSendOnUp
                keyToSendOnUp := ""
                debug(key . " sent on up")
                debug(temp . "|^^^^^^ on alternative layout released before")
                send {blind}%activeModifiers%{%key%}
                processKeyToSend(temp)
            }
            else
            {
                debug(key . " sent on up")
                send {blind}%activeModifiers%{%key%}
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
        temp := keyToSendOnUp
        keyToSendOnUp := ""
        key := alternativeLayout[temp]
        debug(key . "|---*** on alternative layout hard pressed and send key on up")
        processKeyToSend(key)
    }

}

timerProcessLayoutOnRelease()
{
    SetTimer, TimerProcessLayoutOnRelease, OFF
    layoutKeyActivatesProcessKeyOnRelease := false
}
