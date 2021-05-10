; if the cpu is executing intensive tasks then the lift key up command may not be processed for
; modifier keys (ctrl, shift, alt, win) and they are still registered by the os as pressed.
; This is a fail safe for such situations
timerStickyFailBack()
{
    if (isMonitoredStickyKeyPressed())
    {
        return
    }
    resetStates()
}

isMonitoredStickyKeyPressed()
{
    for index, key in monitoredStickyKeys
    {
        isPressed := GetKeyState(key, "P")
        if (isPressed)
        {
            return true
        }
    }
    return false
}

isSpontaneousFalsePositiveLift()
{
    ; sometimes ahk detects a key as lifed although it is still physically pressed
    ; double check for such situations again all keys a little milliseconds later
    sleep 40
    if (isMonitoredStickyKeyPressed())
    {
        return true
    }
    return false
}

resetStates()
{
    if (isSpontaneousFalsePositiveLift())
    {
        return
    }
    debug("--- RESET STICKY")


    if (shiftState)
    {
        debug("================================= shift sticky")
        send {shift up}
        storeDebugData()
    }
    if (ctrlState)
    {
        debug("================================= ctrl sticky")
        send {ctrl up}
        storeDebugData()
    }
    if (altState)
    {
        debug("================================= alt sticky")
        send {alt up}
        storeDebugData()
    }
    if (winState)
    {
        debug("================================= win sticky")
        send {win up}
        storeDebugData()
    }

    SetTimer, TimerScrollWithMouseMovement, OFF
    systemCursor(1)

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

    isLeftCtrlDoubledAsClickPressed := false
    isLeftShiftDoubledAsClickPressed := false
    isLeftAltDoubledAsClickPressed := false
    isLeftWinDoubledAsClickPressed := false
    isRightAltDoubledAsClickPressed := false
    isRightWinDoubledAsClickPressed := false
    isRightCtrlDoubledAsClickPressed := false
    isRightShiftDoubledAsClickPressed := false
    resetDoubledModifierClickDrag("leftCtrlClick", isLeftCtrlClickDown)
    resetDoubledModifierClickDrag("leftShiftClick", isLeftShiftClickDown)
    resetDoubledModifierClickDrag("leftAltClick", isLeftAltClickDown)
    resetDoubledModifierClickDrag("leftWinClick", isLeftWinClickDown)
    resetDoubledModifierClickDrag("rightWinClick", isRightWinClickDown)
    resetDoubledModifierClickDrag("rightCtrlClick", isRightCtrlClickDown)
    resetDoubledModifierClickDrag("rightShiftClick", isRightShiftClickDown)
    resetDoubledModifierClickDrag("rightAltClick", isRightAltClickDown)

}
