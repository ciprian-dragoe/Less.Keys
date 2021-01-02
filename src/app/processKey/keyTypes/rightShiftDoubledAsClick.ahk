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
        continuousPressRightShift()
        sendDoubledValueAndReset("rightShiftClick", sendClickOnRightShiftClickRelease, isRightShiftClickDown)
        return
    }
    else if (shiftActive)
    {
        sendDoubledValueAndReset("rightShiftClick", sendClickOnRightShiftClickRelease, isRightShiftClickDown)
        repressRightShiftReleaseCancelShiftActive := true
        return
    }

    shiftActive := 1
    sendClickOnRightShiftClickRelease := true
    chooseClickDragActivation("rightShiftClick", "mouseDragRightShiftActivate", doubledRightShiftMouseHook)
    setTimer TimerResetModifierReleaseAction, %timeoutStillSendLayoutKey%
}

continuousPressRightShift()
{
    if (isLeftShiftDoubledAsClickPressed)
    {
        setShiftState(1)
        setTimer TimerMonitorShiftModifierLift, %timeoutResetModifierContinuousPress%
    }
    resetSendClickOnLeftModifierRelease(1)
    if (isLeftShiftDoubledAsClickPressed)
    {
        repressLeftShiftReleaseCancelShiftActive := true
    }
}

mouseDragRightShiftActivate(nCode, wParam, lParam)
{
    cancelMouseHook(doubledRightShiftMouseHook)
    setTimer TimerResetModifierReleaseAction, OFF
    if (wParam = 0x200)
    {
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
            shiftActive := 0
        }
    }

    if (sendClickOnRightShiftClickRelease)
    {
        sleep % timeoutResetModifierContinuousPress + 5
        sendDoubledValueAndReset("rightShiftClick", sendClickOnRightShiftClickRelease, isRightShiftClickDown)
    }
}