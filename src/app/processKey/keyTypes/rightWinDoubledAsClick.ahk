global sendClickOnRightWinClickRelease := false
global isRightWinDoubledAsClickPressed := false
global rightWinActiveBeforeWinClickPress := false
global doubledRightWinMouseHook := 0
global isRightWinClickDown := false



processRightWinDoubledAsClick(state)
{
    if (state)
    {
        doubledRightWinDown()
    }
    else
    {
        doubledRightWinUp()
    }
}

doubledRightWinDown()
{
    if (isRightWinDoubledAsClickPressed)
    {
        return
    }
    
    isRightWinDoubledAsClickPressed := true
    
    if (isRightShiftDoubledAsClickPressed || isRightCtrlDoubledAsClickPressed || isRightAltDoubledAsClickPressed) {
        resetSendClickOnRightModifierRelease(1)
        setWinState(1)
        setTimer TimerMonitorWinModifierLift, 20
        return
    }

    if (winActive || isLeftAltDoubledAsClickPressed || isLeftCtrlDoubledAsClickPressed || isLeftShiftDoubledAsClickPressed)
    {
        rightWinActiveBeforeWinClickPress := true
        resetSendClickOnLeftModifierRelease(1)
        sendDoubledValueAndReset("rightWinClick", sendClickOnRightWinClickRelease, isRightWinClickDown)
        if (!isRightWinClickDown)
        {
            chooseClickDragActivation("rightWinClick", "mouseDragRightWinActivate", doubledRightWinMouseHook)
        }
        return
    }
    
    winActive := 1

    if (!layoutKeyPressed && activePressedKeys.Length() = 0)
    {        
        sendClickOnRightWinClickRelease := true
        chooseClickDragActivation("rightWinClick", "mouseDragRightWinActivate", doubledRightWinMouseHook)
        setTimer TimerResetModifierReleaseAction, %timeoutStillSendLayoutKey%
    }
}

mouseDragRightWinActivate(nCode, wParam, lParam)
{
    cancelMouseHook(doubledRightWinMouseHook)
    if (wParam = 0x200)
    {
        sendClickOnRightWinClickRelease := false
        isRightWinClickDown := true
        doubledAction := modifierDoubledAsClick["rightWinClick"]
        send {blind}{%doubledAction% down}
    }
}

doubledRightWinUp()
{
    cancelMouseHook(doubledRightWinMouseHook)
    isRightWinDoubledAsClickPressed := false

    if (rightWinActiveBeforeWinClickPress)
    {
        rightWinActiveBeforeWinClickPress := false
    }
    else
    {
        winActive := 0
    }
    
    resetDoubledModifierClickDrag("rightWinClick", isRightWinClickDown)

    if (sendClickOnRightWinClickRelease)
    {
        sendDoubledValueAndReset("rightWinClick", sendClickOnRightWinClickRelease, isRightWinClickDown)
    }
}