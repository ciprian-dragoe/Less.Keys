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
    if (logInput)
    {
        debugStoredData .= "========" . lastActiveAppName . "`n"
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
            SetTimer TimerStickyFailBack, off
            temp := logStickyKeys
            logStickyKeys := 0
            PostMessage, %APP_MESSAGE_RESET_STATES%, 0, 0, , %TARGET_HANDLER_SCRIPT%
            debug("======" . lastActiveAppName . " disables LessKeys")
            logStickyKeys := temp
        }
    }
    else
    {
        if (!IS_LESS_KEYS_ENABLED)
        {
            debug("====== LessKeys Active Again")
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
            debug("====== reset from app which overwrites keyboard hooks")
            SetTimer TimerStickyFailBack, Delete
            Suspend, On
            Suspend, Off
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
