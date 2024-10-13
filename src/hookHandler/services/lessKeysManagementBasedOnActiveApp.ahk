global isAppWhichOverWritesLessKeysActive := false
global isLessKeysEnabled := true
global lastActiveAppName := ""
global IS_LESS_KEYS_ENABLED := 1
global SHOULD_RESET_STICKY_WHEN_NON_ADMIN := 0


timerLessKeysManagementBasedOnActiveApp()
{
    WinGetTitle, lastActiveAppName, A
    
    processRestartLessKeys()
    processDisableEnableLessKeys()
    processCustomAppNameRules()
    if (!A_IsAdmin)
    {
        processStickyFallbackWhenNotAdmin()
    }
}

processStickyFallbackWhenNotAdmin()
{
    WinGet, active_pid, PID, A
    hProcess := DllCall("OpenProcess", "UInt", 0x0400, "Int", false, "UInt", active_pid, "Ptr")
    
    if (!hProcess)
    {
        SHOULD_RESET_STICKY_WHEN_NON_ADMIN := 1
        ;showtooltip("admin process")
        return
    }
    
    DllCall("Advapi32.dll\OpenProcessToken", "Ptr", hProcess, "UInt", 0x0008, "PtrP", hToken)
    DllCall("Advapi32.dll\GetTokenInformation", "Ptr", hToken, "UInt", 2, "UIntP", isAdmin, "UInt", 4, "UIntP", returnLength)
    DllCall("kernel32.dll\CloseHandle", "Ptr", hProcess)
    if (isAdmin)
    {
        SHOULD_RESET_STICKY_WHEN_NON_ADMIN := 1
        ;showtooltip("admin process")
    }
    else
    {
        if (SHOULD_RESET_STICKY_WHEN_NON_ADMIN)
        {
            ;showtooltip("sticky reset because non admin process is active again")
            resetStates()
        }
        SHOULD_RESET_STICKY_WHEN_NON_ADMIN := 0
    }
}

isAppInMonitoredList(app, monitoredAppList)
{
    for index, appName in monitoredAppList
    {
        If (InStr(app, appName), true)
        {
            return 1
        }
    }
    return 0
}

processDisableEnableLessKeys()
{
    if (isAppInMonitoredList(lastActiveAppName, appNamesDisableLessKeys))
    {
        if (IS_LESS_KEYS_ENABLED)
        {
            IS_LESS_KEYS_ENABLED := false
            DetectHiddenWindows On
            PostMessage, %APP_MESSAGE_SET_LESSKEYS_STATE%, 0, 0, , %SCRIPT_HOOKS_READER%
            SetTimer TimerStickyFailBack, off
            SetTimer timerCheckAgainIfTimerTriggeredBeforeKeyLift, off
            resetModifiers()
        }
    }
    else
    {
        if (!IS_LESS_KEYS_ENABLED)
        {
            resetModifiers()
            IS_LESS_KEYS_ENABLED := 1
            DetectHiddenWindows On
            PostMessage, %APP_MESSAGE_SET_LESSKEYS_STATE%, 1, 0, , %SCRIPT_HOOKS_READER%
        }
    }
}

processRestartLessKeys()
{
    if (isAppInMonitoredList(lastActiveAppName, appNamesOverwriteKeyboardHooks))
    {
        if (!isAppWhichOverWritesLessKeysActive)
        {
            isAppWhichOverWritesLessKeysActive := 1
            SetTimer TimerStickyFailBack, off
            DetectHiddenWindows On
            PostMessage, %APP_MESSAGE_RESET_HOOK_MONITORING%, 0, 0, , %SCRIPT_LESSKEYS%
            SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
        }
    }
    else
    {
        if (isAppWhichOverWritesLessKeysActive)
        {
            isAppWhichOverWritesLessKeysActive := false
        }
    }
}

resetModifiers()
{
    send {shift up}
    shiftActive := 0
    send {ctrl up}
    ctrlActive := 0
    send {alt up}
    altActive := 0
    send {lwin up}
    winActive := 0
    systemCursor(1)
    layoutKeyPressed := 0
}