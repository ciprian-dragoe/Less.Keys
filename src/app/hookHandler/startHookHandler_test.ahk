#installmousehook
#SingleInstance Force
#Persistent
#MaxHotkeysPerInterval 100
#InstallKeybdHook
#NoEnv
#NoTrayIcon
Process, Priority,, High
DetectHiddenWindows On
SetTitleMatchMode 2
SetBatchLines -1


global SCRIPT_HOOKS_READER := "startHookReader_test.ahk ahk_class AutoHotkey"
global PATH_APP_CONFIGURATION := A_ScriptDir .  "\..\environmentDependent\test\binaries\"
if (A_ScriptName = "startHookHandler.exe")
{
    PATH_APP_CONFIGURATION := A_ScriptDir .  ".\"
    SCRIPT_HOOKS_READER := "startHookReader.exe"
}


#include %A_ScriptDir%\services\startup.ahk
#include %A_ScriptDir%\services\processKey\processKey.ahk
#include %A_ScriptDir%\..\environmentDependent\test\shortcuts\resolver.ahk
#include %A_ScriptDir%\services\postStartup.ahk
#include %A_ScriptDir%\..\environmentDependent\test\postStartup\postStartupHookHandler.ahk


; the following includes have key hooks and labels, they should always be last included
; because after them any other code is no longer run (for example global variable declaration
; will be ignored)
#include %A_ScriptDir%\services\labels.ahk

; if you want to add your custom labels, add them here
#include %A_ScriptDir%\..\environmentDependent\test\labels\customHookHandler.ahk
