#SingleInstance
#Persistent
#MaxHotkeysPerInterval 400
SetKeyDelay -1
SetTitleMatchMode 2

#include %A_ScriptDir%\app\startupInitialization.ahk
#include %A_ScriptDir%\shortcuts.ahk
#include %A_ScriptDir%\app\key-hooks.ahk
#include %A_ScriptDir%\app\debug.ahk

; the following includes have key hooks and labels, they should always be last included
#include %A_ScriptDir%\app\process-key.ahk
#include %A_ScriptDir%\app\labels.ahk 
