global sendClickOnRightAltClickRelease := false
global isRightAltDoubledAsClickPressed := false
global repressRightAltReleaseCancelAltActive := false
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

    if (isRightShiftDoubledAsClickPressed || isRightWinDoubledAsClickPressed || isRightCtrlDoubledAsClickPressed)
    {
        resetSendClickOnRightModifierRelease(1)
        setAltState(1)
        setTimer TimerMonitorAltModifierLift, %timeoutResetModifierContinuousPress%
        return
    }

    if (fixQuickTypeLeftRightDoubledModifiers || layoutKeyPressed || activePressedKeys.Length() > 0)
    {
        if (isAnyLeftModifierPressed())
        {
            continuousPressRightAlt()
        }
        else if (altActive)
        {
            repressNormalAltRelease := true
        }
    }
    else if (isAnyLeftModifierPressed())
    {
        continuousPressRightAlt()
        sendDoubledValueAndReset("rightAltClick", sendClickOnRightAltClickRelease, isRightAltClickDown)
        return
    }
    else if (altActive)
    {
        sendDoubledValueAndReset("rightAltClick", sendClickOnRightAltClickRelease, isRightAltClickDown)
        repressRightAltReleaseCancelAltActive := true
        return
    }

    altActive := 1

    sendClickOnRightAltClickRelease := true
    chooseClickDragActivation("rightAltClick", "mouseDragRightAltActivate", doubledRightAltMouseHook)
    setTimer TimerResetModifierReleaseAction, %timeoutStillSendLayoutKey%
}

continuousPressRightAlt()
{
    if (isLeftAltDoubledAsClickPressed)
    {
        setAltState(1)
        setTimer TimerMonitorAltModifierLift, %timeoutResetModifierContinuousPress%
    }
    resetSendClickOnLeftModifierRelease(1)
    repressLeftAltReleaseCancelAltActive := true
}

mouseDragRightAltActivate(nCode, wParam, lParam)
{
    cancelMouseHook(doubledRightAltMouseHook)
    if (wParam = 0x200)
    {
        sendClickOnRightAltClickRelease := true
        isRightAltClickDown := true
        doubledAction := modifierDoubledAsClick["rightAltClick"]
        send {blind}{%doubledAction% down}
    }
}

doubledRightAltUp()
{
    cancelMouseHook(doubledRightAltMouseHook)
    isRightAltDoubledAsClickPressed := false

    if (repressRightAltReleaseCancelAltActive)
    {
        repressRightAltReleaseCancelAltActive := false
    }
    else
    {
        altActive := 0
        repressNormalAltRelease := false
        repressLeftAltReleaseCancelAltActive := false
    }

    if (sendClickOnRightAltClickRelease)
    {
        sleep % timeoutResetModifierContinuousPress + 5
        sendDoubledValueAndReset("rightAltClick", sendClickOnRightAltClickRelease, isRightAltClickDown)
    }
}