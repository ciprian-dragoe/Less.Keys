global sendClickOnRightAltClickRelease := false
global isRightAltDoubledAsClickPressed := false
global doubledRightAltMouseHook := 0
global isRightAltClickDown := false



processRightAltDoubledAsClick(state)
{
    if (state)
    {
        doubledRightAltDown()
    }
    else
    {
        doubledRightAltUp()
    }
}

doubledRightAltDown()
{
    if (isRightAltDoubledAsClickPressed)
    {
        return
    }

    isRightAltDoubledAsClickPressed := true
    setAltState(1)

    if (!isAnyLeftModifierPressed() && (isRightShiftDoubledAsClickPressed || isRightWinDoubledAsClickPressed || isRightCtrlDoubledAsClickPressed))
    {
        resetSendClickOnRightModifierRelease(1)
        return
    }

    sendClickOnRightAltClickRelease := true
    chooseClickDragActivation("rightAltClick", "mouseDragRightAltActivate", doubledRightAltMouseHook)
    setTimer TimerResetModifierReleaseAction, OFF
    setTimer TimerResetModifierReleaseAction, %timeoutStillSendLayoutKey%
}

mouseDragRightAltActivate(nCode, wParam, lParam)
{
    cancelMouseHook(doubledRightAltMouseHook)
    setTimer TimerResetModifierReleaseAction, OFF
    if (wParam = 0x200)
    {
        debug("mouseDragRightAltActivate")
        sendClickOnRightAltClickRelease := true
        isRightAltClickDown := true
        doubledAction := modifierDoubledAsClick["rightAltClick"]
        processKeyToSend("lbutton down")
    }
}

doubledRightAltUp()
{
    cancelMouseHook(doubledRightAltMouseHook)
    isRightAltDoubledAsClickPressed := false
    if (!isAnyLeftModifierPressed())
    {
        setTimer TimerResetModifierReleaseAction, OFF
    }

    if (isLeftAltDoubledAsClickPressed)
    {
        resetSendClickOnLeftModifierRelease(1)
    }
    else if (!isNormalAltActive)
    {
        ; for alt & win sending a normal up will trigger a special os action (activate the menu/startbar for example)
        altActive := 0
        processKeyToSend("alt up", "!")
    }

    if (isRightAltClickDown || sendClickOnRightAltClickRelease)
    {
        SetTimer TimerStickyFailBack, OFF
        SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
        sendDoubledValueAndReset("rightAltClick", sendClickOnRightAltClickRelease, isRightAltClickDown)
    }
}