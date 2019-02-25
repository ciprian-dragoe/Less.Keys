global ACTIVE_WINDOW_CLASS
global ACTIVE_WINDOW_NAME
global SCREEN_SLEEP_PATH


if (A_ComputerName = DEBUG_COMPUTER_1) {
	SCREEN_SLEEP_PATH := "c:\Dropbox\PORTABLE_PROGRAMS\ahk\AHK KIT\ahk_kit\nircmd"
} else if (A_ComputerName = DEBUG_COMPUTER_2) {
    SCREEN_SLEEP_PATH := "d:\SYNC\Cipi\Dropbox\PORTABLE_PROGRAMS\ahk\AHK KIT\ahk_kit\nircmd"
} else if (A_ComputerName = DEBUG_COMPUTER_3){
	SCREEN_SLEEP_PATH := "c:\Dropbox\PORTABLE_PROGRAMS\ahk\AHK KIT\ahk_kit\nircmd"
}


#include  %A_ScriptDir%\NOT_SYNC\mlo-shortcut-scripts.ahk


processShortcut(index)
{
    WinGetClass, ACTIVE_WINDOW_CLASS, A
    WinGetTitle, ACTIVE_WINDOW_NAME, A
    
    if (index = 101)
    {
        send {blind}1
        return
    }
    
    
    if (index = 102)
    {
        send {blind}2
        return
    }
    
    
    if (index = 103)
    {
        send {blind}3
        return
    }
    
    
    if (index = 104)
    {
        send {blind}4
        return
    }
    
    
    if (index = 105)
    {
        send {blind}5
        return
    }
    
    
    if (index = 106)
    {
        if (A_ComputerName = DEBUG_COMPUTER_1 || A_ComputerName = DEBUG_COMPUTER_2)
        {
            toggleMaximizeMloWindow()
            return
        }
        
        send {blind}6
        return
    }
    
    
    if (index = 107)
    {
        send {blind}7
        return
    }
    
    
    if (index = 108)
    {
        send {blind}8
        return
    }
    
    
    if (index = 109)
    {
        send {blind}9
        return
    }
    
    
    if (index = 121)
    {
        Send {Media_Next}
        return
    }
    
        
    if (index = 122)
    {
        Send {Media_Play_Pause}
        return
    }
    
    
    if (index = 123)
    {
        Send {Media_Prev}
        return
    }
    
    
    if (index = 124)
    {
        sleep 1000
        Run, %SCREEN_SLEEP_PATH% monitor off
        return
    }
    
    
    if (index = 125)
    {
        Send #r
        return
    }
    
    
    if (index = 126)
    {
        Send #d
        return
    }
    
    
    if (index = 127)
    {
        tooltip ALWAYS TOP TOGGLE
        sleep 400
        tooltip
        Winset, Alwaysontop, , A
        
        return
    }
    
    
    if (index = 201)
    {
        Send !{NumPad1}
        return
    }
    
    
    if (index = 202)
    {
        Send !{NumPad2}
        return
    }
    
    
    if (index = 203)
    {
        Send !{NumPad3}
        return
    }
    
    
    if (index = 204)
    {
        Send !{NumPad4}
        return
    }
    
    
    if (index = 205)
    {
        Send !{NumPad5}
        return
    }
    
    
    if (index = 206)
    {
        Send !{NumPad6}
        return
    }
    
    
    if (index = 207)
    {
        Send !{NumPad7}
        return
    }
    
    
    if (index = 208)
    {
        Send !{NumPad8}
        return
    }
    
    
    if (index = 209)
    {
        Send !{NumPad9}
        return
    }

}
