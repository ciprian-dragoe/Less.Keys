rightClick()
{
    sendRightMouseButton := true
    CoordMode, Mouse, Screen
    MouseGetPos, initialMousePositionXAxis, initialMousePositionYAxis
    SetTimer, TimerScrollWithMouseMovement, %timeoutMouseScrollPoll%, -2147483648
    keywait, %keyRemappedAsRightButton%
    SetTimer, TimerScrollWithMouseMovement, OFF
    systemCursor(1)
    if (sendRightMouseButton)
    {
        send {blind}{rbutton}
    }
}
