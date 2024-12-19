getAppName(appPath)
{
    parts := StrSplit(appPath, "\")
    fileName := parts[parts.maxIndex()]
    parts := StrSplit(fileName, ".")
    extension := parts[parts.maxIndex()]
    if (extension = ahk)
    {
        return fileName . " ahk_class AutoHotkey"
    }
    return fileName
}
global SCRIPT_HOOKS_READER := getAppName(HOOKS_READER)
global SCRIPT_HOOKS_HANDLER := getAppName(HOOKS_HANDLER)
