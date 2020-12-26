global sendClickOnLeftShiftClickRelease := false
global sendUnClickOnLeftShiftClickRelease := false
global isLeftShiftDoubledAsClickPressed := false
global leftShiftActiveBeforeShiftClickPress
global doubledLeftShiftMouseHook



processLeftShiftDoubledAsClick(state)
{
    if (state)
    {
        doubledLeftShiftDown()
    }
    else
    {
        doubledLeftShiftUp()
    }
}

doubledLeftShiftDown()
{
    if (isLeftShiftDoubledAsClickPressed)
    {
        return
    }
    
    isLeftShiftDoubledAsClickPressed := true
    
    SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%

    if (isLeftCtrlDoubledAsClickPressed || isWinDoubledAsClickPressed || isAltDoubledAsClickPressed) {
        setShiftState(1)
        setTimer TimerMonitorShiftModifierLift, 20
        return
    }

    if (shiftActive)
    {
        leftShiftActiveBeforeShiftClickPress := true
        sendDoubledValueAndReset("leftShiftClick", sendClickOnLeftShiftClickRelease)
        chooseClickDragActivation("leftShiftClick", "MouseDragLeftShiftActivate", doubledLeftShiftMouseHook)
        return
    }
    
    shiftActive := 1

    if (!layoutKeyPressed && activePressedKeys.Length() = 0)
    {        
        sendClickOnLeftShiftClickRelease := true
        chooseClickDragActivation("leftShiftClick", "mouseDragLeftShiftActivate", doubledLeftShiftMouseHook)
    }
}

mouseDragLeftShiftActivate(nCode, wParam, lParam)
{
    cancelMouseHook(doubledLeftShiftMouseHook)
    if (wParam = 0x200)
    {
        sendClickOnLeftShiftClickRelease := false
        sendUnClickOnLeftShiftClickRelease := true
        doubledAction := modifierDoubledAsClick["leftShiftClick"]
        send {blind}{%doubledAction% down}
    }
}

doubledLeftShiftUp()
{
    cancelMouseHook(doubledLeftShiftMouseHook)
    isLeftShiftDoubledAsClickPressed := false

    if (leftShiftActiveBeforeShiftClickPress)
    {
        leftShiftActiveBeforeShiftClickPress := false
    }
    else
    {
        shiftActive := 0
    }

    resetDoubledModifierClickDrag("leftShiftClick", sendUnClickOnLeftShiftClickRelease)

    if (sendClickOnLeftShiftClickRelease)
    {
        sendDoubledValueAndReset("leftShiftClick", sendClickOnLeftShiftClickRelease)
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