global isAppWhichOverWritesLessKeysActive := false
global isLessKeysEnabled := true
global lastActiveAppName := ""


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
        IfInString, app, %appName%
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
            PostMessage, %APP_MESSAGE_TOGGLE_STICKY_KEYS_MONITORING%, 0, 0, , %TARGET_HANDLER_SCRIPT%
            temp := logStickyKeys
            logStickyKeys := 0
            PostMessage, %APP_MESSAGE_RESET_STATES%, 0, 0, , %TARGET_HANDLER_SCRIPT%
            logStickyKeys := temp
        }
    }
    else
    {
        if (!IS_LESS_KEYS_ENABLED)
        {
            temp := logStickyKeys
            logStickyKeys := 0
            PostMessage, %APP_MESSAGE_RESET_STATES%, 0, 0, , %TARGET_HANDLER_SCRIPT%
            logStickyKeys := temp
            IS_LESS_KEYS_ENABLED := 1
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
            PostMessage, %APP_MESSAGE_TOGGLE_STICKY_KEYS_MONITORING%, 0, 0, , %TARGET_HANDLER_SCRIPT%
            Suspend, On
            Suspend, Off
            PostMessage, %APP_MESSAGE_TOGGLE_STICKY_KEYS_MONITORING%, 1, 0, , %TARGET_HANDLER_SCRIPT%
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
