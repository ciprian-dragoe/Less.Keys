global recentMouseMovementXaxis := 0
global recentMouseMovementYaxis := 0
global timeoutSpaceAsClick
global spaceAsClick := false
global MOUSE_DRAG_ACTIVE := false


applySpaceAsClickSettings(path)
{
    IniRead, timeoutSpaceAsClick, %path%, mouse, timeoutLayoutAsClick
    if (timeoutSpaceAsClick) 
    {
        SetTimer, CheckRecentMouseMovemet, 100
    }
}

checkRecentMouseMovement() {
    lastX := recentMouseMovementXaxis
    lastY := recentMouseMovementYaxis
    MouseGetPos, recentMouseMovementXaxis, recentMouseMovementYaxis
    if (recentMouseMovementXaxis != lastX || recentMouseMovementYaxis != lastY)
    {
        spaceAsClick := true
        systemCursor(1)
    }
}

timerTimeoutSpaceAsMouseClick()
{
    spaceAsClick := false
    MOUSE_DRAG_ACTIVE := false
    SetTimer, TimerTimeoutSpaceAsMouseClick, off
}

timerClickDrag()
{
    if (MOUSE_DRAG_ACTIVE)
    {
        return
    }
    lastX := recentMouseMovementXaxis
    lastY := recentMouseMovementYaxis
    MouseGetPos, recentMouseMovementXaxis, recentMouseMovementYaxis
    if (recentMouseMovementXaxis != lastX || recentMouseMovementYaxis != lastY)
    {
       MOUSE_DRAG_ACTIVE := true
       send {blind}{LButton down}
    }
}
