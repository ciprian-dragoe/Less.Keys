global sendClickOnWinClickRelease := false
global sendUnClickOnWinClickRelease := false
global isWinDoubledAsClickPressed := false
global winActiveBeforeWinClickPress := false
global doubledWinMouseHook



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
    
    SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%

    if (isLeftShiftDoubledAsClickPressed || isLeftCtrlDoubledAsClickPressed || isAltDoubledAsClickPressed) {
        setWinState(1)
        setTimer TimerMonitorWinModifierLift, 20
        return
    }

    if (winActive)
    {
        winActiveBeforeWinClickPress := true
        sendDoubledValueAndReset("winClick", sendClickOnWinClickRelease)
        chooseClickDragActivation("winClick", "mouseDragWinActivate", doubledWinMouseHook)
        return
    }
    
    winActive := 1

    if (!layoutKeyPressed && activePressedKeys.Length() = 0)
    {        
        sendClickOnWinClickRelease := true
        chooseClickDragActivation("winClick", "mouseDragWinActivate", doubledWinMouseHook)
    }
}

mouseDragWinActivate(nCode, wParam, lParam)
{
    cancelMouseHook(doubledWinMouseHook)
    if (wParam = 0x200)
    {
        sendClickOnWinClickRelease := false
        sendUnClickOnWinClickRelease := true
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
    
    resetDoubledModifierClickDrag("winClick", sendUnClickOnWinClickRelease)

    if (sendClickOnWinClickRelease)
    {
        sendDoubledValueAndReset("winClick", sendClickOnWinClickRelease)
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