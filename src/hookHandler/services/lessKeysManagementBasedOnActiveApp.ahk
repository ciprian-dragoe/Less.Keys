global isAppWhichOverWritesLessKeysActive := false
global isLessKeysEnabled := true
global lastActiveAppName := ""
global IS_LESS_KEYS_ENABLED := 1


timerLessKeysManagementBasedOnActiveApp()
{
    WinGetTitle, lastActiveAppName, A
    
    processRestartLessKeys()
    processDisableEnableLessKeys()
    processCustomAppNameRules()
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
            PostMessage, %APP_MESSAGE_SET_LESSKEYS_STATE%, 0, 0, , %SCRIPT_HOOKS_READER%
            SetTimer TimerStickyFailBack, off
            resetModifiers()
        }
    }
    else
    {
        if (!IS_LESS_KEYS_ENABLED)
        {
            resetModifiers()
            IS_LESS_KEYS_ENABLED := 1
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
    shiftState := 0
    send {ctrl up}
    ctrlState := 0
    send {alt up}
    altState := 0
    send {lwin up}
    lwinState := 0
    systemCursor(1)
    layoutKeyPressed := 0
}