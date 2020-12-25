cancelDoubledModifier()
{
    cancelMouseHook(doubledShiftMouseHook)
    cancelMouseHook(doubledLeftCtrlMouseHook)
    cancelMouseHook(doubledWinMouseHook)
    cancelMouseHook(doubledAltMouseHook)
    sendClickOnShiftClickRelease := false
    sendClickOnLeftCtrlClickRelease := false
    sendClickOnWinClickRelease := false
    sendClickOnAltClickRelease := false
    leftCtrlActiveBeforeCtrlClickPress := false
    altActiveBeforeAltClickPress := false
    shiftActiveBeforeShiftClickPress := false
    winActiveBeforeWinClickPress := false
}

cancelMouseHook(ByRef id)
{
    if (id)
    {
        DllCall("UnhookWindowsHookEx", "uint", id)
        id := 0
    }
}

timerResetSentClickOnModifierRelease()
{
    SetTimer, TimerResetSentClickOnModifierRelease, OFF
    sendClickOnShiftClickRelease := false
    sendClickOnLeftCtrlClickRelease := false
    sendClickOnWinClickRelease := false
    sendClickOnAltClickRelease := false
}

chooseClickDragActivation(modifierValue, callbackMethodName, ByRef hookStoreLocation)
{
    if (modifierDoubledAsClick[modifierValue] = "lbutton")
    {
        hookStoreLocation := DllCall("SetWindowsHookEx", "int", 14, "uint", RegisterCallback(callbackMethodName), "uint", 0, "uint", 0)
    }
    SetTimer, TimerResetSentClickOnModifierRelease, %timeoutStillSendLayoutKey%
}

sendDoubledValueAndReset(modifierValue, ByRef resetValue)
{
    doubledAction := modifierDoubledAsClick[modifierValue]
    send {blind}{%doubledAction%}
    resetValue := false
}

resetDoubledModifierClickDrag(modifierValue, ByRef resetValue)
{
    if (resetValue)
    {
        action := modifierDoubledAsClick[modifierValue]
        send {blind}{%action% up}
        resetValue := false
    }
}