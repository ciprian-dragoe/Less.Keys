global appNamesOverwriteKeyboardHooks := []



readDisabledAppsSettings(path)
{
    delimiter := "~~~"
    IniRead, appNames, %path%, disable, appNamesDisable
    apps := StrSplit(appNames, delimiter)
    for index, app in apps
    {
        GroupAdd, IgnoredApps, %app%
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
