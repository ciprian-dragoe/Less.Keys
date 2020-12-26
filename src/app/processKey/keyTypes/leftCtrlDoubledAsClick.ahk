global sendClickOnLeftCtrlClickRelease := false
global sendUnClickOnLeftCtrlClickRelease := false
global isLeftCtrlDoubledAsClickPressed := false
global leftCtrlActiveBeforeCtrlClickPress := false
global doubledLeftCtrlMouseHook



processLeftCtrlDoubledAsClick(state)
{

    if (state)
    {
        doubledLeftCtrlDown()
    }
    else
    {
        doubledLeftCtrlUp()
    }
}

doubledLeftCtrlDown()
{
    if (isLeftCtrlDoubledAsClickPressed)
    {
        return
    }
    
    isLeftCtrlDoubledAsClickPressed := true
    
    SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%

    if (isShiftDoubledAsClickPressed || isWinDoubledAsClickPressed || isAltDoubledAsClickPressed)
    {
        setCtrlState(1)
        setTimer TimerMonitorCtrlModifierLift, 20
        return
    }

    if (ctrlActive || isRightAltDoubledAsClickPressed || isRightShiftDoubledAsClickPressed || isRightWinDoubledAsClickPressed)
    {
        leftCtrlActiveBeforeCtrlClickPress := true
        resetSendClickOnRightModifierRelease(1)
        sendDoubledValueAndReset("leftCtrlClick", sendClickOnLeftCtrlClickRelease)
        chooseClickDragActivation("leftCtrlClick", "MouseDragLeftCtrlActivate", doubledLeftCtrlMouseHook)
        return
    }
    
    ctrlActive := 1

    if (!layoutKeyPressed && activePressedKeys.Length() = 0)
    {
        sendClickOnLeftCtrlClickRelease := true
        chooseClickDragActivation("leftCtrlClick", "mouseDragLeftCtrlActivate", doubledLeftCtrlMouseHook)
    }
}

mouseDragLeftCtrlActivate(nCode, wParam, lParam)
{
    cancelMouseHook(doubledLeftCtrlMouseHook)
    if (wParam = 0x200)
    {
        sendClickOnLeftCtrlClickRelease := false
        sendUnClickOnLeftCtrlClickRelease := true
        doubledAction := modifierDoubledAsClick["leftCtrlClick"]
        send {blind}{%doubledAction% down}
    }
}

doubledLeftCtrlUp()
{
    cancelMouseHook(doubledLeftCtrlMouseHook)
    isLeftCtrlDoubledAsClickPressed := false

    if (leftCtrlActiveBeforeCtrlClickPress)
    {
        leftCtrlActiveBeforeCtrlClickPress := false
    }
    else
    {
        ctrlActive := 0
    }
    
    resetDoubledModifierClickDrag("leftCtrlClick", sendUnClickOnLeftCtrlClickRelease)

    if (sendClickOnLeftCtrlClickRelease)
    {
        sendDoubledValueAndReset("leftCtrlClick", sendClickOnLeftCtrlClickRelease)
    }
}