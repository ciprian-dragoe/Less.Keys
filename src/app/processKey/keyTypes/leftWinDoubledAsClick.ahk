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
        continuousPressLeftWin()
        sendDoubledValueAndReset("leftWinClick", sendClickOnLeftWinClickRelease, isLeftWinClickDown)
        return
    }
    else if (winActive)
    {
        sendDoubledValueAndReset("leftWinClick", sendClickOnLeftWinClickRelease, isLeftWinClickDown)
        repressLeftWinReleaseCancelWinActive := true
        return
    }

    winActive := 1

    sendClickOnLeftWinClickRelease := true
    chooseClickDragActivation("leftWinClick", "mouseDragLeftWinActivate", doubledLeftWinMouseHook)
    setTimer TimerResetModifierReleaseAction, %timeoutStillSendLayoutKey%
}

continuousPressLeftWin()
{
    if (isRightWinDoubledAsClickPressed)
    {
        setWinState(1)
        setTimer TimerMonitorWinModifierLift, %timeoutResetModifierContinuousPress%
    }
    resetSendClickOnRightModifierRelease(1)
    repressRightWinReleaseCancelWinActive := true
}

mouseDragLeftWinActivate(nCode, wParam, lParam)
{
    cancelMouseHook(doubledLeftWinMouseHook)
    setTimer TimerResetModifierReleaseAction, OFF
    if (wParam = 0x200)
    {
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
            winActive := 0
        }
    }

    if (sendClickOnLeftWinClickRelease)
    {
        sleep % timeoutResetModifierContinuousPress + 5
        sendDoubledValueAndReset("leftWinClick", sendClickOnLeftWinClickRelease, isLeftWinClickDown)
    }
}