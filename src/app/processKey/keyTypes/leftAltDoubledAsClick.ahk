global sendClickOnLeftAltClickRelease := false
global isLeftAltDoubledAsClickPressed := false
global leftAltActiveBeforeAltClickPress := false
global doubledLeftAltMouseHook := 0
global isLeftAltClickDown := false



processLeftAltDoubledAsClick(state)
{
    if (state)
    {
        doubledLeftAltDown()
    }
    else
    {
        doubledLeftAltUp()
    }
}

doubledLeftAltDown()
{
    if (isLeftAltDoubledAsClickPressed)
    {
        return
    }

    isLeftAltDoubledAsClickPressed := true

    if (isLeftShiftDoubledAsClickPressed || isLeftWinDoubledAsClickPressed || isLeftCtrlDoubledAsClickPressed) {
        resetSendClickOnLeftModifierRelease(1)
        setAltState(1)
        setTimer TimerMonitorAltModifierLift, 20
        return
    }

    if (altActive || isRightCtrlDoubledAsClickPressed || isRightShiftDoubledAsClickPressed || isRightWinDoubledAsClickPressed)
    {
        leftAltActiveBeforeAltClickPress := true
        resetSendClickOnRightModifierRelease(1)
        sendDoubledValueAndReset("leftAltClick", sendClickOnLeftAltClickRelease, isLeftAltClickDown)
        if (!isLeftAltClickDown)
        {
            chooseClickDragActivation("leftAltClick", "mouseDragAltActivate", doubledLeftAltMouseHook)
        }
        return
    }

    altActive := 1

    if (!layoutKeyPressed && activePressedKeys.Length() = 0)
    {
        sendClickOnLeftAltClickRelease := true
        chooseClickDragActivation("leftAltClick", "mouseDragLeftAltActivate", doubledLeftAltMouseHook)
        setTimer TimerResetModifierReleaseAction, %timeoutStillSendLayoutKey%
    }
}

mouseDragLeftAltActivate(nCode, wParam, lParam)
{
    cancelMouseHook(doubledLeftAltMouseHook)
    if (wParam = 0x200)
    {
        sendClickOnLeftAltClickRelease := false
        isLeftAltClickDown := true
        doubledAction := modifierDoubledAsClick["leftAltClick"]
        send {blind}{%doubledAction% down}
    }
}

doubledLeftAltUp()
{
    cancelMouseHook(doubledLeftAltMouseHook)
    isLeftAltDoubledAsClickPressed := false

    if (leftAltActiveBeforeAltClickPress)
    {
        leftAltActiveBeforeAltClickPress := false
    }
    else
    {
        altActive := 0
    }

    resetDoubledModifierClickDrag("leftAltClick", isLeftAltClickDown)

    if (sendClickOnLeftAltClickRelease)
    {
        sendDoubledValueAndReset("leftAltClick", sendClickOnLeftAltClickRelease, isLeftAltClickDown)
    }
}