#include  %A_ScriptDir%\app\startup\load\timing.ahk
#include  %A_ScriptDir%\app\startup\load\logging.ahk
#include  %A_ScriptDir%\app\startup\load\mouse.ahk
#include  %A_ScriptDir%\app\startup\load\alternativeLayout.ahk
#include  %A_ScriptDir%\app\startup\load\alternativeLayout.ahk
#include  %A_ScriptDir%\app\startup\load\keyboardShortcuts.ahk
#include  %A_ScriptDir%\app\startup\load\layout.ahk
#include  %A_ScriptDir%\app\startup\load\stickyFailBack.ahk



resetStates()
readSettingsFile(PATH_APP_CONFIGURATION)

readSettingsFile(basePath)
{
    settings := basePath . "my-settings.cfg"
    
    readTimingSettings(settings)
    readDisabledAppsSettings(settings)
    readMouseSettings(settings)
    readLoggingSettings(settings)
    readLayoutFile(basePath . "my-layout.cfg")
    readAlternativeLayoutFile(basePath . "my-alternative-layout.cfg")
    readKeyboardShortcutsFile(basePath . "my-keyboard-shortcuts.cfg")
}
