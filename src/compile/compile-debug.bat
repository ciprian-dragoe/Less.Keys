xcopy ".\debug\app.ahk" "..\..\" /y
xcopy ".\debug\integrationTests.ahk" "..\..\" /y
xcopy ".\debug\shortcuts.ahk" "..\..\" /y

xcopy ".\debug\my-settings\cipi-asus-rog\my-alternative-layout.cfg" "..\..\my-alternative-layout.cfg" /y
xcopy ".\debug\my-settings\cipi-asus-rog\my-keyboard-shortcuts.cfg" "..\..\my-keyboard-shortcuts.cfg" /y
xcopy ".\debug\my-settings\cipi-asus-rog\my-layout.cfg" "..\..\my-layout.cfg" /y
xcopy ".\debug\my-settings\cipi-asus-rog\my-settings.cfg" "..\..\my-settings.cfg" /y

..\..\Compiler\Ahk2Exe.exe /in ..\..\app.ahk /out .\debug\my-settings\cipi-asus-rog\LessKeys.exe /icon ..\..\icon.ico
..\..\Compiler\Ahk2Exe.exe /in ..\..\app.ahk /out .\debug\my-settings\x230\LessKeys.exe /icon ..\..\icon.ico
