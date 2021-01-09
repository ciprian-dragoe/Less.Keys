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
        continuousPressLeftShift()
        sendDoubledValueAndReset("leftShiftClick", sendClickOnLeftShiftClickRelease, isLeftShiftClickDown)
        return
    }
    else if (shiftActive)
    {
        sendDoubledValueAndReset("leftShiftClick", sendClickOnLeftShiftClickRelease, isLeftShiftClickDown)
        repressLeftShiftReleaseCancelShiftActive := true
        return
    }

    shiftActive := 1

    sendClickOnLeftShiftClickRelease := true
    chooseClickDragActivation("leftShiftClick", "mouseDragLeftShiftActivate", doubledLeftShiftMouseHook)
    setTimer TimerResetModifierReleaseAction, %timeoutStillSendLayoutKey%
}

continuousPressLeftShift()
{
    if (isRightShiftDoubledAsClickPressed)
    {
        setShiftState(1)
    }
    resetSendClickOnRightModifierRelease(1)
    if (isRightShiftDoubledAsClickPressed)
    {
        repressRightShiftReleaseCancelShiftActive := true
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
            timerMonitorShiftModifierLift()
        }
    }

    if (sendClickOnLeftShiftClickRelease)
    {
        sendDoubledValueAndReset("leftShiftClick", sendClickOnLeftShiftClickRelease, isLeftShiftClickDown)
    }
}