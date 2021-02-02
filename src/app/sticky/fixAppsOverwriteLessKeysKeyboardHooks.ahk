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
            Suspend, On
            Suspend, Off
            return
        }
    }
    isAppWhichOverWritesLessKeysActive := false
}