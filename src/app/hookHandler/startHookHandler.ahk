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
if (A_ScriptName = "startHookHandler.exe")
{
    PATH_APP_CONFIGURATION := A_ScriptDir .  ".\"
}


#include %A_ScriptDir%\startup\startup.ahk
#include %A_ScriptDir%\processKey\processKey.ahk
#include %A_ScriptDir%\..\environmentDependent\_development\shortcuts\resolver.ahk
#include %A_ScriptDir%\debug\debug.ahk
#include %A_ScriptDir%\..\environmentDependent\_development\postStartup\postStartup.ahk

; the following includes have key hooks and labels, they should always be last included
; because after them any other code is no longer run (for example global variable declaration
; will be ignored)
#include %A_ScriptDir%\startup\labels.ahk

; if you want to add your custom labels, add them here
#include %A_ScriptDir%\..\environmentDependent\_development\labels\custom.ahk
