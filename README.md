# LessKeys

## What it is
To reduce wrist movement for accessing certain keys (for example the arrow keys) you can change the layout of your keyboard only while the "space" key is pressed. After you release the "space" key, the normal keyboard layout is again set.

Example: you are writing the text "Helo, how are you doing?" and notice that you misspelled the word "hello". You press the left key until you reach the word "helo" and correct it. Alternatively  you could press the "space" key and while it is pressed you press the "a" key which would be translated into left arrow key instead of the letter "a". After releasing the "space" key, when you press again the "a" key, the "a" letter will be sent.
       
## Who is it for ?
1. People who want to reduce the amount of wrist movement (similar results as having a kinesis advantage can be reached with certain alternative layouts, copy the layouts from `ALTERNATIVE_LAYOUTS_ARCHIVE\programmers\` or `ALTERNATIVE_LAYOUTS_ARCHIVE\trackpoint\` to the root program path for an example)
1. Power users who want to type faster (especially for programmers who extensively use the ctrl/alt/shift modifiers for shortcut combinations)

## Editing the layout
If you want to create your own layout you can edit the following files:
1. `my-layout`
<br>This layout is active while the "space" key is ***not*** pressed
<br>Example: by setting capslock:enter you can remap the capslock key to enter key. While less keys is running you when you press "capslock", the "enter" key will be sent instead and capslock will not be activated.
2. `my-alternative-layout`
<br>This layout is only active while having the "space" key pressed
<br>Example: by setting a:left when you have the space key pressed and press the "a" key you will instead have the "left" key pressed

## Shortcuts
You can also create your own shortcuts. For this you need to assign to a key combination a number which then you must implement in the `./src/app/environmentDependent/shortcuts/live/resolver.ahk`
<br>The implementation is done in autohotkey.
Please recompile the program after creating the new shortcut using `./src/compileLive.ahk`
- please be sure in the taskbar the program is not already running as it won't be able to write over it the new version
- sometimes the antivirus can complain that the resulted file has a trojan, you can ignore the warning and set to allow the compiled file on your system

## Advanced
1. You can disable the program in certain apps by adding keywords of the program name in the file `my-settings.cfg` under the section `[disable] appNames`
<br>Example: 
<br>`[disable]
 appNames=Remote Desktop Connection~~~StarCraft~~~Virtual Machine Connection
` 
<br>While you are playing Starcraft it would be as if you have not opened LessKeys.
<br>If you open Skype you will notice that LessKeys is still functioning. This is because you have entered with lower letter the word `skype` and the application name is with upper letter, so you need to enter `Skype` 
1. If you have a trackpoint you can simulate as if you have a middle mouse button for scrolling like in thinkpad keyboards by pressing the "space" key and moving the trackpoint which will trigger a scroll. To enable this functionality add in the `my-settings.cfg` section `mouse` property `scrollPoll` and `scrollAcceleration` any positive number. You can play with these number to adjust the scroll speed
1. For the layout used in `ALTERNATIVE_LAYOUTS_ARCHIVE\trackpoint\` you will see that in the file `my-layout.cfg` you have remapped for the "2" key to "ctrlClick". This is a special modifier key which acts as ctrl key and if no combination was sent a right click
## Development
1. Before committing any PR please be sure that all integration tests are passing by running `./src/startTests.ahk`
<br>This will start the notepad app and enter certain phrases during which it checks the validity of the code. The tests last ~4 minutes and at the end you will see an output in notepad with all the test results (if any failed tests you will see them at the end of the file)  
1. Before committing any PR please also create a new binary by executing the src\compileLive.ahk
1. The code is structured to make the difference between live/test/development environment by the files it includes when you start the app via `./src/start{yourDevelopmentEnvironment}`. The code which is dependent on the running environment should be put in the folder `./src/app/environmentDependent/` 