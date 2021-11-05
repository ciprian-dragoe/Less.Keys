#SingleInstance Force
#Persistent
#NoEnv
SetTitleMatchMode 2
DetectHiddenWindows On


global HOOKS_READER := A_ScriptDir . "\..\hookReader\startHookReader_live.ahk"
global HOOKS_HANDLER := A_ScriptDir . "\..\hookHandler\startHookHandler_live.ahk"
global PATH_APP_CONFIGURATION := A_ScriptDir .  "\..\environmentDependent\live\binaries\"
if (A_ScriptName = "LessKeys.exe")
{
    HOOKS_READER := A_ScriptDir . "\startHookReader.exe"
    HOOKS_HANDLER := A_ScriptDir . "\startHookHandler.exe"
}


#include %A_ScriptDir%\services\startup.ahk
#include %A_ScriptDir%\services\postStartup.ahk
#include %A_ScriptDir%\..\environmentDependent\live\postStartup\postStartupLessKeys.ahk


; the following includes have key hooks and labels, they should always be last included
; because after them any other code is no longer run (for example global variable declaration
; will be ignored)
#include %A_ScriptDir%\..\environmentDependent\live\labels\customLessKeys.ahk


startApp()
