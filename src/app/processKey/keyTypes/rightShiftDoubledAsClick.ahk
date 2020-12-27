global sendClickOnRightShiftClickRelease := false
global isRightShiftDoubledAsClickPressed := false
global rightShiftActiveBeforeShiftClickPress
global doubledRightShiftMouseHook := 0
global isRightShiftDown := false



processRightShiftDoubledAsClick(state)
{
    if (state)
    {
        doubledRightShiftDown()
    }
    else
    {
        doubledRightShiftUp()
    }
}

doubledRightShiftDown()
{
    if (isRightShiftDoubledAsClickPressed)
    {
        return
    }
    
    isRightShiftDoubledAsClickPressed := true

    if (isRightCtrlDoubledAsClickPressed || isRightWinDoubledAsClickPressed || isRightAltDoubledAsClickPressed) {
        setShiftState(1)
        setTimer TimerMonitorShiftModifierLift, 20
        return
    }

    if (shiftActive || isLeftAltDoubledAsClickPressed || isLeftCtrlDoubledAsClickPressed || isLeftWinDoubledAsClickPressed)
    {
        rightShiftActiveBeforeShiftClickPress := true
        resetSendClickOnLeftModifierRelease(1)
        sendDoubledValueAndReset("rightShiftClick", sendClickOnRightShiftClickRelease, isRightShiftDown)
        if (!isRightShiftDown)
        {
            chooseClickDragActivation("rightShiftClick", "mouseDragRightShiftActivate", doubledRightShiftMouseHook)
        }
        return
    }
    
    shiftActive := 1

    if (!layoutKeyPressed && activePressedKeys.Length() = 0)
    {        
        sendClickOnRightShiftClickRelease := true
        chooseClickDragActivation("rightShiftClick", "mouseDragRightShiftActivate", doubledRightShiftMouseHook)
        setTimer TimerResetModifierReleaseAction, %timeoutStillSendLayoutKey%
    }
}

mouseDragRightShiftActivate(nCode, wParam, lParam)
{
    cancelMouseHook(doubledRightShiftMouseHook)
    if (wParam = 0x200)
    {
        sendClickOnRightShiftClickRelease := false
        isRightShiftDown := true
        doubledAction := modifierDoubledAsClick["rightShiftClick"]
        send {blind}{%doubledAction% down}
    }
}

doubledRightShiftUp()
{
    cancelMouseHook(doubledRightShiftMouseHook)
    isRightShiftDoubledAsClickPressed := false

    if (rightShiftActiveBeforeShiftClickPress)
    {
        rightShiftActiveBeforeShiftClickPress := false
    }
    else
    {
        shiftActive := 0
    }

    resetDoubledModifierClickDrag("rightShiftClick", isRightShiftDown)

    if (sendClickOnRightShiftClickRelease)
    {
        sendDoubledValueAndReset("rightShiftClick", sendClickOnRightShiftClickRelease, isRightShiftDown)
    }
}