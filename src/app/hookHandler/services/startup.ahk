#include  %A_ScriptDir%\..\environmentDependent\COMMON\random.ahk
#include  %A_ScriptDir%\..\environmentDependent\COMMON\appMessages.ahk
#include  %A_ScriptDir%\..\environmentDependent\COMMON\debug.ahk
#include  %A_ScriptDir%\..\environmentDependent\COMMON\logging.ahk
#include  %A_ScriptDir%\services\loadSettings\timing.ahk
#include  %A_ScriptDir%\services\loadSettings\mouse.ahk
#include  %A_ScriptDir%\services\loadSettings\alternativeLayout.ahk
#include  %A_ScriptDir%\services\loadSettings\doubledModifier.ahk
#include  %A_ScriptDir%\services\loadSettings\keyboardShortcuts.ahk
#include  %A_ScriptDir%\services\loadSettings\layout.ahk
#include  %A_ScriptDir%\services\loadSettings\stickyFailBack.ahk
#include  %A_ScriptDir%\services\loadSettings\accentedCharacters.ahk
#include  %A_ScriptDir%\services\loadSettings\stickyFailBack.ahk
#include  %A_ScriptDir%\services\lessKeysManagementBasedOnActiveApp.ahk
#include  %A_ScriptDir%\services\debug.ahk
#include  %A_ScriptDir%\services\sticky.ahk


global timerTimeoutStickyKeys := 1600


readSettingsFile(basePath)
{
    settings := basePath . "my-settings.cfg"

    readTimingSettings(settings)
    readMouseSettings(settings)
    readLoggingSettings(settings)
    readDoubledModifierSettings(settings)
    readLayoutFile(basePath . "my-layout.cfg")
    readAlternativeLayoutFile(basePath . "my-alternative-layout.cfg")
    readKeyboardShortcutsFile(basePath . "my-keyboard-shortcuts.cfg")
    readDisabledAppsSettings(settings)
    readRestartAppsSettings(settings)
}


resetStates()
readSettingsFile(PATH_APP_CONFIGURATION)
SetTimer, TimerLessKeysManagementBasedOnActiveApp, 500
OnExit("resetStates")
