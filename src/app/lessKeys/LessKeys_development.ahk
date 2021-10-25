#SingleInstance Force
#Persistent
#NoEnv
SetTitleMatchMode 2
DetectHiddenWindows On

global HOOK_READER := A_ScriptDir . "\..\hookReader\startHookReader_development.ahk"
global HOOK_HANDLER := A_ScriptDir . "\..\hookHandler\startHookHandler_development.ahk"
if (A_ScriptName = "LessKeys.exe")
{
    HOOK_READER := A_ScriptDir . "\startHookReader.exe"
    HOOK_HANDLER := A_ScriptDir . "\startHookHandler.exe"
}


#include  %A_ScriptDir%\..\environmentDependent\COMMON\appMessages.ahk
#include %A_ScriptDir%\services\appConfiguration.ahk
#include %A_ScriptDir%\services\debug.ahk
#include %A_ScriptDir%\services\postStartup.ahk


startApp()
