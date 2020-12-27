global sendClickOnLeftWinClickRelease := false
global isLeftWinDoubledAsClickPressed := false
global leftWinActiveBeforeWinClickPress := false
global doubledLeftWinMouseHook := 0
global isLeftWinClickDown := false



processLeftWinDoubledAsClick(state)
{
    if (state)
    {
        doubledLeftWinDown()
    }
    else
    {
        doubledLeftWinUp()
    }
}

doubledLeftWinDown()
{
    if (isLeftWinDoubledAsClickPressed)
    {
        return
    }
    
    isLeftWinDoubledAsClickPressed := true
    
    if (isLeftShiftDoubledAsClickPressed || isLeftCtrlDoubledAsClickPressed || isLeftAltDoubledAsClickPressed) {
        resetSendClickOnLeftModifierRelease(1)
        setWinState(1)
        setTimer TimerMonitorWinModifierLift, 20
        return
    }

    if (winActive || isRightAltDoubledAsClickPressed || isRightCtrlDoubledAsClickPressed || isRightShiftDoubledAsClickPressed)
    {
        leftWinActiveBeforeWinClickPress := true
        resetSendClickOnRightModifierRelease(1)
        sendDoubledValueAndReset("leftWinClick", sendClickOnLeftWinClickRelease, isLeftWinClickDown)
        if (!isLeftWinClickDown)
        {
            chooseClickDragActivation("leftWinClick", "mouseDragLeftWinActivate", doubledLeftWinMouseHook)
        }
        return
    }
    
    winActive := 1

    if (!layoutKeyPressed && activePressedKeys.Length() = 0)
    {        
        sendClickOnLeftWinClickRelease := true
        chooseClickDragActivation("leftWinClick", "mouseDragLeftWinActivate", doubledLeftWinMouseHook)
        setTimer TimerResetModifierReleaseAction, %timeoutStillSendLayoutKey%
    }
}

mouseDragLeftWinActivate(nCode, wParam, lParam)
{
    cancelMouseHook(doubledLeftWinMouseHook)
    if (wParam = 0x200)
    {
        sendClickOnLeftWinClickRelease := false
        isLeftWinClickDown := true
        doubledAction := modifierDoubledAsClick["leftWinClick"]
        send {blind}{%doubledAction% down}
    }
}

doubledLeftWinUp()
{
    cancelMouseHook(doubledLeftWinMouseHook)
    isLeftWinDoubledAsClickPressed := false

    if (leftWinActiveBeforeWinClickPress)
    {
        leftWinActiveBeforeWinClickPress := false
    }
    else
    {
        winActive := 0
    }
    
    resetDoubledModifierClickDrag("leftWinClick", isLeftWinClickDown)

    if (sendClickOnLeftWinClickRelease)
    {
        sendDoubledValueAndReset("leftWinClick", sendClickOnLeftWinClickRelease, isLeftWinClickDown)
    }
}