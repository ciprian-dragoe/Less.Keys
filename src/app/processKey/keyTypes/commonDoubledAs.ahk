global fixQuickTypeLeftRightDoubledModifiers := 0
global timeoutResetModifierContinuousPress := 20
global repressNormalShiftRelease := false
global repressNormalWinRelease := false


cancelDoubledModifier()
{
    resetSendClickOnLeftModifierRelease()
    resetSendClickOnRightModifierRelease()

    leftCtrlActiveBeforeCtrlClickPress := false
    leftAltActiveBeforeAltClickPress := false
    repressLeftShiftReleaseCancelShiftActive := false
    leftWinActiveBeforeWinClickPress := false

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

sendDoubledValueAndReset(modifierValue, ByRef sendClickOnRelease, ByRef isModifierClickDown)
{
    doubledAction := modifierDoubledAsClick[modifierValue]
    activeModifiers := getActiveModifiers()
    debug("sendDoubledValueAndReset " . doubledAction)
    if (doubledAction == "lbutton")
    {
        if (isModifierClickDown)
        {
            isModifierClickDown := false
            sendClickOnRelease := false
            send {blind}%activeModifiers%{lbutton up}
        }
        else
        {
            if (sendClickOnRelease)
            {
                send {blind}%activeModifiers%{lbutton down}
                send {blind}%activeModifiers%{lbutton up}
                sendClickOnRelease := false
                isModifierClickDown := false
            }
            else
            {
                send {blind}%activeModifiers%{lbutton down}
                sendClickOnRelease := true
                isModifierClickDown := true
            }
        }
    }
    else if (doubledAction == "rbutton")
    {
        send {blind}%activeModifiers%{rbutton down}
        send {blind}%activeModifiers%{rbutton up}
        isModifierClickDown := false
        sendClickOnRelease := false
    }
    else
    {
        send {blind}%activeModifiers%{%doubledAction%}
        sendClickOnRelease := false
        isModifierClickDown := false
    }
}

resetDoubledModifierClickDrag(modifierValue, ByRef isClickDown)
{
    if (isClickDown)
    {
        action := modifierDoubledAsClick[modifierValue]
        send {blind}{%action% up}
        isClickDown := false
    }
}

timerResetModifierReleaseAction()
{
    setTimer TimerResetModifierReleaseAction, OFF
    resetSendClickOnLeftModifierRelease()
    resetSendClickOnRightModifierRelease()
}

activateCtrlWithKey(key)
{
    if (!GetKeyState("ctrl"))
    {
        send {ctrl down}
        setTimer TimerMonitorCtrlModifierLift, %timeoutResetModifierContinuousPress%
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
        setTimer TimerMonitorShiftModifierLift, %timeoutResetModifierContinuousPress%
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
    sendClickOnLeftWinClickRelease := false
    sendClickOnLeftAltClickRelease := false
    if (shouldResetMouseHook)
    {
        cancelMouseHook(doubledLeftShiftMouseHook)
        cancelMouseHook(doubledLeftCtrlMouseHook)
        cancelMouseHook(doubledLeftWinMouseHook)
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
        setTimer TimerMonitorAltModifierLift, %timeoutResetModifierContinuousPress%
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

activateWinWithKey(key)
{
    if (!GetKeyState("lwin"))
    {
        send {lwin down}
        setTimer TimerMonitorWinModifierLift, %timeoutResetModifierContinuousPress%
    }
    send {blind}%key%
}

timerMonitorWinModifierLift()
{
    if (!winActive)
    {
        send {lwin up}
        setTimer TimerMonitorWinModifierLift, off
    }
}

timerFixQuickTypeLeftRightDoubledModifiers()
{
    SetTimer, TimerFixQuickTypeLeftRightDoubledModifiers, OFF
    fixQuickTypeLeftRightDoubledModifiers := false
}

isAnyLeftModifierPressed()
{
    return isLeftAltDoubledAsClickPressed || isLeftCtrlDoubledAsClickPressed || isLeftWinDoubledAsClickPressed || isLeftShiftDoubledAsClickPressed
}

isAnyRightModifierPressed()
{
    return isRightAltDoubledAsClickPressed || isRightCtrlDoubledAsClickPressed || isRightWinDoubledAsClickPressed || isRightShiftDoubledAsClickPressed
}