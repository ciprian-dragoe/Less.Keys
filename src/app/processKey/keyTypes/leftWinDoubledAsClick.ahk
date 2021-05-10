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
        resetSendClickOnLeftModifierRelease(1)
        return
    }

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

    if (isRightWinDoubledAsClickPressed)
    {
        resetSendClickOnRightModifierRelease(1)
    }
    else if (!isNormalWinActive)
    {
        ; for alt & win sending a normal up will trigger a special os action (activate the menu/startbar for example)
        winActive := 0
        processKeyToSend("lwin up", "#")
    }

    if (isLeftWinClickDown || sendClickOnLeftWinClickRelease)
    {
        SetTimer TimerStickyFailBack, OFF
        SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
        sendDoubledValueAndReset("leftWinClick", sendClickOnLeftWinClickRelease, isLeftWinClickDown)
    }
}