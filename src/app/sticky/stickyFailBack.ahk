global timerTimeoutStickyKeys := 2000

; if the cpu is executing intensive tasks then the lift key up command may not be processed for 
; modifier keys (ctrl, shift, alt, win) and they are still registered by the os as pressed.
; This is a fail safe for such situations
timerStickyFailBack() 
{
    resetCapsLock := false
    for index, key in monitoredStickyKeys
    {
        if (key = "capslock")
        {
            resetCapsLock := true
        }
        
        if (GetKeyState(key, "P"))
        {
            return
        }
    }
    
    resetStates()
    if (resetCapsLock)
    {
        SetCapsLockState, off
    }
    
    SetTimer, TimerStickyFailBack, off
}

resetStates()
{
    if (showRealTimeDebugInfo)
    {
        showToolTip("reset states")
    }
    send {shift up}
    if (altActive)
    {
        send {alt up}
    }
    send {ctrl up}
    if (winActive)
    {
        send {lwin up}
    }
    resetShiftClickDrag()
    resetDoubledModifierClickDrag("ctrlClick", sendUnClickOnCtrlClickRelease)
    resetWinClickDrag()
    resetAltClickDrag()
    isCtrlDoubledAsClickPressed := false
    isAltDoubledAsClickPressed := false
    isWinlDoubledAsClickPressed := false
    isShiftDoubledAsClickPressed := false
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
}
