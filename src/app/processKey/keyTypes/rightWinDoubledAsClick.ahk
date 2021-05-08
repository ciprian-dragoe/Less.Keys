global sendClickOnRightWinClickRelease := false
global isRightWinDoubledAsClickPressed := false
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

    if (!isAnyLeftModifierPressed() && (isRightShiftDoubledAsClickPressed || isRightAltDoubledAsClickPressed || isRightCtrlDoubledAsClickPressed))
    {
        resetSendClickOnRightModifierRelease(1)
        winActive := 1
        return
    }

    continuousPressAnyActiveLeftModifier()

    winActive := 1

    sendClickOnRightWinClickRelease := true
    chooseClickDragActivation("rightWinClick", "mouseDragRightWinActivate", doubledRightWinMouseHook)
    setTimer TimerResetModifierReleaseAction, OFF
    setTimer TimerResetModifierReleaseAction, %timeoutStillSendLayoutKey%
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

    if (isLeftWinDoubledAsClickPressed)
    {
        resetSendClickOnLeftModifierRelease(1)
    }
    else
    {
        SetTimer TimerStickyFailBack, OFF
        SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
        winActive := 0
        if (isDoubledWinTriggeringDeepModifierPress)
        {
            isDoubledWinTriggeringDeepModifierPress := false
            timerMonitorWinModifierLift()
        }
    }

    if (isRightWinClickDown || sendClickOnRightWinClickRelease)
    {
        SetTimer TimerStickyFailBack, OFF
        SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
        sendDoubledValueAndReset("rightWinClick", sendClickOnRightWinClickRelease, isRightWinClickDown)
    }
}