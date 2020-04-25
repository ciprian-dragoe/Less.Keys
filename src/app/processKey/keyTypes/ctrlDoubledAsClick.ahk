global sendClickOnCtrlClickRelease := false
global sendUnClickOnCtrlClickRelease := false
global isCtrlDoubledAsClickPressed := false

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
    
    setCtrlState(1)
    
    if (!layoutKeyPressed && activePressedKeys.Length() = 0 && !isShiftDoubledAsClickPressed)
    {
        doubledCtrlMouseHook := DllCall("SetWindowsHookEx", "int", 14, "uint", RegisterCallback("MouseDragCtrlActivate"), "uint", 0, "uint", 0)
        SetTimer, TimerResetSentClickOnModifierRelease, %timeoutStillSendLayoutKey%
        sendClickOnCtrlClickRelease := true
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
        setCtrlState(0)
    }
    
    isCtrlDoubledAsClickPressed := false
    
    doubledAction := modifierDoubledAsClick["ctrlClick"]
    resetCtrlClickDrag(doubledAction)
    if (sendClickOnCtrlClickRelease)
    {
        send {blind}{%doubledAction%}
        sendClickOnCtrlClickRelease := false
    }
}

resetCtrlClickDrag(action)
{
    if (sendUnClickOnCtrlClickRelease)
    {
        send {blind}{%action% up}
        sendUnClickOnCtrlClickRelease := false
    }
}

