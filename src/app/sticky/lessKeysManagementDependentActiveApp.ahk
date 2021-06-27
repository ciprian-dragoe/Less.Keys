global isAppWhichOverWritesLessKeysActive := false
global isLessKeysEnabled := true
global lastActiveAppName := ""

timerLessKeysManagementDependentActiveApp()
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
        if (isLessKeysEnabled)
        {
            isLessKeysEnabled := false
            temp := logStickyKeys
            logStickyKeys := 0
            resetStates()
            debug("======" . lastActiveAppName . " disables LessKeys")
            logStickyKeys := temp
            SetTimer TimerStickyFailBack, OFF
        }
    }
    else
    {
        if (!isLessKeysEnabled)
        {
            debug("====== LessKeys Ative Again")
            temp := logStickyKeys
            logStickyKeys := 0
            resetStates()
            logStickyKeys := temp
            isLessKeysEnabled := 1
            SetTimer ReEnableStickyKeysMonitor, OFF
            SetTimer ReEnableStickyKeysMonitor, 5000
        }
    }
}

reEnableStickyKeysMonitor()
{
    if (isLessKeysEnabled)
    {
        SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
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
            SetTimer TimerStickyFailBack, OFF
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