global sendClickOnRightShiftClickRelease := false
global sendUnClickOnRightShiftClickRelease := false
global isRightShiftDoubledAsClickPressed := false
global rightShiftActiveBeforeShiftClickPress
global doubledRightShiftMouseHook



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
    
    SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%

    if (isRightCtrlDoubledAsClickPressed || isRightWinDoubledAsClickPressed || isRightAltDoubledAsClickPressed) {
        setShiftState(1)
        setTimer TimerMonitorShiftModifierLift, 20
        return
    }

    if (shiftActive || isLeftAltDoubledAsClickPressed || isLeftCtrlDoubledAsClickPressed || isLeftWinDoubledAsClickPressed)
    {
        rightShiftActiveBeforeShiftClickPress := true
        resetSendClickOnLeftModifierRelease(1)
        if (doubledAction != "lbutton" && doubledAction != "rbutton")
        {
            sendDoubledValueAndReset("rightShiftClick", sendClickOnRightShiftClickRelease)
        }
        else
        {
            sendClickOnRightShiftClickRelease := true
        }
        chooseClickDragActivation("rightShiftClick", "mouseDragRightShiftActivate", doubledRightShiftMouseHook)
        return
    }
    
    shiftActive := 1

    if (!layoutKeyPressed && activePressedKeys.Length() = 0)
    {        
        sendClickOnRightShiftClickRelease := true
        chooseClickDragActivation("rightShiftClick", "mouseDragRightShiftActivate", doubledRightShiftMouseHook)
    }
}

mouseDragRightShiftActivate(nCode, wParam, lParam)
{
    cancelMouseHook(doubledRightShiftMouseHook)
    if (wParam = 0x200)
    {
        sendClickOnRightShiftClickRelease := false
        sendUnClickOnRightShiftClickRelease := true
        doubledAction := modifierDoubledAsClick["rightShiftClick"]
        send {blind}{%doubledAction% down}
    }
}

doubledRightShiftUp()
{
    cancelMouseHook(doubledRightShiftMouseHook)
    isRightShiftDoubledAsClickPressed := false

    if (rightShiftActiveBeforeShiftClickPress)
    {
        rightShiftActiveBeforeShiftClickPress := false
    }
    else
    {
        shiftActive := 0
    }

    resetDoubledModifierClickDrag("rightShiftClick", sendUnClickOnRightShiftClickRelease)

    if (sendClickOnRightShiftClickRelease)
    {
        sendDoubledValueAndReset("rightShiftClick", sendClickOnRightShiftClickRelease)
    }
}