global appNameWhereTimedCapsActive
global timedCapsActive := 0
global TIME_TIMEOUT_TIMED_CAPS_LOCK := 1000

timedCapsLock()
{
    if (GetKeyState("CapsLock", "T"))
    {
        SetTimer, TimerDisableCapsLock, OFF
        SetCapsLockState, OFF
        tooltip

        return
    }

    CoordMode, ToolTip, Screen
    tooltip CAPS LOCK ACTIVE, 0, 0
    SetCapsLockState, On
    appNameWhereTimedCapsActive := lastActiveAppName
    timedCapsActive := 1
    otherKeyPressedWhileWobblyKeyDown := 0
    SetTimer, TimerDisableCapsLock, %TIME_TIMEOUT_TIMED_CAPS_LOCK%
}

TimerDisableCapsLock()
{
    SetTimer, TimerDisableCapsLock, OFF
    SetCapsLockState, OFF
    tooltip 
    timedCapsActive := 0
}
