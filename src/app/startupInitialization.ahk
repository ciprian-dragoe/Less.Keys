#include  %A_ScriptDir%\app\settings\alternativeLayout.ahk
#include  %A_ScriptDir%\app\settings\keyboardShortcuts.ahk
#include  %A_ScriptDir%\app\settings\layout.ahk
#include  %A_ScriptDir%\app\settings\spaceAsClick.ahk
#include  %A_ScriptDir%\app\settings\stickyFailBack.ahk



resetStates()
readLayoutFile("my-layout.cfg")
readAlternativeLayoutFile("my-alternative-layout.cfg")
readSettingsFile("my-settings.cfg")
readKeyboardShortcutsFile("my-keyboard-shortcuts.cfg")
SetTimer, FixStickyKeys, %timerTimeoutStickyKeys%

readSettingsFile(path)
{
    IniRead, timeoutStillSendLayoutKey, %path%, timings, timeoutStillSendLayoutKey
    IniRead, timeoutProcessLayoutOnRelease, %path%, timings, timeoutProcessLayoutOnRelease
    IniRead, timeoutMouseScrollPoll, %path%, mouse, scrollPoll
    IniRead, mouseScrollAcceleration, %path%, mouse, scrollAcceleration
    IniRead, logInput, %path%, logging, logInput
    applyDisabledAppsSettings(path)
    applySpaceAsClickSettings(path)
}
