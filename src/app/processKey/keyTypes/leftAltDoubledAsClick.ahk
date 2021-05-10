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
        setTimer TimerResetModifierReleaseAction, OFF
        resetSendClickOnLeftModifierRelease(1)
        return
    }

    resetSendClickOnRightModifierRelease(1)
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
        if (!isNormalAltActive && !isRightAltDoubledAsClickPressed)
        {
            ; for alt & win sending a normal up will trigger a special os action (activate the menu/startbar for example)
            resetModifierWithoutTriggerUpState("alt", altActive)
        }
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

    if (!isNormalAltActive && !isRightAltDoubledAsClickPressed)
    {
        ; for alt & win sending a normal up will trigger a special os action (activate the menu/startbar for example)
        altActive := 0
        processKeyToSend("{capslock}{capslock}{alt up}", true)
    }

    if (isLeftAltClickDown || sendClickOnLeftAltClickRelease)
    {
        SetTimer TimerStickyFailBack, OFF
        SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
        sendDoubledValueAndReset("leftAltClick", sendClickOnLeftAltClickRelease, isLeftAltClickDown)
    }
}