#include %A_ScriptDir%\..\environmentDependent\COMMON\appMessages.ahk
#include %A_ScriptDir%\..\environmentDependent\COMMON\debug.ahk
#include %A_ScriptDir%\..\environmentDependent\COMMON\random.ahk
#include %A_ScriptDir%\..\environmentDependent\COMMON\logging.ahk
#include %A_ScriptDir%\services\debug.ahk


setMonitoredStickyKeys()
{
    result := []
    FileReadLine, layoutChangeKey, %PATH_APP_CONFIGURATION%my-alternative-layout.cfg, 1
    layoutChangeKey := StrSplit(layoutChangeKey, "`:").2
    result.Push(GetKeyName(Format("sc{:x}", GetKeySC(layoutChangeKey))))

    Loop, read, %PATH_APP_CONFIGURATION%my-layout.cfg
    {
        originalKey := StrSplit(A_LoopReadLine, "`:").1
        ahkKeyName := GetKeyName(Format("sc{:x}", GetKeySC(originalKey)))
        key := StrSplit(A_LoopReadLine, "`:").2
        if (isModifierKey(key) && !InStr(A_LoopReadLine, "###"))
        {
            result.Push(ahkKeyName)
        }
    }

    return result
}


readLoggingSettings(PATH_APP_CONFIGURATION . "my-settings.cfg")
global MONITORED_STICKY_KEYS := setMonitoredStickyKeys()
