#SingleInstance Force
#Persistent
#NoEnv
SetTitleMatchMode 2
DetectHiddenWindows On

global HOOK_READER := A_ScriptDir . "\..\hookReader\startHookReader_live.ahk"
global HOOK_HANDLER := A_ScriptDir . "\..\hookHandler\startHookHandler_live.ahk"


if (A_ScriptName = "LessKeys.exe")
{
    HOOK_READER := A_ScriptDir . "\startHookReader.exe"
    HOOK_HANDLER := A_ScriptDir . "\startHookHandler.exe"
}


tooltip `n`nLessKeys`n`n
; !!! scripts must be started in this order !!!
run %HOOK_READER%
sleep 500
run %HOOK_HANDLER%
tooltip
