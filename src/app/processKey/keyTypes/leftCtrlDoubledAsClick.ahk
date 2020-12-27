global sendClickOnLeftCtrlClickRelease := false
global isLeftCtrlDoubledAsClickPressed := false
global leftCtrlActiveBeforeCtrlClickPress := false
global doubledLeftCtrlMouseHook := 0
global isLeftCtrlClickDown := false



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
    
    if (isLeftShiftDoubledAsClickPressed || isLeftWinDoubledAsClickPressed || isLeftAltDoubledAsClickPressed)
    {
        resetSendClickOnLeftModifierRelease(1)
        setCtrlState(1)
        setTimer TimerMonitorCtrlModifierLift, 20
        return
    }

    if (ctrlActive || isRightAltDoubledAsClickPressed || isRightShiftDoubledAsClickPressed || isRightWinDoubledAsClickPressed)
    {
        leftCtrlActiveBeforeCtrlClickPress := true
        resetSendClickOnRightModifierRelease(1)
        sendDoubledValueAndReset("leftCtrlClick", sendClickOnLeftCtrlClickRelease, isLeftCtrlClickDown)
        if (!isLeftCtrlClickDown)
        {
            chooseClickDragActivation("leftCtrlClick", "mouseDragLeftCtrlActivate", doubledLeftCtrlMouseHook)
        }
        return
    }
    
    ctrlActive := 1

    if (!layoutKeyPressed && activePressedKeys.Length() = 0)
    {
        sendClickOnLeftCtrlClickRelease := true
        chooseClickDragActivation("leftCtrlClick", "mouseDragLeftCtrlActivate", doubledLeftCtrlMouseHook)
        setTimer TimerResetModifierReleaseAction, %timeoutStillSendLayoutKey%
    }
}

mouseDragLeftCtrlActivate(nCode, wParam, lParam)
{
    cancelMouseHook(doubledLeftCtrlMouseHook)
    if (wParam = 0x200)
    {
        sendClickOnLeftCtrlClickRelease := false
        isLeftCtrlClickDown := true
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
    
    resetDoubledModifierClickDrag("leftCtrlClick", isLeftCtrlClickDown)

    if (sendClickOnLeftCtrlClickRelease)
    {
        sendDoubledValueAndReset("leftCtrlClick", sendClickOnLeftCtrlClickRelease, isLeftCtrlClickDown)
    }
}