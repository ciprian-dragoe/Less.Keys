global sendClickOnRightCtrlClickRelease := false
global isRightCtrlDoubledAsClickPressed := false
global rightCtrlActiveBeforeCtrlClickPress := false
global doubledRightCtrlMouseHook := 0
global isRightCtrlClickDown := false



processRightCtrlDoubledAsClick(state)
{
    if (state)
    {
        doubledRightCtrlDown()
    }
    else
    {
        doubledRightCtrlUp()
    }
}

doubledRightCtrlDown()
{
    if (isRightCtrlDoubledAsClickPressed)
    {
        return
    }

    isRightCtrlDoubledAsClickPressed := true
    
    if (isRightShiftDoubledAsClickPressed || isRightWinDoubledAsClickPressed || isRightAltDoubledAsClickPressed)
    {
        resetSendClickOnRightModifierRelease(1)
        setCtrlState(1)
        setTimer TimerMonitorCtrlModifierLift, 20
        return
    }

    if (ctrlActive || isLeftAltDoubledAsClickPressed || isLeftShiftDoubledAsClickPressed || isLeftWinDoubledAsClickPressed)
    {
        rightCtrlActiveBeforeCtrlClickPress := true
        resetSendClickOnLeftModifierRelease(1)
        sendDoubledValueAndReset("rightCtrlClick", sendClickOnRightCtrlClickRelease, isRightCtrlClickDown)
        return
    }
    
    ctrlActive := 1

    if (!layoutKeyPressed && activePressedKeys.Length() = 0)
    {
        sendClickOnRightCtrlClickRelease := true
        chooseClickDragActivation("rightCtrlClick", "mouseDragRightCtrlActivate", doubledRightCtrlMouseHook)
        setTimer TimerResetModifierReleaseAction, %timeoutStillSendLayoutKey%
    }
}

mouseDragRightCtrlActivate(nCode, wParam, lParam)
{
    cancelMouseHook(doubledRightCtrlMouseHook)
    if (wParam = 0x200)
    {
        sendClickOnRightCtrlClickRelease := false
        isRightCtrlClickDown := true
        doubledAction := modifierDoubledAsClick["rightCtrlClick"]
        send {blind}{%doubledAction% down}
    }
}

doubledRightCtrlUp()
{
    cancelMouseHook(doubledRightCtrlMouseHook)
    isRightCtrlDoubledAsClickPressed := false

    if (rightCtrlActiveBeforeCtrlClickPress)
    {
        rightCtrlActiveBeforeCtrlClickPress := false
    }
    else
    {
        ctrlActive := 0
    }
    
    resetDoubledModifierClickDrag("rightCtrlClick", isRightCtrlClickDown)

    if (sendClickOnRightCtrlClickRelease)
    {
        sendDoubledValueAndReset("rightCtrlClick", sendClickOnRightCtrlClickRelease, isRightCtrlClickDown)
    }
}