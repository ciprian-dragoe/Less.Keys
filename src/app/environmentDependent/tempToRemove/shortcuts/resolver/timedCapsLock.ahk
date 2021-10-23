global appNameWhereTimedCapsActive
global isTimedCapsActive := false



timedCapsLock()
{
    if (GetKeyState("CapsLock", "T"))
    {
        SetTimer, TimerCheckKeyPress, OFF
        SetTimer, TimerDisableCapsLock, OFF
        SetCapsLockState, OFF
        isTimedCapsActive := 0
        tooltip

        return
    }

    CoordMode, ToolTip, Screen
    tooltip CAPS LOCK ACTIVE, 0, 0
    SetCapsLockState, On
    isTimedCapsActive := 1
    appNameWhereTimedCapsActive := lastActiveAppName
    SetTimer, TimerCheckKeyPress, 50
    SetTimer, TimerDisableCapsLock, 2000
}

timerCheckKeyPress()
{
    if (appNameWhereTimedCapsActive != lastActiveAppName)
    {
        TimerDisableCapsLock()
        return
    }

    if (layoutKeyPressed || activePressedKeys.Length() > 0)
    {
        SetTimer, TimerDisableCapsLock, OFF
        SetTimer, TimerDisableCapsLock, 2000
    }
}

TimerDisableCapsLock()
{
    SetTimer, TimerCheckKeyPress, OFF
    SetTimer, TimerDisableCapsLock, OFF
    SetCapsLockState, OFF
    isTimedCapsActive := 0
    tooltip
}
