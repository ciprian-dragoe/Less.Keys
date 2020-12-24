global disabledApps

readDisabledAppsSettings(path)
{
    delimiter := "~~~"
    IniRead, appNames, %path%, disable, appNames
    disabledApps := StrSplit(appNames, delimiter)
    for index, app in disabledApps
    {
        GroupAdd, IgnoredApps, %app%
    }
}
