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
        resetSendClickOnLeftModifierRelease(1)
        setAltState(1)
        setTimer TimerMonitorAltModifierLift, %timeoutResetModifierContinuousPress%
        return
    }

    if (fixQuickTypeLeftRightDoubledModifiers || layoutKeyPressed || activePressedKeys.Length() > 0)
    {
        if (isAnyRightModifierPressed())
        {
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
        sendDoubledValueAndReset("leftAltClick", sendClickOnLeftAltClickRelease, isLeftAltClickDown)
        return
    }
    else if (altActive)
    {
        sendDoubledValueAndReset("leftAltClick", sendClickOnLeftAltClickRelease, isLeftAltClickDown)
        repressLeftAltReleaseCancelAltActive := true
        return
    }

    altActive := 1

    sendClickOnLeftAltClickRelease := true
    chooseClickDragActivation("leftAltClick", "mouseDragLeftAltActivate", doubledLeftAltMouseHook)
    setTimer TimerResetModifierReleaseAction, %timeoutStillSendLayoutKey%
}

continuousPressLeftAlt()
{
    if (isRightAltDoubledAsClickPressed)
    {
        setAltState(1)
        setTimer TimerMonitorAltModifierLift, %timeoutResetModifierContinuousPress%
    }
    resetSendClickOnRightModifierRelease(1)
    if (isRightAltDoubledAsClickPressed)
    {
        repressRightAltReleaseCancelAltActive := true
    }
}

mouseDragLeftAltActivate(nCode, wParam, lParam)
{
    cancelMouseHook(doubledLeftAltMouseHook)
    setTimer TimerResetModifierReleaseAction, OFF
    if (wParam = 0x200)
    {
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
            altActive := 0
        }
    }

    if (sendClickOnLeftAltClickRelease)
    {
        sleep % timeoutResetModifierContinuousPress + 5
        sendDoubledValueAndReset("leftAltClick", sendClickOnLeftAltClickRelease, isLeftAltClickDown)
    }
}