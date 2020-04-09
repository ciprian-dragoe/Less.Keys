#SingleInstance
#Persistent
#MaxHotkeysPerInterval 400
SetKeyDelay -1
SetTitleMatchMode 2

#include %A_ScriptDir%\app\startupInitialization.ahk
#include %A_ScriptDir%\app\process-key.ahk
#include %A_ScriptDir%\shortcuts.ahk
#include %A_ScriptDir%\app\debug.ahk
#include %A_ScriptDir%\app\NOT_SYNC\customStartup.ahk

; the following includes have key hooks and labels, they should always be last included 
; because after them any other code is no longer run (for example global variable declaration
; will be ignored) 
#include %A_ScriptDir%\app\labels.ahk
#include %A_ScriptDir%\app\key-hooks.ahk

; if you want to add your custom labels, add them here  
#include %A_ScriptDir%\app\NOT_SYNC\customlabels.ahk
