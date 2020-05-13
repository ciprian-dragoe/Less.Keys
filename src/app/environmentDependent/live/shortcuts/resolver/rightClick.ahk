rightClick()
{
    sendRightMouseButton := true
    CoordMode, Mouse, Screen
    MouseGetPos, initialMousePositionXAxis, initialMousePositionYAxis
    SetTimer, TimerScrollWithMouseMovement, %timeoutMouseScrollPoll%
    keywait, %keyRemappedAsRightButton%
    SetTimer, TimerScrollWithMouseMovement, OFF
    systemCursor(1)
    if (sendRightMouseButton)
    {
        send {blind}{rbutton}
    }
}
