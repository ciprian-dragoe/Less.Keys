global sendClickOnLeftWinClickRelease := false
global isLeftWinDoubledAsClickPressed := false
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

    if (!isAnyRightModifierPressed() && isLeftCtrlDoubledAsClickPressed || isLeftShiftDoubledAsClickPressed || isLeftAltDoubledAsClickPressed)
    {
        resetSendClickOnLeftModifierRelease(1)
        winActive := 1
        return
    }

    continuousPressAnyActiveRightModifier()

    winActive := 1

    sendClickOnLeftWinClickRelease := true
    chooseClickDragActivation("leftWinClick", "mouseDragLeftWinActivate", doubledLeftWinMouseHook)
    setTimer TimerResetModifierReleaseAction, OFF
    setTimer TimerResetModifierReleaseAction, %timeoutStillSendLayoutKey%
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

    if (isRightWinDoubledAsClickPressed)
    {
        resetSendClickOnRightModifierRelease(1)
    }
    else
    {
        SetTimer TimerStickyFailBack, OFF
        SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
        winActive := 0
    }

    if (isLeftWinClickDown)
    {
        SetTimer TimerStickyFailBack, OFF
        SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
        sleep % timeoutResetModifierContinuousPress + 5
        sendDoubledValueAndReset("leftWinClick", sendClickOnLeftWinClickRelease, isLeftWinClickDown)
    }
    else if (sendClickOnLeftWinClickRelease)
    {
        SetTimer TimerStickyFailBack, OFF
        SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
        sleep % timeoutResetModifierContinuousPress + 5
        sendDoubledValueAndReset("leftWinClick", sendClickOnLeftWinClickRelease, isLeftWinClickDown)
    }
}