#include  %A_ScriptDir%\startup\load\timing.ahk
#include  %A_ScriptDir%\startup\load\logging.ahk
#include  %A_ScriptDir%\startup\load\mouse.ahk
#include  %A_ScriptDir%\startup\load\alternativeLayout.ahk
#include  %A_ScriptDir%\startup\load\doubledModifier.ahk
#include  %A_ScriptDir%\startup\load\keyboardShortcuts.ahk
#include  %A_ScriptDir%\startup\load\layout.ahk
#include  %A_ScriptDir%\startup\load\stickyFailBack.ahk
#include  %A_ScriptDir%\startup\load\accentedCharacters.ahk
#include  %A_ScriptDir%\sticky\lessKeysManagementBasedOnActiveApp.ahk


global timerTimeoutStickyKeys := 1200



resetStates()
readSettingsFile(PATH_APP_CONFIGURATION)
SetTimer, TimerLessKeysManagementBasedOnActiveApp, 500
OnExit("resetStates")

readSettingsFile(basePath)
{
    settings := basePath . "my-settings.cfg"
    
    readTimingSettings(settings)
    readDisabledAppsSettings(settings)
    readRestartAppsSettings(settings)
    readMouseSettings(settings)
    readLoggingSettings(settings)
    readDoubledModifierSettings(settings)
    readLayoutFile(basePath . "my-layout.cfg")
    readAlternativeLayoutFile(basePath . "my-alternative-layout.cfg")
    readKeyboardShortcutsFile(basePath . "my-keyboard-shortcuts.cfg")
}
