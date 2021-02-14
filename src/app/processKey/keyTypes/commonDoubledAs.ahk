global fixQuickTypeLeftRightDoubledModifiers := 0
global timeoutResetModifierContinuousPress := 20
global repressNormalShiftRelease := false
global repressNormalWinRelease := false


cancelDoubledModifier()
{
    resetSendClickOnLeftModifierRelease(1)
    resetSendClickOnRightModifierRelease(1)

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
    debug("doubled " . modifierValue . " => " . doubledAction)
    if (doubledAction = "lbutton")
    {
        if (isModifierClickDown)
        {
            isModifierClickDown := false
            sendClickOnRelease := false
            debug("release button")
            send {blind}%activeModifiers%{lbutton up}
        }
        else
        {
            if (sendClickOnRelease)
            {
                sendClickOnRelease := false
                isModifierClickDown := false
                debug("button up & down")
                send {blind}%activeModifiers%{lbutton down}
                send {blind}%activeModifiers%{lbutton up}
            }
            else
            {
                sendClickOnRelease := true
                isModifierClickDown := true
                debug("deep pressed mouse")
                send {blind}%activeModifiers%{lbutton down}
            }
        }
    }
    else if (doubledAction = "rbutton")
    {
        isModifierClickDown := false
        sendClickOnRelease := false
        send {blind}%activeModifiers%{rbutton down}
        send {blind}%activeModifiers%{rbutton up}
    }
    else
    {
        sendClickOnRelease := false
        isModifierClickDown := false
        processKeyToSend(doubledAction)
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
    debug("timerResetModifierReleaseAction")
    resetSendClickOnLeftModifierRelease(1)
    resetSendClickOnRightModifierRelease(1)
}

activateCtrlWithKey(key)
{
    if (!GetKeyState("ctrl"))
    {
        debug("ctrl with key 1")
        send {ctrl down}
        setTimer TimerMonitorCtrlModifierLift, %timeoutResetModifierContinuousPress%, -2147483648
    }
    send {blind}%key%
}

timerMonitorCtrlModifierLift()
{
    if (!ctrlActive)
    {
        debug("ctrl with key 0")
        send {ctrl up}
        setTimer TimerMonitorCtrlModifierLift, off
    }
}

activateShiftWithKey(key)
{
    if (!GetKeyState("shift"))
    {
        debug("shift with key 1")
        send {shift down}
        setTimer TimerMonitorShiftModifierLift, %timeoutResetModifierContinuousPress%, -2147483648
    }
    send {blind}%key%
}

timerMonitorShiftModifierLift()
{
    if (!shiftActive)
    {
        debug("shift with key 0")
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
        debug("alt with key 1")
        send {alt down}
        setTimer TimerMonitorAltModifierLift, %timeoutResetModifierContinuousPress%, -2147483648
    }
    send {blind}%key%
}

timerMonitorAltModifierLift()
{
    if (!altActive)
    {
        debug("alt with key 0")
        send {alt up}
        setTimer TimerMonitorAltModifierLift, off
    }
}

activateWinWithKey(key)
{
    if (!GetKeyState("lwin"))
    {
        debug("win with key 1")
        send {lwin down}
        setTimer TimerMonitorWinModifierLift, %timeoutResetModifierContinuousPress%, -2147483648
    }
    send {blind}%key%
}

timerMonitorWinModifierLift()
{
    if (!winActive)
    {
        debug("win with key 0")
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