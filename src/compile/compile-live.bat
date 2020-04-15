xcopy ".\live\app.ahk" "..\..\" /y
xcopy ".\integrationTests.ahk" "..\..\" /y
xcopy ".\live\shortcuts.ahk" "..\..\" /y

xcopy ".\live\my-settings\my-alternative-layout.cfg" "..\..\my-alternative-layout.cfg" /y
xcopy ".\live\my-settings\my-keyboard-shortcuts.cfg" "..\..\my-keyboard-shortcuts.cfg" /y
xcopy ".\live\my-settings\my-layout.cfg" "..\..\my-layout.cfg" /y
xcopy ".\live\my-settings\my-settings.cfg" "..\..\my-settings.cfg" /y

..\..\Compiler\Ahk2Exe.exe /in ..\..\app.ahk /out ..\..\..\LessKeys.exe /icon ..\..\icon.ico
