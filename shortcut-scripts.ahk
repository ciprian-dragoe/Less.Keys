global ACTIVE_WINDOW_CLASS
global ACTIVE_WINDOW_NAME
global SCREEN_SLEEP_PATH


if (A_ComputerName = DEBUG_COMPUTER_1) {
	SCREEN_SLEEP_PATH := "c:\Users\cipri\OneDrive\PORTABLE_PROGRAMS\ahk\Navigare\KeyboardEnchancer\NOT_SYNC\nircmd"
} else if (A_ComputerName = DEBUG_COMPUTER_2) {
    SCREEN_SLEEP_PATH := "c:\Users\cipri\OneDrive\PORTABLE_PROGRAMS\ahk\Navigare\KeyboardEnchancer\NOT_SYNC\nircmd"
} else if (A_ComputerName = DEBUG_COMPUTER_3){
	SCREEN_SLEEP_PATH := "c:\Users\cipri\OneDrive\PORTABLE_PROGRAMS\ahk\Navigare\KeyboardEnchancer\NOT_SYNC\nircmd"
}


#include  %A_ScriptDir%\NOT_SYNC\mlo-shortcut-scripts.ahk
#include  %A_ScriptDir%\NOT_SYNC\freeplane-shortcut-scripts.ahk
#include  %A_ScriptDir%\NOT_SYNC\concepts-shortcut-scripts.ahk
#include  %A_ScriptDir%\NOT_SYNC\simplemind-shortcut-scripts.ahk


