#SingleInstance
#Persistent
#MaxHotkeysPerInterval 100
#InstallKeybdHook
#NoEnv
Process, Priority,, High
DetectHiddenWindows On
SetTitleMatchMode 2
SetBatchLines -1


global PATH_APP_CONFIGURATION := A_ScriptDir .  "\..\environmentDependent\_development\binaries\"
global IS_RUNNING_DEBUG_MODE := 1
global TARGET_HANDLER_SCRIPT := "startHookHandler.ahk ahk_class AutoHotkey"
if (A_ScriptName = "startHookReader.exe")
{
    PATH_APP_CONFIGURATION := A_ScriptDir .  ".\"
    IS_RUNNING_DEBUG_MODE := 0
    TARGET_HANDLER_SCRIPT := "startHookHandler.exe"
}

#include %A_ScriptDir%\services\startup.ahk
#include %A_ScriptDir%\services\senders.ahk
#include %A_ScriptDir%\services\postStartup.ahk
#include %A_ScriptDir%\..\environmentDependent\_development\postStartup\postStartupHookReader.ahk


; the following includes have key hooks and labels, they should always be last included
; because after them any other code is no longer run (for example global variable declaration
; will be ignored)
#include %A_ScriptDir%\services\labels.ahk

; if you want to add your custom labels, add them here
#include %A_ScriptDir%\..\environmentDependent\_development\labels\customHookReader.ahk

#include %A_ScriptDir%\services\hooks.ahk
