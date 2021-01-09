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
        continuousPressLeftCtrl()
        sendDoubledValueAndReset("leftCtrlClick", sendClickOnLeftCtrlClickRelease, isLeftCtrlClickDown)
        return
    }
    else if (ctrlActive)
    {
        sendDoubledValueAndReset("leftCtrlClick", sendClickOnLeftCtrlClickRelease, isLeftCtrlClickDown)
        repressLeftCtrlReleaseCancelCtrlActive := true
        return
    }

    ctrlActive := 1

    sendClickOnLeftCtrlClickRelease := true
    chooseClickDragActivation("leftCtrlClick", "mouseDragLeftCtrlActivate", doubledLeftCtrlMouseHook)
    setTimer TimerResetModifierReleaseAction, %timeoutStillSendLayoutKey%
}

continuousPressLeftCtrl()
{
    if (isRightCtrlDoubledAsClickPressed)
    {
        setCtrlState(1)
    }
    resetSendClickOnRightModifierRelease(1)
    if (isRightCtrlDoubledAsClickPressed)
    {
        repressRightCtrlReleaseCancelCtrlActive := true
    }
}

mouseDragLeftCtrlActivate(nCode, wParam, lParam)
{
    cancelMouseHook(doubledLeftCtrlMouseHook)
    setTimer TimerResetModifierReleaseAction, OFF
    if (wParam = 0x200)
    {
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
            timerMonitorCtrlModifierLift()
        }
    }

    if (sendClickOnLeftCtrlClickRelease)
    {
        sendDoubledValueAndReset("leftCtrlClick", sendClickOnLeftCtrlClickRelease, isLeftCtrlClickDown)
    }
}