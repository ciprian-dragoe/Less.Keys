#SingleInstance
#Persistent
#MaxHotkeysPerInterval 400
SetKeyDelay -1



#include  %A_ScriptDir%\app\settings.ahk
#include  %A_ScriptDir%\app\debug.ahk
#include  %A_ScriptDir%\app\process-key.ahk
#include  %A_ScriptDir%\app\process\normal.ahk
#include  %A_ScriptDir%\app\process\modifier.ahk
#include  %A_ScriptDir%\app\process\layout.ahk
#include  %A_ScriptDir%\app\process\sticky.ahk
#include shortcuts.ahk