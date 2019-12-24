xcopy "..\NOT_SYNC\environments\live\shortcuts.ahk" "..\shortcuts.ahk" /y
xcopy "..\NOT_SYNC\environments\live\my-settings\my-alternative-layout.cfg" "..\my-alternative-layout.cfg" /y
xcopy "..\NOT_SYNC\environments\live\my-settings\my-keyboard-shortcuts.cfg" "..\my-keyboard-shortcuts.cfg" /y
xcopy "..\NOT_SYNC\environments\live\my-settings\my-layout.cfg" "..\my-layout.cfg" /y
xcopy "..\NOT_SYNC\environments\live\my-settings\my-settings.cfg" "..\my-settings.cfg" /y

Ahk2Exe.exe /in ..\app.ahk /out ..\..\LessKeys.exe /icon ..\icon.ico
