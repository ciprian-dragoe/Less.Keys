#include  %A_ScriptDir%\..\environmentDependent\COMMON\loadSettings\timing.ahk
#include  %A_ScriptDir%\..\environmentDependent\COMMON\loadSettings\logging.ahk
#include  %A_ScriptDir%\..\environmentDependent\COMMON\loadSettings\mouse.ahk
#include  %A_ScriptDir%\..\environmentDependent\COMMON\loadSettings\alternativeLayout.ahk
#include  %A_ScriptDir%\..\environmentDependent\COMMON\loadSettings\doubledModifier.ahk
#include  %A_ScriptDir%\..\environmentDependent\COMMON\loadSettings\keyboardShortcuts.ahk
#include  %A_ScriptDir%\..\environmentDependent\COMMON\loadSettings\layout.ahk
#include  %A_ScriptDir%\..\environmentDependent\COMMON\loadSettings\stickyFailBack.ahk
#include  %A_ScriptDir%\..\environmentDependent\COMMON\loadSettings\accentedCharacters.ahk
#include  %A_ScriptDir%\..\environmentDependent\COMMON\loadSettings\appMessages.ahk
#include  %A_ScriptDir%\..\environmentDependent\COMMON\debug.ahk
#include  %A_ScriptDir%\services\debug.ahk
#include  %A_ScriptDir%\services\sticky\lessKeysManagementBasedOnActiveApp.ahk
#include  %A_ScriptDir%\services\sticky\stickyFailBack.ahk


global timerTimeoutStickyKeys := 1200


readSettingsFile(basePath)
{
    settings := basePath . "my-settings.cfg"

    readDisabledAppsSettings(settings)
    readRestartAppsSettings(settings)
    readLoggingSettings(settings)
    readLayoutFile(basePath . "my-layout.cfg")
    readAlternativeLayoutFile(basePath . "my-alternative-layout.cfg")
}


readSettingsFile(PATH_APP_CONFIGURATION)
SetTimer, TimerLessKeysManagementBasedOnActiveApp, 500
