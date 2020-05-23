global sendClickOnShiftClickRelease := false
global sendUnClickOnShiftClickRelease := false
global isShiftDoubledAsClickPressed := false
global shiftActiveBeforeShiftClickPress
global doubledShiftMouseHook



processShiftDoubledAsClick(state)
{
    if (state)
    {
        doubledShiftDown()
    }
    else
    {
        doubledShiftUp()
    }
}

doubledShiftDown()
{
    if (isShiftDoubledAsClickPressed)
    {
        return
    }
    
    isShiftDoubledAsClickPressed := true
    if (shiftActive)
    {
        shiftActiveBeforeShiftClickPress := true
    }
    
    setShiftState(1)
    
    if (!layoutKeyPressed && activePressedKeys.Length() = 0 && !isCtrlDoubledAsClickPressed && !isWinDoubledAsClickPressed && !isAltDoubledAsClickPressed)
    {
        doubledShiftMouseHook := DllCall("SetWindowsHookEx", "int", 14, "uint", RegisterCallback("MouseDragShiftActivate"), "uint", 0, "uint", 0)
        SetTimer, TimerResetSentClickOnModifierRelease, %timeoutStillSendLayoutKey%
        sendClickOnShiftClickRelease := true
    }
}

MouseDragShiftActivate(nCode, wParam, lParam)
{
    cancelMouseHook(doubledShiftMouseHook)
    if (wParam = 0x200)
    {
        setShiftState(0)
        sendClickOnShiftClickRelease := false
        sendUnClickOnShiftClickRelease := true
        doubledAction := modifierDoubledAsClick["shiftClick"]
        send {blind}{%doubledAction% down}
    }
}

doubledShiftUp()
{
    cancelMouseHook(doubledShiftMouseHook)
    if (shiftActiveBeforeShiftClickPress)
    {
        shiftActiveBeforeShiftClickPress := false
    }
    else
    {
        setShiftState(0)
    }
    isShiftDoubledAsClickPressed := false
    
    resetShiftClickDrag()
    if (sendClickOnShiftClickRelease)
    {
        doubledAction := modifierDoubledAsClick["shiftClick"]
        send {blind}{%doubledAction%}
        sendClickOnShiftClickRelease := false
    }
}

resetShiftClickDrag()
{
    if (sendUnClickOnShiftClickRelease)
    {
        action := modifierDoubledAsClick["shiftClick"]
        send {blind}{%action% up}
        sendUnClickOnShiftClickRelease := false
    }
}
