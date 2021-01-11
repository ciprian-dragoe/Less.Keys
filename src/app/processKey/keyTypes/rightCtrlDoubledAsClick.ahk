global sendClickOnRightCtrlClickRelease := false
global isRightCtrlDoubledAsClickPressed := false
global repressRightCtrlReleaseCancelCtrlActive := false
global doubledRightCtrlMouseHook := 0
global isRightCtrlClickDown := false



processRightCtrlDoubledAsClick(state)
{
    if (state)
    {
        doubledRightCtrlDown()
    }
    else
    {
        doubledRightCtrlUp()
    }
}

doubledRightCtrlDown()
{
    if (isRightCtrlDoubledAsClickPressed)
    {
        return
    }

    isRightCtrlDoubledAsClickPressed := true

    if (isRightShiftDoubledAsClickPressed || isRightWinDoubledAsClickPressed || isRightAltDoubledAsClickPressed)
    {
        resetSendClickOnRightModifierRelease(1)
        setCtrlState(1)
        setTimer TimerMonitorCtrlModifierLift, %timeoutResetModifierContinuousPress%
        return
    }

    if (fixQuickTypeLeftRightDoubledModifiers || layoutKeyPressed || activePressedKeys.Length() > 0)
    {
        if (isAnyLeftModifierPressed())
        {
            continuousPressRightCtrl()
        }
        else if (ctrlActive)
        {
            repressNormalCtrlRelease := true
        }
    }
    else if (isAnyLeftModifierPressed())
    {
        setTimer TimerResetModifierReleaseAction, OFF
        continuousPressRightCtrl()
        sendDoubledValueAndReset("rightCtrlClick", sendClickOnRightCtrlClickRelease, isRightCtrlClickDown)
        return
    }
    else if (ctrlActive)
    {
        repressRightCtrlReleaseCancelCtrlActive := true
        sendDoubledValueAndReset("rightCtrlClick", sendClickOnRightCtrlClickRelease, isRightCtrlClickDown)
        return
    }

    ctrlActive := 1

    sendClickOnRightCtrlClickRelease := true
    chooseClickDragActivation("rightCtrlClick", "mouseDragRightCtrlActivate", doubledRightCtrlMouseHook)
    setTimer TimerResetModifierReleaseAction, OFF
    setTimer TimerResetModifierReleaseAction, %timeoutStillSendLayoutKey%
}

continuousPressRightCtrl()
{
    if (isLeftCtrlDoubledAsClickPressed)
    {
        repressLeftCtrlReleaseCancelCtrlActive := true
    }
    resetSendClickOnLeftModifierRelease(1)
    if (isLeftCtrlDoubledAsClickPressed)
    {
        setCtrlState(1)
        setTimer TimerMonitorCtrlModifierLift, %timeoutResetModifierContinuousPress%
    }
}

mouseDragRightCtrlActivate(nCode, wParam, lParam)
{
    cancelMouseHook(doubledRightCtrlMouseHook)
    setTimer TimerResetModifierReleaseAction, OFF
    if (wParam = 0x200)
    {
        debug("mouseDragRightCtrlActivate")
        sendClickOnRightCtrlClickRelease := true
        isRightCtrlClickDown := true
        doubledAction := modifierDoubledAsClick["rightCtrlClick"]
        send {blind}{%doubledAction% down}
    }
}

doubledRightCtrlUp()
{
    cancelMouseHook(doubledRightCtrlMouseHook)
    isRightCtrlDoubledAsClickPressed := false
    if (!isAnyLeftModifierPressed())
    {
        setTimer TimerResetModifierReleaseAction, OFF
    }

    if (repressRightCtrlReleaseCancelCtrlActive)
    {
        repressRightCtrlReleaseCancelCtrlActive := false
    }
    else
    {
        if (repressNormalCtrlRelease || repressLeftCtrlReleaseCancelCtrlActive)
        {
            repressNormalCtrlRelease := false
            repressLeftCtrlReleaseCancelCtrlActive := false
        }
        else
        {
            ctrlActive := 0
        }
    }

    if (sendClickOnRightCtrlClickRelease)
    {
        SetTimer TimerStickyFailBack, OFF
        SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
        sleep % timeoutResetModifierContinuousPress + 5
        sendDoubledValueAndReset("rightCtrlClick", sendClickOnRightCtrlClickRelease, isRightCtrlClickDown)
    }
}