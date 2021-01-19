global sendClickOnLeftWinClickRelease := false
global isLeftWinDoubledAsClickPressed := false
global repressLeftWinReleaseCancelWinActive := false
global doubledLeftWinMouseHook := 0
global isLeftWinClickDown := false



processLeftWinDoubledAsClick(state)
{
    if (state)
    {
        doubledLeftWinDown()
    }
    else
    {
        doubledLeftWinUp()
    }
}

doubledLeftWinDown()
{
    if (isLeftWinDoubledAsClickPressed)
    {
        return
    }

    isLeftWinDoubledAsClickPressed := true

    if (isLeftCtrlDoubledAsClickPressed || isLeftShiftDoubledAsClickPressed || isLeftAltDoubledAsClickPressed)
    {
        resetSendClickOnLeftModifierRelease(1)
        winActive := 1
        return
    }

    if (fixQuickTypeLeftRightDoubledModifiers || layoutKeyPressed || activePressedKeys.Length() > 0)
    {
        if (isAnyRightModifierPressed())
        {
            continuousPressLeftWin()
        }
        else if (winActive)
        {
            repressNormalWinRelease := true
        }
    }
    else if (isAnyRightModifierPressed())
    {
        setTimer TimerResetModifierReleaseAction, OFF
        continuousPressLeftWin()
        sendDoubledValueAndReset("leftWinClick", sendClickOnLeftWinClickRelease, isLeftWinClickDown)
        return
    }
    else if (winActive)
    {
        repressLeftWinReleaseCancelWinActive := true
        sendDoubledValueAndReset("leftWinClick", sendClickOnLeftWinClickRelease, isLeftWinClickDown)
        return
    }

    winActive := 1

    sendClickOnLeftWinClickRelease := true
    chooseClickDragActivation("leftWinClick", "mouseDragLeftWinActivate", doubledLeftWinMouseHook)
    setTimer TimerResetModifierReleaseAction, OFF
    setTimer TimerResetModifierReleaseAction, %timeoutStillSendLayoutKey%, -2147483648
}

continuousPressLeftWin()
{
    if (isRightWinDoubledAsClickPressed)
    {
        repressRightWinReleaseCancelWinActive := true
    }
    resetSendClickOnRightModifierRelease(1)
    if (isRightWinDoubledAsClickPressed)
    {
        setWinState(1)
        setTimer TimerMonitorWinModifierLift, %timeoutResetModifierContinuousPress%, -2147483648
    }
}

mouseDragLeftWinActivate(nCode, wParam, lParam)
{
    cancelMouseHook(doubledLeftWinMouseHook)
    setTimer TimerResetModifierReleaseAction, OFF
    if (wParam = 0x200)
    {
        debug("mouseDragLeftWinActivate")
        sendClickOnLeftWinClickRelease := true
        isLeftWinClickDown := true
        doubledAction := modifierDoubledAsClick["leftWinClick"]
        send {blind}{%doubledAction% down}
    }
}

doubledLeftWinUp()
{
    cancelMouseHook(doubledLeftWinMouseHook)
    isLeftWinDoubledAsClickPressed := false
    if (!isAnyRightModifierPressed())
    {
        setTimer TimerResetModifierReleaseAction, OFF
    }

    if (repressLeftWinReleaseCancelWinActive)
    {
        repressLeftWinReleaseCancelWinActive := false
    }
    else
    {
        if (repressNormalWinRelease || repressRightWinReleaseCancelWinActive)
        {
            repressNormalWinRelease := false
            repressRightWinReleaseCancelWinActive := false
        }
        else
        {
            SetTimer TimerStickyFailBack, OFF
            SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%, -2147483648
            winActive := 0
        }
    }

    if (isLeftWinClickDown)
    {
        sendClickOnLeftWinClickRelease := true
        SetTimer TimerStickyFailBack, OFF
        SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%, -2147483648
        sleep % timeoutResetModifierContinuousPress + 5
        sendDoubledValueAndReset("leftWinClick", sendClickOnLeftWinClickRelease, isLeftWinClickDown)
    }
    else if (sendClickOnLeftWinClickRelease)
    {
        SetTimer TimerStickyFailBack, OFF
        SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%, -2147483648
        sleep % timeoutResetModifierContinuousPress + 5
        sendDoubledValueAndReset("leftWinClick", sendClickOnLeftWinClickRelease, isLeftWinClickDown)
    }
}