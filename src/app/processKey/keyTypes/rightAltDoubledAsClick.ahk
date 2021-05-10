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
        setTimer TimerResetModifierReleaseAction, OFF
        resetSendClickOnRightModifierRelease(1)
        return
    }

    resetSendClickOnLeftModifierRelease(1)
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
        if (!isNormalAltActive && !isLeftAltDoubledAsClickPressed)
        {
            ; for alt & win sending a normal up will trigger a special os action (activate the menu/startbar for example)
            resetModifierWithoutTriggerUpState("alt", altActive)
        }
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

    if (!isNormalAltActive && !isLeftAltDoubledAsClickPressed)
    {
        ; for alt & win sending a normal up will trigger a special os action (activate the menu/startbar for example)
        altActive := 0
        processKeyToSend("{capslock}{capslock}{alt up}", true)
    }

    if (isRightAltClickDown || sendClickOnRightAltClickRelease)
    {
        SetTimer TimerStickyFailBack, OFF
        SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
        sendDoubledValueAndReset("rightAltClick", sendClickOnRightAltClickRelease, isRightAltClickDown)
    }
}