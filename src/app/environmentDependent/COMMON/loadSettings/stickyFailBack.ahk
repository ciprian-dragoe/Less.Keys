global appNamesOverwriteKeyboardHooks := []
global appNamesDisableLessKeys := []


readDisabledAppsSettings(path)
{
    delimiter := "~~~"
    IniRead, appNames, %path%, disable, appNamesDisable
    apps := StrSplit(appNames, delimiter)
    for index, app in apps
    {
        appNamesDisableLessKeys.push(app)
    }
}

readRestartAppsSettings(path)
{
    delimiter := "~~~"
    IniRead, appNames, %path%, disable, appNamesRestart
    apps := StrSplit(appNames, delimiter)
    for index, app in apps
    {
        appNamesOverwriteKeyboardHooks.push(app)
    }
}
