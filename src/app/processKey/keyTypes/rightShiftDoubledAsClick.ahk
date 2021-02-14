global sendClickOnRightShiftClickRelease := false
global isRightShiftDoubledAsClickPressed := false
global repressRightShiftReleaseCancelShiftActive := false
global doubledRightShiftMouseHook := 0
global isRightShiftClickDown := false



processRightShiftDoubledAsClick(state)
{
    if (state)
    {
        doubledRightShiftDown()
    }
    else
    {
        doubledRightShiftUp()
    }
}

doubledRightShiftDown()
{
    if (isRightShiftDoubledAsClickPressed)
    {
        return
    }
    
    isRightShiftDoubledAsClickPressed := true

    if (isRightCtrlDoubledAsClickPressed || isRightWinDoubledAsClickPressed || isRightAltDoubledAsClickPressed)
    {
        resetSendClickOnRightModifierRelease(1)
        setShiftState(1)
        setTimer TimerMonitorShiftModifierLift, %timeoutResetModifierContinuousPress%
        return
    }

    if (fixQuickTypeLeftRightDoubledModifiers || layoutKeyPressed || activePressedKeys.Length() > 0)
    {
        if (isAnyLeftModifierPressed())
        {
            continuousPressRightShift()
        }
        else if (shiftActive)
        {
            repressNormalShiftRelease := true
        }
    }
    else if (isAnyLeftModifierPressed())
    {
        setTimer TimerResetModifierReleaseAction, OFF
        continuousPressRightShift()
    }
    else if (shiftActive)
    {
        repressRightShiftReleaseCancelShiftActive := true
        sendDoubledValueAndReset("rightShiftClick", sendClickOnRightShiftClickRelease, isRightShiftClickDown)
        return
    }

    shiftActive := 1
    sendClickOnRightShiftClickRelease := true
    chooseClickDragActivation("rightShiftClick", "mouseDragRightShiftActivate", doubledRightShiftMouseHook)
    setTimer TimerResetModifierReleaseAction, OFF
    setTimer TimerResetModifierReleaseAction, %timeoutStillSendLayoutKey%
}

continuousPressRightShift()
{
    resetSendClickOnLeftModifierRelease(1)
    if (isLeftShiftDoubledAsClickPressed)
    {
        repressLeftShiftReleaseCancelShiftActive := true
        setShiftState(1)
        setTimer TimerMonitorShiftModifierLift, %timeoutResetModifierContinuousPress%
    }
}

mouseDragRightShiftActivate(nCode, wParam, lParam)
{
    cancelMouseHook(doubledRightShiftMouseHook)
    setTimer TimerResetModifierReleaseAction, OFF
    if (wParam = 0x200)
    {
        debug("mouseDragRightShiftActivate")
        sendClickOnRightShiftClickRelease := true
        isRightShiftClickDown := true
        doubledAction := modifierDoubledAsClick["rightShiftClick"]
        send {blind}{%doubledAction% down}
    }
}

doubledRightShiftUp()
{
    cancelMouseHook(doubledRightShiftMouseHook)
    isRightShiftDoubledAsClickPressed := false
    if (!isAnyLeftModifierPressed())
    {
        setTimer TimerResetModifierReleaseAction, OFF
    }

    if (repressRightShiftReleaseCancelShiftActive)
    {
        repressRightShiftReleaseCancelShiftActive := false
    }
    else
    {
        if (repressNormalShiftRelease || repressLeftShiftReleaseCancelShiftActive)
        {
            repressNormalShiftRelease := false
            repressLeftShiftReleaseCancelShiftActive := false
        }
        else
        {
            SetTimer TimerStickyFailBack, OFF
            SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
            shiftActive := 0
        }
    }

    if (isRightShiftClickDown)
    {
        sendClickOnRightShiftClickRelease := true
        SetTimer TimerStickyFailBack, OFF
        SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
        sleep % timeoutResetModifierContinuousPress + 5
        sendDoubledValueAndReset("rightShiftClick", sendClickOnRightShiftClickRelease, isLeftShiftClickDown)
    }
    if (sendClickOnRightShiftClickRelease)
    {
        SetTimer TimerStickyFailBack, OFF
        SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
        sleep % timeoutResetModifierContinuousPress + 5
        sendDoubledValueAndReset("rightShiftClick", sendClickOnRightShiftClickRelease, isRightShiftClickDown)
    }
}