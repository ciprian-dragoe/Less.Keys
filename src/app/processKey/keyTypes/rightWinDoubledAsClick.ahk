global sendClickOnRightWinClickRelease := false
global isRightWinDoubledAsClickPressed := false
global doubledRightWinMouseHook := 0
global isRightWinClickDown := false



processRightWinDoubledAsClick(state)
{
    if (state)
    {
        doubledRightWinDown()
    }
    else
    {
        doubledRightWinUp()
    }
}

doubledRightWinDown()
{
    if (isRightWinDoubledAsClickPressed)
    {
        return
    }

    isRightWinDoubledAsClickPressed := true
    setWinState(1)

    if (!isAnyLeftModifierPressed() && (isRightShiftDoubledAsClickPressed || isRightAltDoubledAsClickPressed || isRightCtrlDoubledAsClickPressed))
    {
        resetSendClickOnRightModifierRelease(1)
        return
    }

    sendClickOnRightWinClickRelease := true
    chooseClickDragActivation("rightWinClick", "mouseDragRightWinActivate", doubledRightWinMouseHook)
    setTimer TimerResetModifierReleaseAction, OFF
    setTimer TimerResetModifierReleaseAction, %timeoutStillSendLayoutKey%
}

mouseDragRightWinActivate(nCode, wParam, lParam)
{
    cancelMouseHook(doubledRightWinMouseHook)
    setTimer TimerResetModifierReleaseAction, OFF
    if (wParam = 0x200)
    {
        debug("mouseDragRightWinActivate")
        sendClickOnRightWinClickRelease := true
        isRightWinClickDown := true
        doubledAction := modifierDoubledAsClick["rightWinClick"]
        processKeyToSend("lbutton down")
    }
}

doubledRightWinUp()
{
    cancelMouseHook(doubledRightWinMouseHook)
    isRightWinDoubledAsClickPressed := false
    if (!isAnyLeftModifierPressed())
    {
        setTimer TimerResetModifierReleaseAction, OFF
    }

    if (isLeftWinDoubledAsClickPressed)
    {
        resetSendClickOnLeftModifierRelease(1)
    }
    else if (!isNormalWinActive)
    {
        ; for alt & win sending a normal up will trigger a special os action (activate the menu/startbar for example)
        winActive := 0
        processKeyToSend("lwin up", "#")
    }

    if (isRightWinClickDown || sendClickOnRightWinClickRelease)
    {
        SetTimer TimerStickyFailBack, OFF
        SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
        sendDoubledValueAndReset("rightWinClick", sendClickOnRightWinClickRelease, isRightWinClickDown)
    }
}