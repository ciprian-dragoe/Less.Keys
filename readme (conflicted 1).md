# LessKeys

## What it is
To reduce wrist movement for accessing certain keys (for example the arrow keys) you can change the layout of your keyboard only while the space key is pressed. After you release the space key, the normal keyboard layout is again set.
Exampe: you are writing the text "Helo, how are you doing?" and notice that you misspelled the word "hello". You press the left key until you reach the word "helo" and correct it. Alternatively  you could press the space key and while it is pressed you press the "a" key which would be translated into left arrow key instead of the letter "a". After releasing the space key, when you press again the "a" key, the "a" letter will be sent.
       
## Who is it for ?
1. People who want to reduce the amount of wrist movement (similar results as having a kinesis advantage can be reached with certain alternative layouts, copy the layouts from ALTERNATIVE_LAYOUTS_ARCHIVE\programers\ to the root program path for an example)
1. Power users who want to type faster (especially for programmers who extensively use the ctrl/alt/shift modifiers for shortcut combinations)

## Editing the layout
If you want to create your own layout you can edit the following files:
1. my-layout
This layout is active while the space key is not pressed
Example: by seting capslock:enter you can remap the capslock key to enter key
2. my-alternative-layout
This layout is only active while having the space key pressed
Example: by seting a:left when you have the space key pressed and press the "a" key you will instead have the "left" key pressed

## Shortcuts
You can also create your own shortcuts. For this you need to assign to a key combination a number which then you must implement in the ./src/shortcuts/resolver.ahk
The implementation is done in autohotkey.
Please recompile the program after creating the new shortcut using .src\compiler\compile-live.bat

## Advanced
You can disable the program in certain apps by adding keywords of the program name in the file my-settings.cfg under the section [disable] appNames 

## Development
Before commiting any PR please also create a new binary. You can do this by executing the src\compiler\compile-live.bat
