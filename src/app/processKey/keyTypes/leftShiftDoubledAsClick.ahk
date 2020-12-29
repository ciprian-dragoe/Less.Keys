global sendClickOnLeftShiftClickRelease := false
global isLeftShiftDoubledAsClickPressed := false
global leftShiftActiveBeforeShiftClickPress := false
global doubledLeftShiftMouseHook := 0
global isLeftShiftClickDown := false



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
    
    if (isLeftCtrlDoubledAsClickPressed || isLeftWinDoubledAsClickPressed || isLeftAltDoubledAsClickPressed)
    {
        if (isRightShiftDoubledAsClickPressed)
        {
            setShiftState(1)
            setTimer TimerMonitorShiftModifierLift, 20
        }
        resetSendClickOnLeftModifierRelease(1)
        setShiftState(1)
        setTimer TimerMonitorShiftModifierLift, 20
        return
    }

    if (shiftActive || isRightAltDoubledAsClickPressed || isRightCtrlDoubledAsClickPressed || isRightWinDoubledAsClickPressed)
    {
        leftShiftActiveBeforeShiftClickPress := true
        resetSendClickOnRightModifierRelease(1)
        sendDoubledValueAndReset("leftShiftClick", sendClickOnLeftShiftClickRelease, isLeftShiftClickDown)
        return
    }
    
    shiftActive := 1

    if (!layoutKeyPressed && activePressedKeys.Length() = 0)
    {        
        sendClickOnLeftShiftClickRelease := true
        chooseClickDragActivation("leftShiftClick", "mouseDragLeftShiftActivate", doubledLeftShiftMouseHook)
        setTimer TimerResetModifierReleaseAction, %timeoutStillSendLayoutKey%
    }
}

mouseDragLeftShiftActivate(nCode, wParam, lParam)
{
    cancelMouseHook(doubledLeftShiftMouseHook)
    if (wParam = 0x200)
    {
        sendClickOnLeftShiftClickRelease := false
        isLeftShiftClickDown := true
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

    resetDoubledModifierClickDrag("leftShiftClick", isLeftShiftClickDown)

    if (sendClickOnLeftShiftClickRelease)
    {
        sendDoubledValueAndReset("leftShiftClick", sendClickOnLeftShiftClickRelease, isLeftShiftClickDown)
    }
}