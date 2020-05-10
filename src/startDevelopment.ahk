#SingleInstance
#Persistent
#MaxHotkeysPerInterval 400
SetKeyDelay -1
SetTitleMatchMode 2



global PATH_APP_CONFIGURATION := A_ScriptDir .  "\app\environmentDependent\binaries\development\"
if (A_ScriptName == "LessKeys.exe")
{
    PATH_APP_CONFIGURATION := A_ScriptDir .  ".\"
}


#include %A_ScriptDir%\app\startup\startup.ahk
#include %A_ScriptDir%\app\processKey\processKey.ahk
#include %A_ScriptDir%\app\environmentDependent\shortcuts\development\indexShortcuts.ahk
#include %A_ScriptDir%\app\debug\debug.ahk
#include %A_ScriptDir%\app\environmentDependent\postStartup\development\postStartup.ahk

; the following includes have key hooks and labels, they should always be last included 
; because after them any other code is no longer run (for example global variable declaration
; will be ignored) 
#include %A_ScriptDir%\app\startup\labels.ahk
#include %A_ScriptDir%\app\environmentDependent\keyHooks\development\keyHooks.ahk

; if you want to add your custom labels, add them here  
#include %A_ScriptDir%\app\environmentDependent\labels\development\custom.ahk
