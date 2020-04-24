global sendClickOnShiftClickRelease := false
global sendUnClickOnShiftClickRelease := false
global isShiftDoubledAsClickPressed := false
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
    sendClickOnShiftClickRelease := true
    doubledShiftMouseHook := DllCall("SetWindowsHookEx", "int", 14, "uint", RegisterCallback("MouseDragShiftActivate"), "uint", 0, "uint", 0)
    setShiftState(1)
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
    setShiftState(0)
    isShiftDoubledAsClickPressed := false
    
    doubledAction := modifierDoubledAsClick["shiftClick"]
    resetShiftClickDrag(doubledAction)
    
    if (sendClickOnShiftClickRelease)
    {
        send {blind}{%doubledAction%}
        sendClickOnShiftClickRelease := false
    }
}

resetShiftClickDrag(action)
{
    if (sendUnClickOnShiftClickRelease)
    {
        send {blind}{%action% up}
        sendUnClickOnShiftClickRelease := false
    }
}

