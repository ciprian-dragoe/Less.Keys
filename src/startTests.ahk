#SingleInstance
#Persistent
#NoEnv
#MaxHotkeysPerInterval 400
#InstallKeybdHook
SetKeyDelay -1
SetTitleMatchMode 2



global PATH_APP_CONFIGURATION := A_ScriptDir .  "\environmentDependent\test\binaries\"



#include %A_ScriptDir%\startup\startup.ahk
#include %A_ScriptDir%\processKey\processKey.ahk
#include %A_ScriptDir%\environmentDependent\test\shortcuts\resolver.ahk
#include %A_ScriptDir%\debug\debug.ahk
#include %A_ScriptDir%\environmentDependent\test\postStartup\postStartup.ahk

; the following includes have key hooks and labels, they should always be last included 
; because after them any other code is no longer run (for example global variable declaration
; will be ignored) 
#include %A_ScriptDir%\startup\labels.ahk
#include %A_ScriptDir%\environmentDependent\test\keyHooks\keyHooks.ahk

; if you want to add your custom labels, add them here
#include %A_ScriptDir%\environmentDependent\test\labels\custom.ahk
