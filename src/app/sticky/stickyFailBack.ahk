global timerTimeoutStickyKeys := 2000

; if the cpu is executing intensive tasks then the lift key up command may not be processed for 
; modifier keys (ctrl, shift, alt, win) and they are still registered by the os as pressed.
; This is a fail safe for such situations
timerStickyFailBack()
{
    WinGetTitle, activeProgramWindowName, A
    for index,key in disabledApps
    {
        IfInString, activeProgramWindowName, %key%
        {
            resetStates()
            SetTimer, TimerStickyFailBack, off
            return
        }
    }

    for index, key in monitoredStickyKeys
    {
        if (GetKeyState(key, "P"))
        {
            return
        }
    }

    resetStates()
    SetTimer, TimerStickyFailBack, off
}

resetStates()
{
    if (shiftActive)
    {
        send {shift up}
    }

    if (altActive)
    {
        send {alt up}
    }

    send {ctrl up}
    if (winActive)
    {
        send {lwin up}
    }

    if (winActive)
    {
        send {lwin up}
    }
    resetDoubledModifierClickDrag("leftCtrlClick", sendUnClickOnLeftCtrlClickRelease)
    resetDoubledModifierClickDrag("shiftClick", sendUnClickOnShiftClickRelease)
    resetDoubledModifierClickDrag("altClick", sendUnClickOnAltClickRelease)
    resetDoubledModifierClickDrag("winClick", sendUnClickOnWinClickRelease)
    isLeftCtrlDoubledAsClickPressed := false
    isAltDoubledAsClickPressed := false
    isWinDoubledAsClickPressed := false
    isShiftDoubledAsClickPressed := false
    sendUnClickOnLeftCtrlClickRelease := false
    sendUnClickOnAltClickRelease := false
    sendUnClickOnShiftClickRelease := false
    sendUnClickOnWinClickRelease := false
    activePressedKeys := []
    processKeyOnRelease := false
    layoutKeyPressed := false
    SetTimer, TimerScrollWithMouseMovement, OFF
    systemCursor(1)
    alternativeLayoutActive := false 
    sendLayoutKey := false
    keyToSendOnUp := ""
    lastKeyProcessedAsAlternative := ""
    ctrlActive := false
    altActive := false
    shiftActive := false
    winActive := false

    for index, key in monitoredStickyKeys
    {
        if (key = "capslock")
        {
            SetCapsLockState, off
        }
    }
}
