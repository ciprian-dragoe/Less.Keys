global sendClickOnLeftShiftClickRelease := false
global sendUnClickOnLeftShiftClickRelease := false
global isLeftShiftDoubledAsClickPressed := false
global leftShiftActiveBeforeShiftClickPress
global doubledLeftShiftMouseHook



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
    
    SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%

    if (isLeftCtrlDoubledAsClickPressed || isWinDoubledAsClickPressed || isAltDoubledAsClickPressed) {
        setShiftState(1)
        setTimer TimerMonitorShiftModifierLift, 20
        return
    }

    if (shiftActive || isRightAltDoubledAsClickPressed || isRightCtrlDoubledAsClickPressed || isRightWinDoubledAsClickPressed)
    {
        leftShiftActiveBeforeShiftClickPress := true
        resetSendClickOnRightModifierRelease(1)
        if (doubledAction != "lbutton" && doubledAction != "rbutton")
        {
            sendDoubledValueAndReset("leftShiftClick", sendClickOnLeftShiftClickRelease)
        }
        else
        {
            sendClickOnLeftShiftClickRelease := true
        }
        chooseClickDragActivation("leftShiftClick", "mouseDragLeftShiftActivate", doubledLeftShiftMouseHook)
        return
    }
    
    shiftActive := 1

    if (!layoutKeyPressed && activePressedKeys.Length() = 0)
    {        
        sendClickOnLeftShiftClickRelease := true
        chooseClickDragActivation("leftShiftClick", "mouseDragLeftShiftActivate", doubledLeftShiftMouseHook)
    }
}

mouseDragLeftShiftActivate(nCode, wParam, lParam)
{
    cancelMouseHook(doubledLeftShiftMouseHook)
    if (wParam = 0x200)
    {
        sendClickOnLeftShiftClickRelease := false
        sendUnClickOnLeftShiftClickRelease := true
        doubledAction := modifierDoubledAsClick["leftShiftClick"]
        send {blind}{%doubledAction% down}
    }
}

doubledLeftShiftUp()
{
    cancelMouseHook(doubledLeftShiftMouseHook)
    isLeftShiftDoubledAsClickPressed := false

    if (leftShiftActiveBeforeShiftClickPress)
    {
        leftShiftActiveBeforeShiftClickPress := false
    }
    else
    {
        shiftActive := 0
    }

    resetDoubledModifierClickDrag("leftShiftClick", sendUnClickOnLeftShiftClickRelease)

    if (sendClickOnLeftShiftClickRelease)
    {
        sendDoubledValueAndReset("leftShiftClick", sendClickOnLeftShiftClickRelease)
    }
}