global sendClickOnWinClickRelease := false
global isWinDoubledAsClickPressed := false
global winActiveBeforeWinClickPress := false
global doubledWinMouseHook := 0
global isLeftWinDown := false



processWinDoubledAsClick(state)
{
    if (state)
    {
        doubledWinDown()
    }
    else
    {
        doubledWinUp()
    }
}

doubledWinDown()
{
    if (isWinDoubledAsClickPressed)
    {
        return
    }
    
    isWinDoubledAsClickPressed := true
    
    if (isLeftShiftDoubledAsClickPressed || isLeftCtrlDoubledAsClickPressed || isLeftAltDoubledAsClickPressed) {
        setWinState(1)
        setTimer TimerMonitorWinModifierLift, 20
        return
    }

    if (winActive)
    {
        winActiveBeforeWinClickPress := true
        resetSendClickOnLeftModifierRelease(1)
        sendDoubledValueAndReset("winClick", sendClickOnWinClickRelease, isLeftWinDown)
        if (!isLeftWinDown)
        {
            chooseClickDragActivation("winClick", "mouseDragWinActivate", doubledWinMouseHook)
        }
        return
    }
    
    winActive := 1

    if (!layoutKeyPressed && activePressedKeys.Length() = 0)
    {        
        sendClickOnWinClickRelease := true
        chooseClickDragActivation("winClick", "mouseDragWinActivate", doubledWinMouseHook)
        setTimer TimerResetModifierReleaseAction, %timeoutStillSendLayoutKey%
    }
}

mouseDragWinActivate(nCode, wParam, lParam)
{
    cancelMouseHook(doubledWinMouseHook)
    if (wParam = 0x200)
    {
        sendClickOnWinClickRelease := false
        isLeftWinDown := true
        doubledAction := modifierDoubledAsClick["winClick"]
        send {blind}{%doubledAction% down}
    }
}

doubledWinUp()
{
    cancelMouseHook(doubledWinMouseHook)
    isWinDoubledAsClickPressed := false

    if (winActiveBeforeWinClickPress)
    {
        winActiveBeforeWinClickPress := false
    }
    else
    {
        winActive := 0
    }
    
    resetDoubledModifierClickDrag("winClick", isLeftWinDown)

    if (sendClickOnWinClickRelease)
    {
        sendDoubledValueAndReset("winClick", sendClickOnWinClickRelease, isLeftWinDown)
    }
}

activateWinWithKey(key)
{
    if (!GetKeyState("lwin"))
    {
        send {lwin down}
        setTimer TimerMonitorWinModifierLift, 20
    }
    send {blind}%key%
}

timerMonitorWinModifierLift()
{
    if (!winActive)
    {
        send {lwin up}
        setTimer TimerMonitorWinModifierLift, off
    }
}