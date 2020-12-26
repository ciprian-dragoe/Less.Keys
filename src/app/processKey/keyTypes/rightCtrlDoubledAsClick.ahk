global sendClickOnRightCtrlClickRelease := false
global sendUnClickOnRightCtrlClickRelease := false
global isRightCtrlDoubledAsClickPressed := false
global rightCtrlActiveBeforeCtrlClickPress := false
global doubledRightCtrlMouseHook



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
    
    SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%

    if (isShiftDoubledAsClickPressed || isWinDoubledAsClickPressed || isAltDoubledAsClickPressed)
    {
        setCtrlState(1)
        setTimer TimerMonitorCtrlModifierLift, 20
        return
    }

    if (ctrlActive || isLeftAltDoubledAsClickPressed || isLeftShiftDoubledAsClickPressed || isLeftWinDoubledAsClickPressed)
    {
        rightCtrlActiveBeforeCtrlClickPress := true
        resetSendClickOnLeftModifierRelease(1)
        sendDoubledValueAndReset("rightCtrlClick", sendClickOnRightCtrlClickRelease)
        chooseClickDragActivation("rightCtrlClick", "MouseDragRightCtrlActivate", doubledRightCtrlMouseHook)
        return
    }
    
    ctrlActive := 1

    if (!layoutKeyPressed && activePressedKeys.Length() = 0)
    {
        sendClickOnRightCtrlClickRelease := true
        chooseClickDragActivation("rightCtrlClick", "mouseDragRightCtrlActivate", doubledRightCtrlMouseHook)
    }
}

mouseDragRightCtrlActivate(nCode, wParam, lParam)
{
    cancelMouseHook(doubledRightCtrlMouseHook)
    if (wParam = 0x200)
    {
        sendClickOnRightCtrlClickRelease := false
        sendUnClickOnRightCtrlClickRelease := true
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
    
    resetDoubledModifierClickDrag("rightCtrlClick", sendUnClickOnRightCtrlClickRelease)

    if (sendClickOnRightCtrlClickRelease)
    {
        sendDoubledValueAndReset("rightCtrlClick", sendClickOnRightCtrlClickRelease)
    }
}