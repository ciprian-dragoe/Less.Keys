#SingleInstance Force
#Persistent
#NoEnv
SetTitleMatchMode 2
DetectHiddenWindows On


global HOOKS_READER := A_ScriptDir . "\..\hookReader\startHookReader_development.ahk"
global HOOKS_HANDLER := A_ScriptDir . "\..\hookHandler\startHookHandler_development.ahk"
global PATH_APP_CONFIGURATION := A_ScriptDir .  "\..\environmentDependent\development\binaries\"
if (A_ScriptName = "LessKeys.exe")
{
    HOOKS_READER := A_ScriptDir . "\startHookReader.exe"
    HOOKS_HANDLER := A_ScriptDir . "\startHookHandler.exe"
}


#include %A_ScriptDir%\services\startup.ahk
#include %A_ScriptDir%\services\postStartup.ahk
#include %A_ScriptDir%\..\environmentDependent\development\postStartup\postStartupLessKeys.ahk


; the following includes have key hooks and labels, they should always be last included
; because after them any other code is no longer run (for example global variable declaration
; will be ignored)
#include %A_ScriptDir%\..\environmentDependent\development\labels\customLessKeys.ahk


startApp()
