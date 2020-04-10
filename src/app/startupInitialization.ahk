#include  %A_ScriptDir%\app\settings\alternativeLayout.ahk
#include  %A_ScriptDir%\app\settings\keyboardShortcuts.ahk
#include  %A_ScriptDir%\app\settings\layout.ahk
#include  %A_ScriptDir%\app\settings\stickyFailBack.ahk



resetStates()
readSettingsFile("my-settings.cfg")

readSettingsFile(path)
{
    readLayoutFile("my-layout.cfg")
    readAlternativeLayoutFile("my-alternative-layout.cfg")
    readKeyboardShortcutsFile("my-keyboard-shortcuts.cfg")
    readDisabledAppsSettings(path)
    
    IniRead, timeoutStillSendLayoutKey, %path%, timings, timeoutStillSendLayoutKey
    IniRead, timeoutProcessLayoutOnRelease, %path%, timings, timeoutProcessLayoutOnRelease
    IniRead, timeoutMouseScrollPoll, %path%, mouse, scrollPoll
    IniRead, mouseScrollAcceleration, %path%, mouse, scrollAcceleration
    IniRead, logInput, %path%, logging, logInput
}
