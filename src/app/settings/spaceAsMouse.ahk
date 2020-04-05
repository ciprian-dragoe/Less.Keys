global recentMouseMovementXaxis:= 0
global recentMouseMovementYaxis:= 0
global spaceIsLeftClick:= false
global spaceActsAsLeftClick


applySpaceAsClickSettings()
{
    IniRead, spaceActsAsLeftClick, %path%, mouse, spaceActsAsLeftClick
    if (spaceActsAsLeftClick) {
        SetTimer, CheckRecentMouseMovemet, 100
    }
}


checkRecentMouseMovement() {
    lastX := recentMouseMovementXaxis
    lastY := recentMouseMovementYaxis
    MouseGetPos, recentMouseMovementXaxis, recentMouseMovementYaxis
    if (recentMouseMovementXaxis != lastX || recentMouseMovementXaxis != lastX) {
        spaceIsLeftClick := true
    }
}

