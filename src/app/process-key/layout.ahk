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
            if (timerDelaySpaceAsClick)
            {
                SetTimer, CheckRecentMouseMovemet, off
                SetTimer, TimerSendDelayMouseClick, %timerDelaySpaceAsClick%
                timerDelaySpaceAsClick := 0
            }
            else
            {
                SendInput {Blind}{LButton Down}
            }
            sendLayoutKey := false
            alternativeLayoutActive := true
            SetTimer, TimerTimeoutSpaceAsMouseClick, off
            return
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
    SendInput {Blind}{LButton Up}
    SetTimer, TimerTimeoutSpaceAsMouseClick, %timeoutSpaceAsClick%
    SetTimer, TimerSendDelayMouseClick, off
    SetTimer, CheckRecentMouseMovemet, 100
    timerDelaySpaceAsClick := 100
    SetTimer, TimerResetDelaySpaceAsClick, off
    SetTimer, TimerResetDelaySpaceAsClick, %timerDelaySpaceAsClick%
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

timerSendDelayMouseClick()
{
    ;showtooltip("timerSendDelayMouseClick")
    SetTimer, TimerSendDelayMouseClick, OFF
    if (spaceAsClick)
    {
        SendInput {Blind}{LButton Down}
    }
}

timerResetDelaySpaceAsClick()
{
    timerDelaySpaceAsClick := 0
    SetTimer TimerResetDelaySpaceAsClick, off
}
