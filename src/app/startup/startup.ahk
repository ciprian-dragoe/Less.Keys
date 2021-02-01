#include  %A_ScriptDir%\app\startup\load\timing.ahk
#include  %A_ScriptDir%\app\startup\load\logging.ahk
#include  %A_ScriptDir%\app\startup\load\mouse.ahk
#include  %A_ScriptDir%\app\startup\load\alternativeLayout.ahk
#include  %A_ScriptDir%\app\startup\load\doubledModifier.ahk
#include  %A_ScriptDir%\app\startup\load\keyboardShortcuts.ahk
#include  %A_ScriptDir%\app\startup\load\layout.ahk
#include  %A_ScriptDir%\app\startup\load\stickyFailBack.ahk
#include  %A_ScriptDir%\app\startup\load\accentedCharacters.ahk
#include  %A_ScriptDir%\app\sticky\fixAppsOverwriteLessKeysKeyboardHooks.ahk


global timerTimeoutStickyKeys := 2000



resetStates()
readSettingsFile(PATH_APP_CONFIGURATION)
SetTimer, TimerFixAppsOverwriteLessKeysKeyboardHooks, 500, -2147483648
SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%, -2147483648
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
