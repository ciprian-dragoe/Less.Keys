global sendClickOnRightWinClickRelease := false
global isRightWinDoubledAsClickPressed := false
global repressRightWinReleaseCancelWinActive := false
global doubledRightWinMouseHook := 0
global isRightWinClickDown := false



processRightWinDoubledAsClick(state)
{
    if (state)
    {
        doubledRightWinDown()
    }
    else
    {
        doubledRightWinUp()
    }
}

doubledRightWinDown()
{
    if (isRightWinDoubledAsClickPressed)
    {
        return
    }

    isRightWinDoubledAsClickPressed := true

    if (isRightShiftDoubledAsClickPressed || isRightAltDoubledAsClickPressed || isRightCtrlDoubledAsClickPressed)
    {
        resetSendClickOnRightModifierRelease(1)
        winActive := 1
        return
    }

    if (fixQuickTypeLeftRightDoubledModifiers || layoutKeyPressed || activePressedKeys.Length() > 0)
    {
        if (isAnyLeftModifierPressed())
        {
            continuousPressRightWin()
        }
        else if (winActive)
        {
            repressNormalWinRelease := true
        }
    }
    else if (isAnyLeftModifierPressed())
    {
        setTimer TimerResetModifierReleaseAction, OFF
        continuousPressRightWin()
        sendDoubledValueAndReset("rightWinClick", sendClickOnRightWinClickRelease, isRightWinClickDown)
        return
    }
    else if (winActive)
    {
        repressRightWinReleaseCancelWinActive := true
        sendDoubledValueAndReset("rightWinClick", sendClickOnRightWinClickRelease, isRightWinClickDown)
        return
    }

    winActive := 1

    sendClickOnRightWinClickRelease := true
    chooseClickDragActivation("rightWinClick", "mouseDragRightWinActivate", doubledRightWinMouseHook)
    setTimer TimerResetModifierReleaseAction, OFF
    setTimer TimerResetModifierReleaseAction, %timeoutStillSendLayoutKey%
}

continuousPressRightWin()
{
    if (isLeftWinDoubledAsClickPressed)
    {
        repressLeftWinReleaseCancelWinActive := true
    }
    resetSendClickOnLeftModifierRelease(1)
    if (isLeftWinDoubledAsClickPressed)
    {
        setWinState(1)
        setTimer TimerMonitorWinModifierLift, %timeoutResetModifierContinuousPress%
    }
}

mouseDragRightWinActivate(nCode, wParam, lParam)
{
    cancelMouseHook(doubledRightWinMouseHook)
    setTimer TimerResetModifierReleaseAction, OFF
    if (wParam = 0x200)
    {
        debug("mouseDragRightWinActivate")
        sendClickOnRightWinClickRelease := true
        isRightWinClickDown := true
        doubledAction := modifierDoubledAsClick["rightWinClick"]
        send {blind}{%doubledAction% down}
    }
}

doubledRightWinUp()
{
    cancelMouseHook(doubledRightWinMouseHook)
    isRightWinDoubledAsClickPressed := false
    if (!isAnyLeftModifierPressed())
    {
        setTimer TimerResetModifierReleaseAction, OFF
    }

    if (repressRightWinReleaseCancelWinActive)
    {
        repressRightWinReleaseCancelWinActive := false
    }
    else
    {
        if (repressNormalWinRelease || repressLeftWinReleaseCancelWinActive)
        {
            repressNormalWinRelease := false
            repressLeftWinReleaseCancelWinActive := false
        }
        else
        {
            winActive := 0
        }
    }

    if (sendClickOnRightWinClickRelease)
    {
        SetTimer TimerStickyFailBack, OFF
        SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%3
        sleep % timeoutResetModifierContinuousPress + 5
        sendDoubledValueAndReset("rightWinClick", sendClickOnRightWinClickRelease, isRightWinClickDown)
    }
}