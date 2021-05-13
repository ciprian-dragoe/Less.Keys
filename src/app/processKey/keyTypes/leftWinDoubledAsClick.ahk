global sendClickOnLeftWinClickRelease := false
global isLeftWinDoubledAsClickPressed := false
global doubledLeftWinMouseHook := 0
global isLeftWinClickDown := false



processLeftWinDoubledAsClick(state)
{
    if (state)
    {
        doubledLeftWinDown()
    }
    else
    {
        doubledLeftWinUp()
    }
}

doubledLeftWinDown()
{
    if (isLeftWinDoubledAsClickPressed)
    {
        return
    }

    isLeftWinDoubledAsClickPressed := true
    setWinState(1)

    if (!isAnyRightModifierPressed() && (isLeftCtrlDoubledAsClickPressed || isLeftShiftDoubledAsClickPressed || isLeftAltDoubledAsClickPressed))
    {
        setTimer TimerResetModifierReleaseAction, OFF
        resetSendClickOnLeftModifierRelease(1)
        return
    }

    resetSendClickOnRightModifierRelease(1)
    sendClickOnLeftWinClickRelease := true
    chooseClickDragActivation("leftWinClick", "mouseDragLeftWinActivate", doubledLeftWinMouseHook)
    setTimer TimerResetModifierReleaseAction, OFF
    setTimer TimerResetModifierReleaseAction, %timeoutStillSendLayoutKey%
}

mouseDragLeftWinActivate(nCode, wParam, lParam)
{
    cancelMouseHook(doubledLeftWinMouseHook)
    setTimer TimerResetModifierReleaseAction, OFF
    if (wParam = 0x200)
    {
        debug("mouseDragLeftWinActivate")
        sendClickOnLeftWinClickRelease := true
        isLeftWinClickDown := true
        doubledAction := modifierDoubledAsClick["leftWinClick"]
        if (!isNormalWinActive && !isRightWinDoubledAsClickPressed)
        {
            resetModifierWithoutTriggerUpState("lwin", winActive)
        }
        processKeyToSend("lbutton down")
    }
}

doubledLeftWinUp()
{
    cancelMouseHook(doubledLeftWinMouseHook)
    isLeftWinDoubledAsClickPressed := false

    if (!isAnyRightModifierPressed())
    {
        setTimer TimerResetModifierReleaseAction, OFF
    }

    if (!isNormalWinActive && !isRightWinDoubledAsClickPressed)
    {
        resetModifierWithoutTriggerUpState("lwin", winActive)
    }

    if (isLeftWinClickDown || sendClickOnLeftWinClickRelease)
    {
        SetTimer TimerStickyFailBack, OFF
        SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
        sendDoubledValueAndReset("leftWinClick", sendClickOnLeftWinClickRelease, isLeftWinClickDown)
    }
}