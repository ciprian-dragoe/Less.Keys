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
    debug("resetSticky")
    tempShiftState := shiftActive
    tempCtrlState := ctrlActive
    tempWinState := WinActive
    tempAltState := altActive
    tempShiftState := shiftActive
    tempShiftState := shiftActive
    tempLeftCtrlDownState := isLeftCtrlClickDown
    tempLeftAltDownState := isLeftAltClickDown
    tempLeftShiftDownState := isLeftShiftClickDown
    tempLeftWinDownState := isLeftWinClickDown
    tempRightCtrlDownState := isRightCtrlClickDown
    tempRightAltDownState := isRightAltClickDown
    tempRightShiftDownState := isRightShiftClickDown
    tempRightWinDownState := isRightWinClickDown

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
    alternativeLayoutActive := false
    sendLayoutKey := false
    keyToSendOnUp := ""
    lastKeyProcessedAsAlternative := ""
    ctrlActive := false
    altActive := false
    shiftActive := false
    winActive := false

    systemCursor(1)
    SetTimer, TimerScrollWithMouseMovement, OFF
    if (tempShiftState)
    {
        send {shift up}
    }

    if (tempAltState)
    {
        send {alt up}
    }

    if (tempCtrlState)
    {
        send {ctrl up}
    }

    if (tempWinState)
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
    if (tempShiftState || tempAltState || tempCtrlState || tempWinState || isLeftCtrlClickDown || isLeftShiftClickDown || isLeftAltClickDown || isLeftWinClickDown || isRightWinClickDown || isRightCtrlClickDown || isRightShiftClickDown || isRightShiftClickDown) {
        storeDebugData()
    }
}
