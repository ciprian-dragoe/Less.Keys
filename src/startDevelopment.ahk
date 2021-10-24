#SingleInstance Force
#Persistent
#NoEnv
SetTitleMatchMode 2
DetectHiddenWindows On


hookReader := A_ScriptDir . "\app\hookReader\startHookReader.ahk"
hookHandler := A_ScriptDir . "\app\hookHandler\startHookHandler.ahk"
if (A_ScriptName = "LessKeys.exe")
{
    hookReader := A_ScriptDir . "\startHookReader.exe"
    hookHandler := A_ScriptDir . "\startHookHandler.exe"
}

tooltip `n`nLessKeys`n`n
; !!! scripts must be started in this order !!!
run %hookReader%
sleep 500
run %hookHandler%
tooltip
