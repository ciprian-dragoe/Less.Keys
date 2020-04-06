global recentMouseMovementXaxis := 0
global recentMouseMovementYaxis := 0
global timeoutSpaceAsClick
global spaceAsClick := false
global timerDelaySpaceAsClick := 0

applySpaceAsClickSettings(path)
{
    IniRead, timeoutSpaceAsClick, %path%, mouse, timeoutSpaceAsClick
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
        if (!layoutKeyPressed)
        {
            SetTimer, TimerTimeoutSpaceAsMouseClick, off
            SetTimer, TimerTimeoutSpaceAsMouseClick, %timeoutSpaceAsClick%
        }
    }
}

timerTimeoutSpaceAsMouseClick()
{
    spaceAsClick := false
    showtooltip(spaceAsClick . " timerTimeoutSpaceAsMouseClick")
    SetTimer, TimerTimeoutSpaceAsMouseClick, off
}
