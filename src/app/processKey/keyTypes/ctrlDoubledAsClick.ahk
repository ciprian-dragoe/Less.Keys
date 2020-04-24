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
    sendClickOnCtrlClickRelease := true
    doubledCtrlMouseHook := DllCall("SetWindowsHookEx", "int", 14, "uint", RegisterCallback("MouseDragCtrlActivate"), "uint", 0, "uint", 0)
    setCtrlState(1)
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
    setCtrlState(0)
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

