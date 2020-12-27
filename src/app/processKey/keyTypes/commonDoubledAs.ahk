cancelDoubledModifier()
{
    resetSendClickOnLeftModifierRelease(1)
    resetSendClickOnRightModifierRelease(1)

    leftCtrlActiveBeforeCtrlClickPress := false
    leftAltActiveBeforeAltClickPress := false
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

chooseClickDragActivation(modifierValue, callbackMethodName, ByRef hookStoreLocation)
{
    if (modifierDoubledAsClick[modifierValue] = "lbutton")
    {
        hookStoreLocation := DllCall("SetWindowsHookEx", "int", 14, "uint", RegisterCallback(callbackMethodName), "uint", 0, "uint", 0)
    }
}

sendDoubledValueAndReset(modifierValue, ByRef resetValue, ByRef isModifierClickDown)
{
    doubledAction := modifierDoubledAsClick[modifierValue]
    activeModifiers := getActiveModifiers()
    if (doubledAction == "lbutton")
    {
        state := "down"
        if (resetValue)
        {
            state := ""
            resetValue := false
        }
        send {blind}%activeModifiers%{%doubledAction% %state%}
        isModifierClickDown := true
    }
    else
    {
        send {blind}%activeModifiers%{%doubledAction%}
        resetValue := false
        isModifierClickDown := false
    }
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

timerResetModifierReleaseAction()
{
    resetSendClickOnLeftModifierRelease()
    resetSendClickOnRightModifierRelease()
    setTimer TimerResetModifierReleaseAction, OFF
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

activateShiftWithKey(key)
{
    if (!GetKeyState("shift"))
    {
        send {shift down}
        setTimer TimerMonitorShiftModifierLift, 20
    }
    send {blind}%key%
}

timerMonitorShiftModifierLift()
{
    if (!shiftActive)
    {
        send {shift up}
        setTimer TimerMonitorShiftModifierLift, off
    }
}

resetSendClickOnLeftModifierRelease(shouldResetMouseHook = 0)
{
    sendClickOnLeftCtrlClickRelease := false
    sendClickOnLeftShiftClickRelease := false
    sendClickOnWinClickRelease := false
    sendClickOnLeftAltClickRelease := false
    if (shouldResetMouseHook)
    {
        cancelMouseHook(doubledLeftShiftMouseHook)
        cancelMouseHook(doubledLeftCtrlMouseHook)
        cancelMouseHook(doubledWinMouseHook)
        cancelMouseHook(doubledLeftAltMouseHook)
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

activateAltWithKey(key)
{
    if (!GetKeyState("alt"))
    {
        send {alt down}
        setTimer TimerMonitorAltModifierLift, 20
    }
    send {blind}%key%
}

timerMonitorAltModifierLift()
{
    if (!altActive)
    {
        send {alt up}
        setTimer TimerMonitorAltModifierLift, off
    }
}