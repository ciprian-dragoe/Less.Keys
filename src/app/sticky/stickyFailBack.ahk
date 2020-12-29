global timerTimeoutStickyKeys := 1000

; if the cpu is executing intensive tasks then the lift key up command may not be processed for
; modifier keys (ctrl, shift, alt, win) and they are still registered by the os as pressed.
; This is a fail safe for such situations
timerStickyFailBack()
{
    for index,app in disabledApps
    {
        IfInString, lastActiveAppName, %app%
        {
            resetStates()
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
}

resetStates()
{
    SetTimer, TimerStickyFailBack, off

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
    resetDoubledModifierClickDrag("leftCtrlClick", isLeftCtrlClickDown)
    resetDoubledModifierClickDrag("leftShiftClick", isLeftShiftClickDown)
    resetDoubledModifierClickDrag("leftAltClick", isLeftAltClickDown)
    resetDoubledModifierClickDrag("leftWinClick", isLeftWinClickDown)
    resetDoubledModifierClickDrag("rightWinClick", isRightWinClickDown)
    resetDoubledModifierClickDrag("rightCtrlClick", isRightCtrlClickDown)
    resetDoubledModifierClickDrag("rightShiftClick", isRightShiftClickDown)
    resetDoubledModifierClickDrag("rightAltClick", isRightAltClickDown)
    isLeftCtrlDoubledAsClickPressed := false
    isLeftShiftDoubledAsClickPressed := false
    isLeftAltDoubledAsClickPressed := false
    isLeftWinDoubledAsClickPressed := false
    isRightAltDoubledAsClickPressed := false
    isRightWinDoubledAsClickPressed := false
    isRightCtrlDoubledAsClickPressed := false
    isRightShiftDoubledAsClickPressed := false
    sendUnClickOnLeftCtrlClickRelease := false
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
