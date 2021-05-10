global sendClickOnLeftAltClickRelease := false
global isLeftAltDoubledAsClickPressed := false
global doubledLeftAltMouseHook := 0
global isLeftAltClickDown := false



processLeftAltDoubledAsClick(state)
{
    if (state)
    {
        doubledLeftAltDown()
    }
    else
    {
        doubledLeftAltUp()
    }
}

doubledLeftAltDown()
{
    if (isLeftAltDoubledAsClickPressed)
    {
        return
    }

    isLeftAltDoubledAsClickPressed := true
    setAltState(1)

    if (!isAnyRightModifierPressed() && (isLeftWinDoubledAsClickPressed || isLeftShiftDoubledAsClickPressed || isLeftCtrlDoubledAsClickPressed))
    {
        resetSendClickOnLeftModifierRelease(1)
        return
    }

    sendClickOnLeftAltClickRelease := true
    chooseClickDragActivation("leftAltClick", "mouseDragLeftAltActivate", doubledLeftAltMouseHook)
    setTimer TimerResetModifierReleaseAction, OFF
    setTimer TimerResetModifierReleaseAction, %timeoutStillSendLayoutKey%
}

mouseDragLeftAltActivate(nCode, wParam, lParam)
{
    cancelMouseHook(doubledLeftAltMouseHook)
    setTimer TimerResetModifierReleaseAction, OFF
    if (wParam = 0x200)
    {
        debug("mouseDragLeftAltActivate")
        sendClickOnLeftAltClickRelease := true
        isLeftAltClickDown := true
        doubledAction := modifierDoubledAsClick["leftAltClick"]
        processKeyToSend("lbutton down")
    }
}

doubledLeftAltUp()
{
    cancelMouseHook(doubledLeftAltMouseHook)
    isLeftAltDoubledAsClickPressed := false
    if (!isAnyRightModifierPressed())
    {
        setTimer TimerResetModifierReleaseAction, OFF
    }

    if (isRightAltDoubledAsClickPressed)
    {
        resetSendClickOnRightModifierRelease(1)
    }
    else if (!isNormalAltActive)
    {
        ; for alt & win sending a normal up will trigger a special os action (activate the menu/startbar for example)
        altActive := 0
        processKeyToSend("alt up", "!")
    }

    if (isLeftAltClickDown || sendClickOnLeftAltClickRelease)
    {
        SetTimer TimerStickyFailBack, OFF
        SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
        sendDoubledValueAndReset("leftAltClick", sendClickOnLeftAltClickRelease, isLeftAltClickDown)
    }
}