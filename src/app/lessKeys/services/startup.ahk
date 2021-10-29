#include %A_ScriptDir%\services\debug.ahk
#include %A_ScriptDir%\..\environmentDependent\COMMON\appMessages.ahk
#include %A_ScriptDir%\..\environmentDependent\COMMON\debug.ahk
#include %A_ScriptDir%\..\environmentDependent\COMMON\random.ahk


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
