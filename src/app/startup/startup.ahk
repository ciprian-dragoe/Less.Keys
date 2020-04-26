#include  %A_ScriptDir%\app\startup\load\alternativeLayout.ahk
#include  %A_ScriptDir%\app\startup\load\keyboardShortcuts.ahk
#include  %A_ScriptDir%\app\startup\load\layout.ahk
#include  %A_ScriptDir%\app\startup\load\stickyFailBack.ahk



resetStates()
readSettingsFile(PATH_APP_CONFIGURATION)

readSettingsFile(basePath)
{
    settings := basePath . "my-settings.cfg"
    readLayoutFile(basePath . "my-layout.cfg")
    readAlternativeLayoutFile(basePath . "my-alternative-layout.cfg")
    readKeyboardShortcutsFile(basePath . "my-keyboard-shortcuts.cfg")
    readDisabledAppsSettings(settings)
    
    IniRead, timeoutStillSendLayoutKey, %settings%, timings, timeoutStillSendLayoutKey
    IniRead, timeoutProcessLayoutOnRelease, %settings%, timings, timeoutProcessLayoutOnRelease
    IniRead, timeoutMouseScrollPoll, %settings%, mouse, scrollPoll
    IniRead, mouseScrollAcceleration, %settings%, mouse, scrollAcceleration
    IniRead, logInput, %settings%, logging, logInput
}
