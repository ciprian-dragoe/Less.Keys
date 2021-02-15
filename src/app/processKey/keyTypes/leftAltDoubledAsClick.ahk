global sendClickOnLeftAltClickRelease := false
global isLeftAltDoubledAsClickPressed := false
global repressLeftAltReleaseCancelAltActive := false
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

    if (isLeftWinDoubledAsClickPressed || isLeftShiftDoubledAsClickPressed || isLeftCtrlDoubledAsClickPressed)
    {
        setTimer TimerResetModifierReleaseAction, OFF
        resetSendClickOnLeftModifierRelease(1)
        setAltState(1)
        setTimer TimerMonitorAltModifierLift, %timeoutResetModifierContinuousPress%
        return
    }

    if (fixQuickTypeLeftRightDoubledModifiers || layoutKeyPressed || activePressedKeys.Length() > 0)
    {
        if (isAnyRightModifierPressed())
        {
            setTimer TimerResetModifierReleaseAction, OFF
            continuousPressLeftAlt()
        }
        else if (altActive)
        {
            repressNormalAltRelease := true
        }
    }
    else if (isAnyRightModifierPressed())
    {
        continuousPressLeftAlt()
    }
    else if (altActive)
    {
        repressLeftAltReleaseCancelAltActive := true
        sendDoubledValueAndReset("leftAltClick", sendClickOnLeftAltClickRelease, isLeftAltClickDown)
        return
    }

    altActive := 1

    sendClickOnLeftAltClickRelease := true
    chooseClickDragActivation("leftAltClick", "mouseDragLeftAltActivate", doubledLeftAltMouseHook)
    setTimer TimerResetModifierReleaseAction, OFF
    setTimer TimerResetModifierReleaseAction, %timeoutStillSendLayoutKey%
}

continuousPressLeftAlt()
{
    resetSendClickOnRightModifierRelease(1)
    if (isRightAltDoubledAsClickPressed)
    {
        repressRightAltReleaseCancelAltActive := true
        setAltState(1)
        setTimer TimerMonitorAltModifierLift, %timeoutResetModifierContinuousPress%
    }
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
        send {blind}{%doubledAction% down}
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

    if (repressLeftAltReleaseCancelAltActive)
    {
        repressLeftAltReleaseCancelAltActive := false
    }
    else
    {
        if (repressNormalAltRelease || repressRightAltReleaseCancelAltActive)
        {
            repressNormalAltRelease := false
            repressRightAltReleaseCancelAltActive := false
        }
        else
        {
            SetTimer TimerStickyFailBack, OFF
            SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
            altActive := 0
        }
    }
    if (isLeftAltClickDown)
    {
        sendClickOnLeftAltClickRelease := true
        SetTimer TimerStickyFailBack, OFF
        SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
        sleep % timeoutResetModifierContinuousPress + 5
        sendDoubledValueAndReset("leftAltClick", sendClickOnLeftAltClickRelease, isLeftAltClickDown)
    }
    else if (sendClickOnLeftAltClickRelease)
    {
        SetTimer TimerStickyFailBack, OFF
        SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
        sleep % timeoutResetModifierContinuousPress + 5
        sendDoubledValueAndReset("leftAltClick", sendClickOnLeftAltClickRelease, isLeftAltClickDown)
    }
}