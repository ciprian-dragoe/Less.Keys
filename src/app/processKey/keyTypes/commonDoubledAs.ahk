cancelDoubledModifier()
{
    resetSendClickOnLeftModifierRelease(1)
    resetSendClickOnRightModifierRelease(1)

    leftCtrlActiveBeforeCtrlClickPress := false
    altActiveBeforeAltClickPress := false
    leftShiftActiveBeforeShiftClickPress := false
    winActiveBeforeWinClickPress := false

    rightCtrlActiveBeforeCtrlClickPress := false
    rightAltActiveBeforeCtrlClickPress := false
    rightWinActiveBeforeCtrlClickPress := false
    rightShiftActiveBeforeCtrlClickPress := false
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
    resetSendClickOnLeftModifierRelease()
    resetSendClickOnRightModifierRelease()
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
    activeModifiers := getActiveModifiers()
    send {blind}%activeModifiers%{%doubledAction%}
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

resetSendClickOnLeftModifierRelease(shouldResetMouseHook = 0)
{
    sendClickOnLeftCtrlClickRelease := false
    sendClickOnLeftShiftClickRelease := false
    sendClickOnWinClickRelease := false
    sendClickOnAltClickRelease := false
    if (shouldResetMouseHook)
    {
        cancelMouseHook(doubledLeftShiftMouseHook)
        cancelMouseHook(doubledLeftCtrlMouseHook)
        cancelMouseHook(doubledWinMouseHook)
        cancelMouseHook(doubledAltMouseHook)
    }
}

resetSendClickOnRightModifierRelease(shouldResetMouseHook = 0)
{
    sendClickOnRightShiftClickRelease := false
    sendClickOnRightCtrlClickRelease := false
    sendClickOnRightWinClickRelease := false
    sendClickOnRightAltClickRelease := false
    if (shouldResetMouseHook)
    {
        cancelMouseHook(doubledRightShiftMouseHook)
        cancelMouseHook(doubledRightCtrlMouseHook)
        cancelMouseHook(doubledRightWinMouseHook)
        cancelMouseHook(doubledRightAltMouseHook)
    }
}