processShortcut(index)
{
    WinGetClass, ACTIVE_WINDOW_CLASS, A
    WinGetTitle, ACTIVE_WINDOW_NAME, A
    if (index = 1)
    {
        IfInString, ACTIVE_WINDOW_NAME, %MLO_WINDOW_NAME%
        {
            hideShowMLOnotes()
            return
        }
        IfInString, ACTIVE_WINDOW_NAME, %FREEPLANE_NOTE_WINDOW_NAME%
        {
            CloseFreeplaneNotes()
            return
        } 
        IfInString, ACTIVE_WINDOW_NAME, %FREEPLANE_WINDOW_NAME%
        {
            ShowFreeplaneNotes(FREEPLANE_NOTE_WINDOW_NAME)
            return
        }
    	IfInString, ACTIVE_WINDOW_NAME, %SIMPLEMIND_WINDOW_NAME%
        {
            ShowSimplemindNotes(SIMPLEMIND_NOTE_WINDOW_NAME)
            return
        }
    	IfInString, ACTIVE_WINDOW_NAME, %SIMPLEMIND_NOTE_WINDOW_NAME%
        {
            CloseSimplemindNotes()
            return
        }
    	
    	send ^w
    	return
    }
    
    
    if (index = 2)
    {
        IfInString, ACTIVE_WINDOW_NAME, %MLO_WINDOW_NAME%
        {
            send !w
            return
        }
        IfInString, ACTIVE_WINDOW_NAME, %FREEPLANE_WINDOW_NAME%
        {
            send !w
            return
        }
    	
    	send ^e 
    	return
    }
    
    
    if (index = 3)
    {
        IfInString, ACTIVE_WINDOW_NAME, %MLO_WINDOW_NAME%
        {
            send !e
            return
        }
        IfInString, ACTIVE_WINDOW_NAME, %FREEPLANE_WINDOW_NAME%
        {
            send !e
            return
        } 
       
    	send ^r
    	return
    }
    
    
    if (index = 10)
    {
        IfInString, ACTIVE_WINDOW_NAME, %MLO_WINDOW_NAME%
        {
            mloShowFind()
            return
        }
        
        send ^f
        return
    }
    
    
    if (index = 11)
    {
       IfInString, ACTIVE_WINDOW_NAME, %MLO_WINDOW_NAME%
        {
            mloCloseFind()
            return
        }
        
        send ^+f
        return
    }
    
    
    if (index = 20)
    {
        IfInString, ACTIVE_WINDOW_NAME, %MLO_WINDOW_NAME%
        {
            moveNoteWindowAndSetCursorEnd("up")
            return
        }
    
        send ^{up}
        return
    }
    
    
    if (index = 21)
    {
        IfInString, ACTIVE_WINDOW_NAME, %MLO_WINDOW_NAME%
        {
            moveNoteWindowAndSetCursorEnd("down")
            return
        }
    
        send ^{down}
        return
    }
    
    
    if (index = 22)
    {
        send #!]  ; shortcut MLO for rapid task entry
        WinWait ahk_class TfrmQuickAddMLOTask, , 2
        WinActivate ahk_class TfrmQuickAddMLOTask, , 2
         
        return
    }
    
    
    if (index = 31)
    {
        IfInString, ACTIVE_WINDOW_NAME, %CONCEPTS_WINDOW_NAME%
        {
            openTemplate(1)
            return
        }
        IfInString, ACTIVE_WINDOW_NAME, %MLO_WINDOW_NAME%
        {
            openMloFile(1)
            return
        }
        IfInString, ACTIVE_WINDOW_NAME, %FREEPLANE_WINDOW_NAME%
        {
            openTemplate(1, 1)
            return
        }
    
        send ^{F1}
        return
    }
    
    
    if (index = 32)
    {
        IfInString, ACTIVE_WINDOW_NAME, %CONCEPTS_WINDOW_NAME%
        {
            openTemplate(2)
            return
        }
        IfInString, ACTIVE_WINDOW_NAME, %MLO_WINDOW_NAME%
        {
            openMloFile("DOI")
            return
        }
        IfInString, ACTIVE_WINDOW_NAME, %FREEPLANE_WINDOW_NAME%
        {
            openTemplate(2, 1)
            return
        }
    
        send ^{F2}
        return
    }
    
    
    if (index = 33)
    {
        IfInString, ACTIVE_WINDOW_NAME, %CONCEPTS_WINDOW_NAME%
        {
            openTemplate(3)
            return
        }
        IfInString, ACTIVE_WINDOW_NAME, %MLO_WINDOW_NAME%
        {
            openMloFile(3)
            return
        }
        IfInString, ACTIVE_WINDOW_NAME, %FREEPLANE_WINDOW_NAME%
        {
            openTemplate(3, 1)
            return
        }
    
        send ^{F3}
        return
    }
    
    
    if (index = 34)
    {
        IfInString, ACTIVE_WINDOW_NAME, %CONCEPTS_WINDOW_NAME%
        {
            openTemplate(4)
            return
        }
        IfInString, ACTIVE_WINDOW_NAME, %MLO_WINDOW_NAME%
        {
            openMloFile(4)
            return
        }
        IfInString, ACTIVE_WINDOW_NAME, %FREEPLANE_WINDOW_NAME%
        {
            openTemplate(4, 1)
            return
        }
    
        send ^{F4}
        return
    }
    
    
    if (index = 35)
    {
        IfInString, ACTIVE_WINDOW_NAME, %CONCEPTS_WINDOW_NAME%
        {
            openTemplate(5)
            return
        }
        IfInString, ACTIVE_WINDOW_NAME, %MLO_WINDOW_NAME%
        {
            openMloFile(5)
            return
        }
        IfInString, ACTIVE_WINDOW_NAME, %FREEPLANE_WINDOW_NAME%
        {
            openTemplate(5, 1)
            return
        }
    
        send ^{F5}
        return
    }
    
    
    if (index = 36)
    {
        IfInString, ACTIVE_WINDOW_NAME, %CONCEPTS_WINDOW_NAME%
        {
            openTemplate(6)
            return
        }
        IfInString, ACTIVE_WINDOW_NAME, %MLO_WINDOW_NAME%
        {
            openMloFile(6)
            return
        }
        IfInString, ACTIVE_WINDOW_NAME, %FREEPLANE_WINDOW_NAME%
        {
            openTemplate(6, 1)
            return
        }
    
        send ^{F6}
        return
    }
    
    
    if (index = 37)
    {
        IfInString, ACTIVE_WINDOW_NAME, %CONCEPTS_WINDOW_NAME%
        {
            openTemplate(7)
            return
        }
        IfInString, ACTIVE_WINDOW_NAME, %MLO_WINDOW_NAME%
        {
            openMloFile(7)
            return
        }
        IfInString, ACTIVE_WINDOW_NAME, %FREEPLANE_WINDOW_NAME%
        {
            openTemplate(7, 1)
            return
        }
    
        send ^{F7}
        return
    }
    
    
    if (index = 38)
    {
        IfInString, ACTIVE_WINDOW_NAME, %CONCEPTS_WINDOW_NAME%
        {
            openTemplate(8)
            return
        }
        IfInString, ACTIVE_WINDOW_NAME, %MLO_WINDOW_NAME%
        {
            openMloFile(8)
            return
        }
        IfInString, ACTIVE_WINDOW_NAME, %FREEPLANE_WINDOW_NAME%
        {
            openTemplate(8, 1)
            return
        }
    
        send ^{F8}
        return
    }
    
    
    if (index = 39)
    {
        IfInString, ACTIVE_WINDOW_NAME, %CONCEPTS_WINDOW_NAME%
        {
            openTemplate(9)
            return
        }
        IfInString, ACTIVE_WINDOW_NAME, %MLO_WINDOW_NAME%
        {
            openMloFile(9)
            return
        }
        IfInString, ACTIVE_WINDOW_NAME, %FREEPLANE_WINDOW_NAME%
        {
            openTemplate(9, 1)
            return
        }
    
        send ^{F9}
        return
    }
    
    
    if (index = 40)
    {
        IfInString, ACTIVE_WINDOW_NAME, %CONCEPTS_WINDOW_NAME%
        {
            openTemplate(0)
            return
        }
        IfInString, ACTIVE_WINDOW_NAME, %MLO_WINDOW_NAME%
        {
            openMloFile(0)
            return
        }
        IfInString, ACTIVE_WINDOW_NAME, %FREEPLANE_WINDOW_NAME%
        {
            openTemplate(0, 1)
            return
        }
    
        send ^{F10}
        return
    }
    
    
    if (index = 51)
    {
        IfInString, ACTIVE_WINDOW_NAME, %CONCEPTS_WINDOW_NAME%
        {
            conceptsTemplate(1)
            return
        }
        IfInString, ACTIVE_WINDOW_NAME, %MLO_WINDOW_NAME%
        {
            synthesisTemplateMLO()
            return
        }
        IfInString, ACTIVE_WINDOW_NAME, %FREEPLANE_WINDOW_NAME%
        {
            freeplaneTemplate(1)
            return
        }
    
        send +{F1}
        return
    }
    
    
    if (index = 52)
    {
        IfInString, ACTIVE_WINDOW_NAME, %CONCEPTS_WINDOW_NAME%
        {
            conceptsTemplate(2)
            return
        }
        IfInString, ACTIVE_WINDOW_NAME, %MLO_WINDOW_NAME%
        {
            journalTemplateMLO()
            return
        }
        IfInString, ACTIVE_WINDOW_NAME, %FREEPLANE_WINDOW_NAME%
        {
            freeplaneTemplate(2)
            return
        }
    
        send +{F2}
        return
    }
    
    
    if (index = 53)
    {
        IfInString, ACTIVE_WINDOW_NAME, %CONCEPTS_WINDOW_NAME%
        {
            conceptsTemplate(3)
            return
        }
        IfInString, ACTIVE_WINDOW_NAME, %FREEPLANE_WINDOW_NAME%
        {
            freeplaneTemplate(3)
            return
        }
        
        send +{F3}
        return
    }
    
    
    if (index = 54)
    {
        IfInString, ACTIVE_WINDOW_NAME, %CONCEPTS_WINDOW_NAME%
        {
            conceptsTemplate(4)
            return
        }
        IfInString, ACTIVE_WINDOW_NAME, %FREEPLANE_WINDOW_NAME%
        {
            freeplaneTemplate(4)
            return
        }
        
        send +{F4}
        return
    }
    
    
    if (index = 55)
    {
        IfInString, ACTIVE_WINDOW_NAME, %CONCEPTS_WINDOW_NAME%
        {
            conceptsTemplate(5)
            return
        }
        IfInString, ACTIVE_WINDOW_NAME, %FREEPLANE_WINDOW_NAME%
        {
            freeplaneTemplate(5)
            return
        }
        
        send +{F5}
        return
    }
    
    
    if (index = 56)
    {
        IfInString, ACTIVE_WINDOW_NAME, %CONCEPTS_WINDOW_NAME%
        {
            conceptsTemplate(6)
            return
        }
        IfInString, ACTIVE_WINDOW_NAME, %FREEPLANE_WINDOW_NAME%
        {
            freeplaneTemplate(6)
            return
        }
        
        send +{F6}
        return
    }
    
    
    if (index = 61)
    {
        IfInString, ACTIVE_WINDOW_NAME, %MLO_WINDOW_NAME%
        {
            setContextMlo(1)
            return
        }
    
        send ^1
        return
    }
    
    
    if (index = 62)
    {
        IfInString, ACTIVE_WINDOW_NAME, %MLO_WINDOW_NAME%
        {
            setContextMlo(2)
            return
        }
    
        send ^2
        return
    }
    
    
    if (index = 63)
    {
        IfInString, ACTIVE_WINDOW_NAME, %MLO_WINDOW_NAME%
        {
            setContextMlo(3)
            return
        }
    
        send ^3
        return
    }
    
    
    if (index = 64)
    {
        IfInString, ACTIVE_WINDOW_NAME, %MLO_WINDOW_NAME%
        {
            setContextMlo(4)
            return
        }
    
        send ^4
        return
    }
    
    
    if (index = 65)
    {
        IfInString, ACTIVE_WINDOW_NAME, %MLO_WINDOW_NAME%
        {
            setContextMlo(5)
            return
        }
    
        send ^5
        return
    }
    
    
    if (index = 66)
    {
        IfInString, ACTIVE_WINDOW_NAME, %MLO_WINDOW_NAME%
        {
            setContextMlo(6)
            return
        }
    
        send ^6
        return
    }
    
    
    if (index = 71)
    {
        IfInString, ACTIVE_WINDOW_NAME, %MLO_WINDOW_NAME%
        {
            changeViewMlo(1)
            return
        }
    
        send !1
        return
    }
    
    
    if (index = 72)
    {
        IfInString, ACTIVE_WINDOW_NAME, %MLO_WINDOW_NAME%
        {
            changeViewMlo(2)
            return
        }
    
        send !2
        return
    }
    
    
    if (index = 73)
    {
        IfInString, ACTIVE_WINDOW_NAME, %MLO_WINDOW_NAME%
        {
            changeViewMlo(3)
            return
        }
    
        send !3
        return
    }
    
    
    if (index = 74)
    {
        IfInString, ACTIVE_WINDOW_NAME, %MLO_WINDOW_NAME%
        {
            changeViewMlo(4)
            return
        }
    
        send !4
        return
    }
    
    
    if (index = 75)
    {
        IfInString, ACTIVE_WINDOW_NAME, %MLO_WINDOW_NAME%
        {
            changeViewMlo(5)
            return
        }
    
        send !5
        return
    }
    
    
    if (index = 76)
    {
        IfInString, ACTIVE_WINDOW_NAME, %MLO_WINDOW_NAME%
        {
            changeViewMlo(6)
            return
        }
    
        send !6
        return
    }
    
    
    if (index = 77)
    {
        IfInString, ACTIVE_WINDOW_NAME, %MLO_WINDOW_NAME%
        {
            changeViewMlo(7)
            return
        }
    
        send !7
        return
    }
    
    
    if (index = 78)
    {
        IfInString, ACTIVE_WINDOW_NAME, %MLO_WINDOW_NAME%
        {
            changeViewMlo(8)
            return
        }
    
        send !8
        return
    }
    
    
    if (index = 79)
    {
        IfInString, ACTIVE_WINDOW_NAME, %MLO_WINDOW_NAME%
        {
            changeViewMlo(9)
            return
        }
    
        send !9
        return
    }
    
    
    if (index = 80)
    {
        IfInString, ACTIVE_WINDOW_NAME, %MLO_WINDOW_NAME%
        {
            changeViewMlo(0)
            return
        }
    
        send !0
        return
    }
    
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
        if (A_ComputerName = DEBUG_COMPUTER_11 || A_ComputerName = DEBUG_COMPUTER_21)
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


    if (index = 220)
    {
        Send +^{left}
        return
    }
        
        
    if (index = 221)
    {
        Send +^{down}
        return
    }
        
        
    if (index = 222)
    {
        Send +^{up}
        return
    }
        
        
    if (index = 223)
    {
        Send +^{right}
        return
    }
        
        
    if (index = 224)
    {
        Send +{left}
        return
    }
        
        
    if (index = 225)
    {
        Send +{down}
        return
    }
        
        
    if (index = 226)
    {
        Send +{up}
        return
    }
        
        
    if (index = 227)
    {
        Send +{right}
        return
    }
        
    
    if (index = 228)
    {
        Send +!^{left}
        return
    }
        
    
    if (index = 229)
    {
        Send +!^{down}
        return
    }
        
    
    if (index = 230)
    {
        Send +!^{up}
        return
    }
        
    
    if (index = 231)
    {
        Send +!^{right}
        return
    }
        
    
    if (index = 300)
    {
        toggleMaximizeMloWindow()
        return
    }
        
    
    
}
