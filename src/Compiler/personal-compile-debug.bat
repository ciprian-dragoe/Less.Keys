xcopy "..\NOT_SYNC\environments\debug\shortcuts.ahk" "..\shortcuts.ahk" /y
xcopy "..\NOT_SYNC\environments\debug\my-settings\cipi-asus-rog\my-alternative-layout.cfg" "..\my-alternative-layout.cfg" /y
xcopy "..\NOT_SYNC\environments\debug\my-settings\cipi-asus-rog\my-keyboard-shortcuts.cfg" "..\my-keyboard-shortcuts.cfg" /y
xcopy "..\NOT_SYNC\environments\debug\my-settings\cipi-asus-rog\my-layout.cfg" "..\my-layout.cfg" /y
xcopy "..\NOT_SYNC\environments\debug\my-settings\cipi-asus-rog\my-settings.cfg" "..\my-settings.cfg" /y

Ahk2Exe.exe /in ..\app.ahk /out ..\NOT_SYNC\environments\debug\my-settings\cipi-asus-rog\LessKeys.exe /icon ..\icon.ico
Ahk2Exe.exe /in ..\app.ahk /out ..\NOT_SYNC\environments\debug\my-settings\x230\LessKeys.exe /icon ..\icon.ico
