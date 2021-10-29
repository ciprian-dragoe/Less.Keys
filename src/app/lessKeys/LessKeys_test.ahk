#SingleInstance Force
#Persistent
#NoEnv
SetTitleMatchMode 2
DetectHiddenWindows On


global HOOKS_READER := A_ScriptDir . "\..\hookReader\startHookReader_test.ahk"
global HOOKS_HANDLER := A_ScriptDir . "\..\hookHandler\startHookHandler_test.ahk"
global PATH_APP_CONFIGURATION := A_ScriptDir .  "\..\environmentDependent\test\binaries\"
if (A_ScriptName = "LessKeys.exe")
{
    HOOK_READER := A_ScriptDir . "\startHookReader.exe"
    HOOK_HANDLER := A_ScriptDir . "\startHookHandler.exe"
}


#include %A_ScriptDir%\services\startup.ahk
#include %A_ScriptDir%\services\postStartup.ahk
#include %A_ScriptDir%\..\environmentDependent\test\postStartup\postStartupLessKeys.ahk


startApp()
