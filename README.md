# LessKeys

## What it is
When you are typing if you want to press enter or backspace you normally move your right hand to reach those keys.
To keep your hands always on the keys row you can use LessKeys to temporary change the layout of your keyboard only while space is pressed.

Example: you are writing the text "successfull" and notice that you misspelled by adding an extra "l". With LessKeys you press the "space" and while keeping it pressed the "f" key which would send "backspace". After releasing the "space" key, when you press again the "f" key, the "f" letter will be sent.

## Who is it for
1. People who want to reduce the amount of wrist movement (similar results as having a kinesis advantage can be reached with certain alternative layouts. An example layout can be found in the directory where LessKeys is at `.\src\tools\archived-layouts\kinesisReplacer\`. You need to copy all those files over the ones in root folder of LessKeys)
1. Power users who want to type faster (especially for programmers who extensively use the ctrl/alt/shift modifiers for shortcut combinations)

## How to run
1. You need to have installed the latest version of AutoHotkey V1.1 (https://autohotkey.com/download/1.1/AutoHotkey_1.1.37.02_setup.exe)
1. In the folder where you have download LessKeys double-click the file `LessKeys.ahk` 

## Customizing LessKeys
1. `my-layout.cfg`
   <br>This layout is active while the "space" key is ***not*** pressed
   <br>Example: by setting capslock:enter you can remap the capslock key to enter key. While less keys is running you when you press "capslock", the "enter" key will be sent instead and capslock will not be activated.
1. `my-alternative-layout.cfg`
   <br>This layout is only active while having the "space" key pressed
   <br>Example: by setting a:left when you have the space key pressed and while keeping it pressed you type the "a" key you will instead send the "left" key
1. `my-keyboard-shortcuts.cfg`
   <br> You can also create your own global keyboard shortcuts. For example pressing "ctrl+alt+a" will trigger while "notepad++" is active to send "hello notepad" but while "visual studio code" is active to send "hello vscode".
   <br> For this you add in the file `my-keyboard-shortcuts.cfg` the line "^+a:312". You then go to the file `./src/environmentDependent/live/shortcuts/resolver.ahk` and add the line `resolverAction[312] := func("helloApp")`. In the same file you define them function "helloApp" with the code of what you want to happen when you press "ctrl+shift+a".
1. `my-settings.cfg`
   <br> You can disable the program in certain apps by adding keywords of the program name in the file `my-settings.cfg` under the section `[disable] appNames`
   <br>Example:
   <br>`[disable]
   appNames=Remote Desktop Connection~~~StarCraft~~~Virtual Machine Connection~~~skype
   `
   <br>While you are playing Starcraft it would be as if you have not opened LessKeys.
   <br>If you open Skype you will notice that LessKeys is still functioning. This is because you have entered with lower letter the word `skype` and the application name is with upper letter, so you need to enter `Skype`

## Development
1. Before committing any PR please be sure that all system tests are passing by running `./src/lessKeys/LessKeys_test.ahk`
   <br>This will start the notepad++ app and enter certain phrases during which it checks the validity of the code. The tests last ~20 minutes and at the end you will see an output in notepad with all the test results (if any failed tests you will see them at the end of the file)  
   <br>In order for the tests to run without interruption please disable windows game bar global shortcuts & microsoft teams global global shortcuts
