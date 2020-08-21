global sendClickOnAltClickRelease := false
global sendUnClickOnAltClickRelease := false
global isAltDoubledAsClickPressed := false
global AltActiveBeforeAltClickPress := false
global doubledAltMouseHook



processAltDoubledAsClick(state)
{
    if (state)
    {
        doubledAltDown()
    }
    else
    {
        doubledAltUp()
    }
}

doubledAltDown()
{
    if (isAltDoubledAsClickPressed)
    {
        return
    }
    
    isAltDoubledAsClickPressed := true
    
    SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%

    if (isShiftDoubledAsClickPressed || isWinDoubledAsClickPressed || isCtrlDoubledAsClickPressed) {
        setAltState(1)
        setTimer TimerMonitorAltModifierLift, 20
        return
    }

    if (altActive)
    {
        altActiveBeforeAltClickPress := true
        sendDoubledValueAndReset("altClick", sendClickOnAltClickRelease)
        chooseClickDragActivation("altClick", "MouseDragAltActivate", doubledAltMouseHook)
        return
    }
    
    altActive := 1

    if (!layoutKeyPressed && activePressedKeys.Length() = 0)
    {        
        sendClickOnAltClickRelease := true
        chooseClickDragActivation("altClick", "MouseDragAltActivate", doubledAltMouseHook)
    }
}

MouseDragAltActivate(nCode, wParam, lParam)
{
    cancelMouseHook(doubledAltMouseHook)
    if (wParam = 0x200)
    {
        sendClickOnAltClickRelease := false
        sendUnClickOnAltClickRelease := true
        doubledAction := modifierDoubledAsClick["altClick"]
        send {blind}{%doubledAction% down}
    }
}

doubledAltUp()
{
    cancelMouseHook(doubledAltMouseHook)
    isAltDoubledAsClickPressed := false

    if (altActiveBeforeAltClickPress)
    {
        altActiveBeforeAltClickPress := false
    }
    else
    {
        altActive := 0
    }
    
    resetDoubledModifierClickDrag("altClick", sendUnClickOnAltClickRelease)
 
    if (sendClickOnAltClickRelease)
    {
        sendDoubledValueAndReset("altClick", sendClickOnAltClickRelease)
    }
}

activateAltWithKey(key)
{
    if (!GetKeyState("alt"))
    {
        send {alt down}
        setTimer TimerMonitorAltModifierLift, 20
    }
    send {blind}%key%
}

timerMonitorAltModifierLift()
{
    if (!altActive)
    {
        send {alt up}
        setTimer TimerMonitorAltModifierLift, off
    }
}