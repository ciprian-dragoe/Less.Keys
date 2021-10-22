#SingleInstance
#Persistent
#MaxHotkeysPerInterval 600
#InstallKeybdHook
#NoEnv
Process, Priority,, High
SetKeyDelay -1
SetTitleMatchMode 2
SetBatchLines -1

global IS_RUNNING_DEBUG_MODE := 1
if (A_ScriptName = "hookHandler.exe")
{
    IS_RUNNING_DEBUG_MODE := 0
}


#include %A_ScriptDir%\services\senders.ahk

; the following includes have key hooks and labels, they should always be last included
; because after them any other code is no longer run (for example global variable declaration
; will be ignored)
#include %A_ScriptDir%\services\hooks.ahk
