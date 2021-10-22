#SingleInstance
#Persistent
#MaxHotkeysPerInterval 600
#InstallKeybdHook
#NoEnv
Process, Priority,, High
SetKeyDelay -1
DetectHiddenWindows On
SetTitleMatchMode 2
SetBatchLines -1

global IS_RUNNING_DEBUG_MODE := 1
global TARGET_HANDLER_SCRIPT := "startHookHandler.ahk ahk_class AutoHotkey"
if (A_ScriptName = "startHookReader.exe")
{
    IS_RUNNING_DEBUG_MODE := 0
    TARGET_HANDLER_SCRIPT := "startHookHandler.exe"
}


#include %A_ScriptDir%\services\senders.ahk

; the following includes have key hooks and labels, they should always be last included
; because after them any other code is no longer run (for example global variable declaration
; will be ignored)
#include %A_ScriptDir%\services\hooks.ahk
