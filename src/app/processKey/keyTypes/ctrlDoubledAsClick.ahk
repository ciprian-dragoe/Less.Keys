global sendClickOnCtrlClickRelease := false
global sendUnClickOnCtrlClickRelease := false
global isCtrlDoubledAsClickPressed := false
global ctrlActiveBeforeCtrlClickPress := false
global doubledCtrlMouseHook



processCtrlDoubledAsClick(state)
{
    if (state)
    {
        doubledCtrlDown()
    }
    else
    {
        doubledCtrlUp()
    }
}

doubledCtrlDown()
{
    if (isCtrlDoubledAsClickPressed)
    {
        return
    }
    
    isCtrlDoubledAsClickPressed := true
    if (ctrlActive)
    {
        ctrlActiveBeforeCtrlClickPress := true
    }
    
    cancelDoubledModifier()
    SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
    ctrlActive := 1
    
    if (!layoutKeyPressed && activePressedKeys.Length() = 0 && !isShiftDoubledAsClickPressed && !isWinDoubledAsClickPressed && !isAltDoubledAsClickPressed)
    {        
        sendClickOnCtrlClickRelease := true
		if (modifierDoubledAsClick["ctrlClick"] = "lbutton")
		{			
			doubledCtrlMouseHook := DllCall("SetWindowsHookEx", "int", 14, "uint", RegisterCallback("MouseDragCtrlActivate"), "uint", 0, "uint", 0)
		}
		SetTimer, TimerResetSentClickOnModifierRelease, %timeoutStillSendLayoutKey%
    }
}

MouseDragCtrlActivate(nCode, wParam, lParam)
{
    cancelMouseHook(doubledCtrlMouseHook)
    if (wParam = 0x200)
    {
        setCtrlState(0)
        sendClickOnCtrlClickRelease := false
        sendUnClickOnCtrlClickRelease := true
        doubledAction := modifierDoubledAsClick["ctrlClick"]
        send {blind}{%doubledAction% down}
    }
}

doubledCtrlUp()
{
    cancelMouseHook(doubledCtrlMouseHook)
    if (ctrlActiveBeforeCtrlClickPress)
    {
        ctrlActiveBeforeCtrlClickPress := false
    }
    else
    {
        ctrlActive := 0
    }
    
    isCtrlDoubledAsClickPressed := false
    
    resetCtrlClickDrag()
    if (sendClickOnCtrlClickRelease)
    {
        doubledAction := modifierDoubledAsClick["ctrlClick"]
        send {blind}{%doubledAction%}
        sendClickOnCtrlClickRelease := false
    }
}

resetCtrlClickDrag()
{
    if (sendUnClickOnCtrlClickRelease)
    {
        action := modifierDoubledAsClick["ctrlClick"]
        send {blind}{%action% up}
        sendUnClickOnCtrlClickRelease := false
    }
}

activateCtrlWithKey(key)
{
    if (!GetKeyState("ctrl"))
    {
        send {ctrl down}
        setTimer TimerMonitorCtrlModifierLift, 20
    }
    send {blind}%key%
}

timerMonitorCtrlModifierLift()
{
    if (!ctrlActive)
    {
        send {ctrl up}
        setTimer TimerMonitorCtrlModifierLift, off
    }
}
