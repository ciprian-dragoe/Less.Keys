global isAppWhichOverWritesLessKeysActive := false
global lastActiveAppName := ""
global appNamesOverwriteKeyboardHooks := ["Remote Desktop Connection"]

timerFixAppsOverwriteLessKeysKeyboardHooks()
{
    WinGetTitle, lastActiveAppName, A
    for index, appName in appNamesOverwriteKeyboardHooks
    {
        IfInString, activeProgramWindowName, %appName%
        {
            if (isAppWhichOverWritesLessKeysActive)
            {
                return
            }
            isAppWhichOverWritesLessKeysActive := true
            Suspend, On
            Suspend, Off
        }
    }
    isAppWhichOverWritesLessKeysActive := false
}