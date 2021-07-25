; if the cpu is executing intensive tasks then the lift key up command may not be processed for
; modifier keys (ctrl, shift, alt, win) and they are still registered by the os as pressed.
; This is a fail safe for such situations
timerStickyFailBack()
{
    SetTimer TimerStickyFailBack, off

    if (!isAllMonitoredStickyKeysLifted())
    {
        SetTimer TimerStickyFailBack, 500
        return
    }

    setTimer TimerCheckAgainIfTimerTriggeredBeforeKeyLift, 100
}

isAllMonitoredStickyKeysLifted()
{
    for index, key in monitoredStickyKeys
    {
        if (getKeyState(key, "P") || getDllKeyState(key))
        {
            return 0
        }
    }

    return 1
}

timerCheckAgainIfTimerTriggeredBeforeKeyLift()
{
    setTimer TimerCheckAgainIfTimerTriggeredBeforeKeyLift, OFF
    if (isAllMonitoredStickyKeysLifted())
    {
        resetStates()
    }
}

getDllKeyState(key)
{
    keyCode := GetKeyVK(key)
    discardHistory := dllcall("GetAsyncKeyState", "uint", keyCode)
    keyPressedState := dllcall("GetAsyncKeyState", "uint", keyCode)
    return keyPressedState
}

resetStates()
{
    debug("---RESET STICKY")

    if (shiftState || GetKeyState("shift"))
    {
        debug("================================= shift sticky")
        send {shift up}
        shiftState := 0
        storeDebugData(shift)
    }
    if (ctrlState || GetKeyState("ctrl"))
    {
        debug("================================= ctrl sticky")
        send {ctrl up}
        ctrlState := 0
        storeDebugData("ctrl")
    }
    if (altState || GetKeyState("alt"))
    {
        debug("================================= alt sticky")
        resetModifierWithoutTriggerUpState("alt", altActive)
        storeDebugData("alt")
    }
    if (winState || GetKeyState("lwin"))
    {
        debug("================================= win sticky")
        resetModifierWithoutTriggerUpState("lwin", winActive)
        storeDebugData("win")
    }

    if (layoutKeyPressed)
    {
        SetTimer, TimerScrollWithMouseMovement, OFF
        systemCursor(1)
        layoutKeyPressed := 0
        debug("================================= space sticky")
        storeDebugData("space")
    }

    resetDoubledModifierClickDrag("leftCtrlClick", isLeftCtrlClickDown)
    resetDoubledModifierClickDrag("leftShiftClick", isLeftShiftClickDown)
    resetDoubledModifierClickDrag("leftAltClick", isLeftAltClickDown)
    resetDoubledModifierClickDrag("leftWinClick", isLeftWinClickDown)
    resetDoubledModifierClickDrag("rightWinClick", isRightWinClickDown)
    resetDoubledModifierClickDrag("rightCtrlClick", isRightCtrlClickDown)
    resetDoubledModifierClickDrag("rightShiftClick", isRightShiftClickDown)
    resetDoubledModifierClickDrag("rightAltClick", isRightAltClickDown)

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
    isNormalShiftActive := false
    isNormalCtrlActive := false
    isNormalAltActive := false
    isNormalWinActive := false

    isLeftCtrlDoubledAsClickPressed := false
    isLeftShiftDoubledAsClickPressed := false
    isLeftAltDoubledAsClickPressed := false
    isLeftWinDoubledAsClickPressed := false
    isRightAltDoubledAsClickPressed := false
    isRightWinDoubledAsClickPressed := false
    isRightCtrlDoubledAsClickPressed := false
    isRightShiftDoubledAsClickPressed := false
}
