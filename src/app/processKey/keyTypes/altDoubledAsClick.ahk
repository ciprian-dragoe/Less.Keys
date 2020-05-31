global sendClickOnAltClickRelease := false
global sendUnClickOnAltClickRelease := false
global isAltDoubledAsClickPressed := false
global AltActiveBeforeAltClickPress := false
global doubledAltMouseHook



processAltDoubledAsClick(state)
{
    if (state)
    {
        doubledAltDown()
    }
    else
    {
        doubledAltUp()
    }
}

doubledAltDown()
{
    if (isAltDoubledAsClickPressed)
    {
        return
    }
    
    isAltDoubledAsClickPressed := true
    if (altActive)
    {
        altActiveBeforeAltClickPress := true
    }
    
    cancelDoubledModifier()
    SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
    altActive := 1
    
    if (!layoutKeyPressed && activePressedKeys.Length() = 0 && !isShiftDoubledAsClickPressed && !isCtrlDoubledAsClickPressed && !isWinDoubledAsClickPressed)
    {
        sendClickOnAltClickRelease := true
		if (modifierDoubledAsClick["altClick"] = "lbutton")
		{
			doubledAltMouseHook := DllCall("SetWindowsHookEx", "int", 14, "uint", RegisterCallback("MouseDragAltActivate"), "uint", 0, "uint", 0)
		}
		SetTimer, TimerResetSentClickOnModifierRelease, %timeoutStillSendLayoutKey%
    }
}

MouseDragAltActivate(nCode, wParam, lParam)
{
    cancelMouseHook(doubledAltMouseHook)
    if (wParam = 0x200)
    {
        altActive := 0
        sendClickOnAltClickRelease := false
        sendUnClickOnAltClickRelease := true
        doubledAction := modifierDoubledAsClick["altClick"]
        send {blind}{%doubledAction% down}
    }
}

doubledAltUp()
{
    cancelMouseHook(doubledAltMouseHook)
    if (altActiveBeforeAltClickPress)
    {
        altActiveBeforeAltClickPress := false
    }
    else
    {
        altActive := 0
    }
    
    isAltDoubledAsClickPressed := false
    
    resetAltClickDrag()
    if (sendClickOnAltClickRelease)
    {
        doubledAction := modifierDoubledAsClick["altClick"]
        send {blind}{%doubledAction%}
        sendClickOnAltClickRelease := false
    }
}

resetAltClickDrag()
{
    if (sendUnClickOnAltClickRelease)
    {
        action := modifierDoubledAsClick["altClick"]
        send {blind}{%action% up}
        sendUnClickOnAltClickRelease := false
    }
}
