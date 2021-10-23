global timeoutResetModifierContinuousPress := 20


cancelDoubledModifier()
{
    resetSendClickOnLeftModifierRelease(1)
    resetSendClickOnRightModifierRelease(1)
    setTimer TimerResetModifierReleaseAction, OFF
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
    if (layoutKeyPressed)
    {
        SetTimer, TimerTimeoutSendLayoutKey, OFF
        sendLayoutKey := false
        doubledAction := alternativeModifierDoubledAsClick[modifierValue]
    }
    activeModifiers := getActiveModifiers()
    debug("doubled " . modifierValue . " => " . doubledAction)
    if (doubledAction = "lbutton")
    {
        if (isModifierClickDown)
        {
            isModifierClickDown := false
            sendClickOnRelease := false
            debug("release button")
            processKeyToSend("lbutton up")
        }
        else if (sendClickOnRelease)
        {
            isModifierClickDown := false
            sendClickOnRelease := false
            debug("button up & down")
            processKeyToSend("lbutton")
        }
    }
    else if (doubledAction = "rbutton")
    {
        isModifierClickDown := false
        sendClickOnRelease := false
        processKeyToSend("rbutton")
    }
    else
    {
        isModifierClickDown := false
        sendClickOnRelease := false

        processKeyToSend(doubledAction)
    }
}

resetDoubledModifierClickDrag(modifierValue, ByRef isClickDown)
{
    if (isClickDown)
    {
        debug("================================= mouse down sticky sticky")
        storeDebugData()
        action := modifierDoubledAsClick[modifierValue]
        processKeyToSend(action . " up")
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

isAnyLeftModifierPressed()
{
    return isLeftAltDoubledAsClickPressed || isLeftCtrlDoubledAsClickPressed || isLeftWinDoubledAsClickPressed || isLeftShiftDoubledAsClickPressed
}

isAnyRightModifierPressed()
{
    return isRightAltDoubledAsClickPressed || isRightCtrlDoubledAsClickPressed || isRightWinDoubledAsClickPressed || isRightShiftDoubledAsClickPressed
}

resetModifierWithoutTriggerUpState(modifier, ByRef modifierState)
{
    modifierState := 0
    result := "{" . modifier . " up}"
    if (!ctrlActive)
    {
        result := "{ctrl down}" . result . "{ctrl up}"
    }
    send {blind}%result%
}