global sendClickOnCtrlClickRelease := false
global sendUnClickOnCtrlClickRelease := false
global isCtrlDoubledAsClickPressed := false
global ctrlActiveBeforeCtrlClickPress := false
global doubledCtrlMouseHook



processCtrlDoubledAsClick(state)
{
    if (state)
    {
        doubledCtrlDown()
    }
    else
    {
        doubledCtrlUp()
    }
}

doubledCtrlDown()
{
    if (isCtrlDoubledAsClickPressed)
    {
        return
    }
    
    isCtrlDoubledAsClickPressed := true
    
    SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%

    if (isShiftDoubledAsClickPressed || isWinDoubledAsClickPressed || isAltDoubledAsClickPressed) {
        setCtrlState(1)
        setTimer TimerMonitorCtrlModifierLift, 20
        return
    }

    if (ctrlActive)
    {
        ctrlActiveBeforeCtrlClickPress := true
        sendDoubledValueAndReset("ctrlClick", sendClickOnCtrlClickRelease)
        chooseClickDragActivation("ctrlClick", "MouseDragCtrlActivate")
        return
    }
    
    ctrlActive := 1

    if (!layoutKeyPressed && activePressedKeys.Length() = 0)
    {
        sendClickOnCtrlClickRelease := true
        chooseClickDragActivation("ctrlClick", "MouseDragCtrlActivate")
    }
}

MouseDragCtrlActivate(nCode, wParam, lParam)
{
    cancelMouseHook(doubledCtrlMouseHook)
    if (wParam = 0x200)
    {
        sendClickOnCtrlClickRelease := false
        sendUnClickOnCtrlClickRelease := true
        doubledAction := modifierDoubledAsClick["ctrlClick"]
        send {blind}{%doubledAction% down}
    }
}

doubledCtrlUp()
{
    cancelMouseHook(doubledCtrlMouseHook)
    isCtrlDoubledAsClickPressed := false

    if (ctrlActiveBeforeCtrlClickPress)
    {
        ctrlActiveBeforeCtrlClickPress := false
    }
    else
    {
        ctrlActive := 0
    }
    
    resetDoubledModifierClickDrag("ctrlClick", sendUnClickOnCtrlClickRelease)

    if (sendClickOnCtrlClickRelease)
    {
        sendDoubledValueAndReset("ctrlClick", sendClickOnCtrlClickRelease)
    }
}

activateCtrlWithKey(key)
{
    if (!GetKeyState("ctrl"))
    {
        send {ctrl down}
        setTimer TimerMonitorCtrlModifierLift, 20
    }
    send {blind}%key%
}

timerMonitorCtrlModifierLift()
{
    if (!ctrlActive)
    {
        send {ctrl up}
        setTimer TimerMonitorCtrlModifierLift, off
    }
}