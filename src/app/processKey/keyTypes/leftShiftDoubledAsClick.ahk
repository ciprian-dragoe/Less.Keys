global sendClickOnLeftShiftClickRelease := false
global isLeftShiftDoubledAsClickPressed := false
global repressLeftShiftReleaseCancelShiftActive := false
global doubledLeftShiftMouseHook := 0
global isLeftShiftClickDown := false



processLeftShiftDoubledAsClick(state)
{
    if (state)
    {
        doubledLeftShiftDown()
    }
    else
    {
        doubledLeftShiftUp()
    }
}

doubledLeftShiftDown()
{
    if (isLeftShiftDoubledAsClickPressed)
    {
        return
    }
    
    isLeftShiftDoubledAsClickPressed := true
    
    if (isLeftCtrlDoubledAsClickPressed || isLeftWinDoubledAsClickPressed || isLeftAltDoubledAsClickPressed)
    {
        resetSendClickOnLeftModifierRelease(1)
        setShiftState(1)
        setTimer TimerMonitorShiftModifierLift, %timeoutResetModifierContinuousPress%
        return
    }

    if (fixQuickTypeLeftRightDoubledModifiers || layoutKeyPressed || activePressedKeys.Length() > 0)
    {
        if (isAnyRightModifierPressed())
        {
            continuousPressLeftShift()
        }
        else if (shiftActive)
        {
            repressNormalShiftRelease := true
        }
    }
    else if (isAnyRightModifierPressed())
    {
        setTimer TimerResetModifierReleaseAction, OFF
        continuousPressLeftShift()
        sendDoubledValueAndReset("leftShiftClick", sendClickOnLeftShiftClickRelease, isLeftShiftClickDown)
        return
    }
    else if (shiftActive)
    {
        repressLeftShiftReleaseCancelShiftActive := true
        sendDoubledValueAndReset("leftShiftClick", sendClickOnLeftShiftClickRelease, isLeftShiftClickDown)
        return
    }

    shiftActive := 1

    sendClickOnLeftShiftClickRelease := true
    chooseClickDragActivation("leftShiftClick", "mouseDragLeftShiftActivate", doubledLeftShiftMouseHook)
    setTimer TimerResetModifierReleaseAction, OFF
    setTimer TimerResetModifierReleaseAction, %timeoutStillSendLayoutKey%
}

continuousPressLeftShift()
{
    if (isRightShiftDoubledAsClickPressed)
    {
        repressRightShiftReleaseCancelShiftActive := true
    }
    resetSendClickOnRightModifierRelease(1)
    if (isRightShiftDoubledAsClickPressed)
    {
        setShiftState(1)
        setTimer TimerMonitorShiftModifierLift, %timeoutResetModifierContinuousPress%
    }
}

mouseDragLeftShiftActivate(nCode, wParam, lParam)
{
    cancelMouseHook(doubledLeftShiftMouseHook)
    setTimer TimerResetModifierReleaseAction, OFF
    if (wParam = 0x200)
    {
        sendClickOnLeftShiftClickRelease := true
        isLeftShiftClickDown := true
        doubledAction := modifierDoubledAsClick["leftShiftClick"]
        send {blind}{%doubledAction% down}
    }
}

doubledLeftShiftUp()
{
    cancelMouseHook(doubledLeftShiftMouseHook)
    isLeftShiftDoubledAsClickPressed := false

    if (repressLeftShiftReleaseCancelShiftActive)
    {
        repressLeftShiftReleaseCancelShiftActive := false
    }
    else
    {
        if (repressNormalShiftRelease || repressRightShiftReleaseCancelShiftActive)
        {
            repressNormalShiftRelease := false
            repressRightShiftReleaseCancelShiftActive := false
        }
        else
        {
            shiftActive := 0
        }
    }

    if (sendClickOnLeftShiftClickRelease)
    {
        sleep % timeoutResetModifierContinuousPress + 5
        sendDoubledValueAndReset("leftShiftClick", sendClickOnLeftShiftClickRelease, isLeftShiftClickDown)
    }
}