global sendClickOnShiftClickRelease := false
global sendUnClickOnShiftClickRelease := false
global isShiftDoubledAsClickPressed := false
global shiftActiveBeforeShiftClickPress
global doubledShiftMouseHook



processShiftDoubledAsClick(state)
{
    if (state)
    {
        doubledShiftDown()
    }
    else
    {
        doubledShiftUp()
    }
}

doubledShiftDown()
{
    if (isShiftDoubledAsClickPressed)
    {
        return
    }
    
    isShiftDoubledAsClickPressed := true
    
    SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%

    if (isCtrlDoubledAsClickPressed || isWinDoubledAsClickPressed || isAltDoubledAsClickPressed) {
        setShiftState(1)
        setTimer TimerMonitorShiftModifierLift, 20
        return
    }

    if (shiftActive)
    {
        shiftActiveBeforeShiftClickPress := true
        sendDoubledValueAndReset("shiftClick", sendClickOnShiftClickRelease)
        chooseClickDragActivation("shiftClick", "MouseDragShiftActivate", doubledShiftMouseHook)
        return
    }
    
    shiftActive := 1

    if (!layoutKeyPressed && activePressedKeys.Length() = 0)
    {        
        sendClickOnShiftClickRelease := true
        chooseClickDragActivation("shiftClick", "MouseDragShiftActivate", doubledShiftMouseHook)
    }
}

MouseDragShiftActivate(nCode, wParam, lParam)
{
    cancelMouseHook(doubledShiftMouseHook)
    if (wParam = 0x200)
    {
        sendClickOnShiftClickRelease := false
        sendUnClickOnShiftClickRelease := true
        doubledAction := modifierDoubledAsClick["shiftClick"]
        send {blind}{%doubledAction% down}
    }
}

doubledShiftUp()
{
    cancelMouseHook(doubledShiftMouseHook)
    isShiftDoubledAsClickPressed := false

    if (shiftActiveBeforeShiftClickPress)
    {
        shiftActiveBeforeShiftClickPress := false
    }
    else
    {
        shiftActive := 0
    }

    resetDoubledModifierClickDrag("shiftClick", sendUnClickOnShiftClickRelease)

    if (sendClickOnShiftClickRelease)
    {
        sendDoubledValueAndReset("shiftClick", sendClickOnShiftClickRelease)
    }
}

activateShiftWithKey(key)
{
    if (!GetKeyState("shift"))
    {
        send {shift down}
        setTimer TimerMonitorShiftModifierLift, 20
    }
    send {blind}%key%
}

timerMonitorShiftModifierLift()
{
    if (!shiftActive)
    {
        send {shift up}
        setTimer TimerMonitorShiftModifierLift, off
    }
}