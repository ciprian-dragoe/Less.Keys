#SingleInstance Force
#Persistent
#NoEnv
SetTitleMatchMode 2
DetectHiddenWindows On


global HOOKS_READER := A_ScriptDir . "\..\..\..\hookReader\startHookReader_test.ahk"
global HOOKS_HANDLER := A_ScriptDir . "\..\..\..\hookHandler\startHookHandler_test.ahk"
global PATH_APP_CONFIGURATION := A_ScriptDir .  ".\"
if (A_ScriptName = "LessKeys.exe")
{
    HOOKS_READER := A_ScriptDir . "\startHookReader.exe"
    HOOKS_HANDLER := A_ScriptDir . "\startHookHandler.exe"
    PATH_APP_CONFIGURATION := A_ScriptDir .  ".\"
}


#include %A_ScriptDir%\..\..\COMMON\pathManagement.ahk
#include %A_ScriptDir%\..\..\COMMON\appMessages.ahk
#include %A_ScriptDir%\..\..\COMMON\processManagement.ahk
#include %A_ScriptDir%\..\..\COMMON\debug.ahk
#include %A_ScriptDir%\..\..\COMMON\random.ahk
#include %A_ScriptDir%\..\postStartup\postStartupLessKeys.ahk


; the following includes have key hooks and labels, they should always be last included
; because after them any other code is no longer run (for example global variable declaration
; will be ignored)
#include %A_ScriptDir%\..\labels\customLessKeys.ahk


startApp()
