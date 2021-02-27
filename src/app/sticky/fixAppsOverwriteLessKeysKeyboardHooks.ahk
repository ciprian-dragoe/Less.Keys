global isAppWhichOverWritesLessKeysActive := false
global lastActiveAppName := ""

timerFixAppsOverwriteLessKeysKeyboardHooks()
{
    WinGetTitle, lastActiveAppName, A
    for index, appName in appNamesOverwriteKeyboardHooks
    {
        IfInString, lastActiveAppName, %appName%
        {
            if (isAppWhichOverWritesLessKeysActive)
            {
                return
            }
            isAppWhichOverWritesLessKeysActive := true
            debug("====== reset from app which overwrites keyboard hooks")
            SetTimer TimerStickyFailBack, OFF
            Suspend, On
            Suspend, Off
            SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
            return
        }
    }
    isAppWhichOverWritesLessKeysActive := false
}