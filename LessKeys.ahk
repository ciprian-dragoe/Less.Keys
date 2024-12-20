#SingleInstance Force
#Persistent
#NoEnv
SetTitleMatchMode 2
DetectHiddenWindows On


global HOOKS_READER := A_ScriptDir . "\src\hookReader\startHookReader_live.ahk"
global HOOKS_HANDLER := A_ScriptDir . "\src\hookHandler\startHookHandler_live.ahk"
global PATH_APP_CONFIGURATION := A_ScriptDir .  ".\"
if (A_ScriptName = "LessKeys.exe")
{
    HOOKS_READER := A_ScriptDir . "\startHookReader.exe"
    HOOKS_HANDLER := A_ScriptDir . "\startHookHandler.exe"
    PATH_APP_CONFIGURATION := A_ScriptDir .  ".\"
}


#include %A_ScriptDir%\src\environmentDependent\COMMON\pathManagement.ahk
#include %A_ScriptDir%\src\environmentDependent\COMMON\appMessages.ahk
#include %A_ScriptDir%\src\environmentDependent\COMMON\processManagement.ahk
#include %A_ScriptDir%\src\environmentDependent\COMMON\debug.ahk
#include %A_ScriptDir%\src\environmentDependent\COMMON\random.ahk
#include %A_ScriptDir%\src\environmentDependent\live\postStartup\postStartupLessKeys.ahk


; the following includes have key hooks and labels, they should always be last included
; because after them any other code is no longer run (for example global variable declaration
; will be ignored)
#include %A_ScriptDir%\src\environmentDependent\live\labels\customLessKeys.ahk


startApp()
