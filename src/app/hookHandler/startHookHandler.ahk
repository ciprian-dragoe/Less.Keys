#SingleInstance
#Persistent
#MaxHotkeysPerInterval 600
#InstallKeybdHook
#NoEnv
Process, Priority,, High
SetKeyDelay -1
SetTitleMatchMode 2
SetBatchLines -1

global PATH_APP_CONFIGURATION := A_ScriptDir .  "\..\environmentDependent\_development\binaries\"
global TARGET_HANDLER_SCRIPT := "startHookReader.ahk ahk_class AutoHotkey"
if (A_ScriptName = "startHookHandler.exe")
{
    PATH_APP_CONFIGURATION := A_ScriptDir .  ".\"
    TARGET_HANDLER_SCRIPT := "startHookReader.exe"
}

#include %A_ScriptDir%\services\startup.ahk
#include %A_ScriptDir%\services\processKey\processKey.ahk
#include %A_ScriptDir%\..\environmentDependent\_development\shortcuts\resolver.ahk
#include %A_ScriptDir%\services\postStartup.ahk
#include %A_ScriptDir%\..\environmentDependent\_development\postStartup\postStartupHookHandler.ahk

; the following includes have key hooks and labels, they should always be last included
; because after them any other code is no longer run (for example global variable declaration
; will be ignored)
#include %A_ScriptDir%\services\labels.ahk

; if you want to add your custom labels, add them here
#include %A_ScriptDir%\..\environmentDependent\_development\labels\customHookHandler.ahk
