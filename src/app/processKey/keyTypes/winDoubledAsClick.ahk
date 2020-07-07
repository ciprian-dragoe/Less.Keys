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
    if (winActive)
    {
        winActiveBeforeWinClickPress := true
    }
    
    cancelDoubledModifier()
    SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
    winActive := 1
    
    if (!layoutKeyPressed && activePressedKeys.Length() = 0 && !isShiftDoubledAsClickPressed && !isCtrlDoubledAsClickPressed && !isAltDoubledAsClickPressed)
    {
        sendClickOnWinClickRelease := true
		if (modifierDoubledAsClick["winClick"] = "lbutton")
		{
			doubledWinMouseHook := DllCall("SetWindowsHookEx", "int", 14, "uint", RegisterCallback("MouseDragWinActivate"), "uint", 0, "uint", 0)
		}
		SetTimer, TimerResetSentClickOnModifierRelease, %timeoutStillSendLayoutKey%
    }
}

MouseDragWinActivate(nCode, wParam, lParam)
{
    cancelMouseHook(doubledWinMouseHook)
    if (wParam = 0x200)
    {
        winActive := 0
        sendClickOnWinClickRelease := false
        sendUnClickOnWinClickRelease := true
        doubledAction := modifierDoubledAsClick["winClick"]
        send {blind}{%doubledAction% down}
    }
}

doubledWinUp()
{
    cancelMouseHook(doubledWinMouseHook)
    if (winActiveBeforeWinClickPress)
    {
        winActiveBeforeWinClickPress := false
    }
    else
    {
        winActive := 0
    }
    isWinDoubledAsClickPressed := false
    
    resetWinClickDrag()
    if (sendClickOnWinClickRelease)
    {
        doubledAction := modifierDoubledAsClick["winClick"]
        send {blind}{%doubledAction%}
        sendClickOnWinClickRelease := false
    }
}

resetWinClickDrag()
{
    if (sendUnClickOnWinClickRelease)
    {
        action := modifierDoubledAsClick["winClick"]
        send {blind}{%action% up}
        sendUnClickOnWinClickRelease := false
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