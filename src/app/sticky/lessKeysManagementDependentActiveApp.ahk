global isAppWhichOverWritesLessKeysActive := false
global isLessKeysEnabled := true
global lastActiveAppName := ""

timerLessKeysManagementDependentActiveApp()
{
    WinGetTitle, lastActiveAppName, A
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
            SetTimer TimerStickyFailBack, OFF
            debug("======" . lastActiveAppName . " disables LessKeys")
        }
    }
    else
    {
        if (!isLessKeysEnabled)
        {
            isLessKeysEnabled := 1
            SetTimer ReEnableStickyKeysMonitor, OFF
            SetTimer ReEnableStickyKeysMonitor, 5000
            debug("====== LessKeys Active Again")
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