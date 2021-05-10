global sendClickOnRightShiftClickRelease := false
global isRightShiftDoubledAsClickPressed := false
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
    setShiftState(1)

    if (!isAnyLeftModifierPressed() && (isRightCtrlDoubledAsClickPressed || isRightWinDoubledAsClickPressed || isRightAltDoubledAsClickPressed))
    {
        resetSendClickOnRightModifierRelease(1)
        return
    }

    sendClickOnRightShiftClickRelease := true
    chooseClickDragActivation("rightShiftClick", "mouseDragRightShiftActivate", doubledRightShiftMouseHook)
    setTimer TimerResetModifierReleaseAction, OFF
    setTimer TimerResetModifierReleaseAction, %timeoutStillSendLayoutKey%
}

mouseDragRightShiftActivate(nCode, wParam, lParam)
{
    cancelMouseHook(doubledRightShiftMouseHook)
    setTimer TimerResetModifierReleaseAction, OFF
    if (wParam = 0x200)
    {
        debug("mouseDragRightShiftActivate")
        sendClickOnRightShiftClickRelease := true
        isRightShiftClickDown := true
        doubledAction := modifierDoubledAsClick["rightShiftClick"]
        processKeyToSend("lbutton down")
    }
}

doubledRightShiftUp()
{
    cancelMouseHook(doubledRightShiftMouseHook)
    isRightShiftDoubledAsClickPressed := false
    if (!isAnyLeftModifierPressed())
    {
        setTimer TimerResetModifierReleaseAction, OFF
    }

    if (isLeftShiftDoubledAsClickPressed)
    {
        resetSendClickOnLeftModifierRelease(1)
    }
    else if (!isNormalShiftActive)
    {
        setShiftState(0)
    }

    if (isRightShiftClickDown || sendClickOnRightShiftClickRelease)
    {
        SetTimer TimerStickyFailBack, OFF
        SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
        sendDoubledValueAndReset("rightShiftClick", sendClickOnRightShiftClickRelease, isRightShiftClickDown)
    }
}