global sendClickOnLeftCtrlClickRelease := false
global isLeftCtrlDoubledAsClickPressed := false
global repressLeftCtrlReleaseCancelCtrlActive := false
global doubledLeftCtrlMouseHook := 0
global isLeftCtrlClickDown := false



processLeftCtrlDoubledAsClick(state)
{
    if (state)
    {
        doubledLeftCtrlDown()
    }
    else
    {
        doubledLeftCtrlUp()
    }
}

doubledLeftCtrlDown()
{
    if (isLeftCtrlDoubledAsClickPressed)
    {
        return
    }

    isLeftCtrlDoubledAsClickPressed := true

    if (isLeftWinDoubledAsClickPressed || isLeftShiftDoubledAsClickPressed || isLeftAltDoubledAsClickPressed)
    {
        resetSendClickOnLeftModifierRelease(1)
        setCtrlState(1)
        setTimer TimerMonitorCtrlModifierLift, %timeoutResetModifierContinuousPress%, -2147483648
        return
    }

    if (fixQuickTypeLeftRightDoubledModifiers || layoutKeyPressed || activePressedKeys.Length() > 0)
    {
        if (isAnyRightModifierPressed())
        {
            continuousPressLeftCtrl()
        }
        else if (ctrlActive)
        {
            repressNormalCtrlRelease := true
        }
    }
    else if (isAnyRightModifierPressed())
    {
        setTimer TimerResetModifierReleaseAction, OFF
        continuousPressLeftCtrl()
        sendDoubledValueAndReset("leftCtrlClick", sendClickOnLeftCtrlClickRelease, isLeftCtrlClickDown)
        return
    }
    else if (ctrlActive)
    {
        repressLeftCtrlReleaseCancelCtrlActive := true
        sendDoubledValueAndReset("leftCtrlClick", sendClickOnLeftCtrlClickRelease, isLeftCtrlClickDown)
        return
    }

    ctrlActive := 1

    sendClickOnLeftCtrlClickRelease := true
    chooseClickDragActivation("leftCtrlClick", "mouseDragLeftCtrlActivate", doubledLeftCtrlMouseHook)
    setTimer TimerResetModifierReleaseAction, OFF
    setTimer TimerResetModifierReleaseAction, %timeoutStillSendLayoutKey%, -2147483648
}

continuousPressLeftCtrl()
{
    if (isRightCtrlDoubledAsClickPressed)
    {
        repressRightCtrlReleaseCancelCtrlActive := true
    }
    resetSendClickOnRightModifierRelease(1)
    if (isRightCtrlDoubledAsClickPressed)
    {
        setCtrlState(1)
        setTimer TimerMonitorCtrlModifierLift, %timeoutResetModifierContinuousPress%, -2147483648
    }
}

mouseDragLeftCtrlActivate(nCode, wParam, lParam)
{
    cancelMouseHook(doubledLeftCtrlMouseHook)
    setTimer TimerResetModifierReleaseAction, OFF
    if (wParam = 0x200)
    {
        debug("mouseDragLeftCtrlActivate")
        sendClickOnLeftCtrlClickRelease := true
        isLeftCtrlClickDown := true
        doubledAction := modifierDoubledAsClick["leftCtrlClick"]
        send {blind}{%doubledAction% down}
    }
}

doubledLeftCtrlUp()
{
    cancelMouseHook(doubledLeftCtrlMouseHook)
    isLeftCtrlDoubledAsClickPressed := false
    if (!isAnyRightModifierPressed())
    {
        setTimer TimerResetModifierReleaseAction, OFF
    }

    if (repressLeftCtrlReleaseCancelCtrlActive)
    {
        repressLeftCtrlReleaseCancelCtrlActive := false
    }
    else
    {
        if (repressNormalCtrlRelease || repressRightCtrlReleaseCancelCtrlActive)
        {
            repressNormalCtrlRelease := false
            repressRightCtrlReleaseCancelCtrlActive := false
        }
        else
        {
            ctrlActive := 0
        }
    }

    if (sendClickOnLeftCtrlClickRelease)
    {
        SetTimer TimerStickyFailBack, OFF
        SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
        sleep % timeoutResetModifierContinuousPress + 5
        sendDoubledValueAndReset("leftCtrlClick", sendClickOnLeftCtrlClickRelease, isLeftCtrlClickDown)
    }
}