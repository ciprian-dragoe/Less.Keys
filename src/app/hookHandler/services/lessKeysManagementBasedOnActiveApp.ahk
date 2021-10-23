global isAppWhichOverWritesLessKeysActive := false
global isLessKeysEnabled := true
global lastActiveAppName := ""
global IS_LESS_KEYS_ENABLED := 1


timerLessKeysManagementBasedOnActiveApp()
{
    WinGetTitle, lastActiveAppName, A
    if (!lastActiveAppName)
    {
        return
    }

    processRestartLessKeys()
    processDisableEnableLessKeys()
}

isAppInMonitoredList(app, monitoredAppList)
{
    for index, appName in monitoredAppList
    {
        If (InStr(app, appName))
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
            PostMessage, %APP_MESSAGE_SET_LESSKEYS_STATE%, 0, 0, , %TARGET_HANDLER_SCRIPT%
            SetTimer TimerStickyFailBack, off
            temp := logStickyKeys
            logStickyKeys := 0
            resetStates()
            logStickyKeys := temp
        }
    }
    else
    {
        if (!IS_LESS_KEYS_ENABLED)
        {
            temp := logStickyKeys
            logStickyKeys := 0
            resetStates()
            logStickyKeys := temp
            IS_LESS_KEYS_ENABLED := 1
            PostMessage, %APP_MESSAGE_SET_LESSKEYS_STATE%, 1, 0, , %TARGET_HANDLER_SCRIPT%
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
            PostMessage, %APP_MESSAGE_RESET_HOOK_MONITORING%, 0, 0, , %TARGET_HANDLER_SCRIPT%
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
