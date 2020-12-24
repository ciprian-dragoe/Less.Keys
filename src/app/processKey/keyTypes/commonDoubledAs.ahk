cancelDoubledModifier()
{
    cancelMouseHook(doubledShiftMouseHook)
    cancelMouseHook(doubledCtrlMouseHook)
    cancelMouseHook(doubledWinMouseHook)
    cancelMouseHook(doubledAltMouseHook)
    sendClickOnShiftClickRelease := false
    sendClickOnCtrlClickRelease := false
    sendClickOnWinClickRelease := false
    sendClickOnAltClickRelease := false
    ctrlActiveBeforeCtrlClickPress := false
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
    sendClickOnCtrlClickRelease := false
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