#SingleInstance
#Persistent
#MaxHotkeysPerInterval 400
; ^ ctrl	! alt		+ shift		# WindowsKey
; sc033 -> ,
; sc034 -> .
; sc029 -> `
;----------------- CONFIGURATION SECTION
global contextKey := "space"


global contextDelete := "h"
global contextBackspace := "j"
global contextEnter := "k"
global contextTab := "l"
global contextEscape := ";"
global contextF12 := "'"
global contextInsert := "/"

global contextLeft := "a"
global contextDown := "s"
global contextUp := "d"
global contextRight := "f"
global contextHome := "capslock"
global contextEnd := "g"
global contextPgDn := "z"
global contextPgUp := x

global context1 := ""
global context2 := ""
global context3 := ""
global context4 := ""
global context5 := ""
global context6 := ""
global context7 := ""
global context8 := ""
global context9 := ""
global context0 := ""

global alternativeCtrlLeft := "w"
global alternativeShiftLeft := "e"
global alternativeAltLeft := "r"
global alternativeWinRight := "u"
global alternativeAltRight := "i"
global alternativeShiftRight := "o"
global alternativeCtrlRight := "p"
;----------------- END OF CONFIGURATION SECTION








SetKeyDelay -1
global timeoutStillSendSpecialContextKey := 201
global timeoutResetTreatContextKeyAsRegularKey := 151
global allowSendContextKey := 1
global sendSpecialContextKeyOnNormalKeyPress := false
global navigationMode := 1



global debugComputer := false
if (A_ComputerName = "lenovo-x230" || "CIPI-ASUS-ROG") {
	debugComputer := true
}
processAhkKeyboardShortcuts(activeModifiers, key)
{
    if (debugComputer)
    {
        WinGetClass, ActiveWindowClass, A
        combination := activeModifiers . key
        
        if (combination = "#w")
        {
            send #1
            return true
        }
        if (combination = "#e")
        {
            send #2
            return true
        }
        if (combination = "#r")
        {
            send #3
            return true
        }
        if (combination = "#s")
        {
            send #4
            return true
        }
        if (combination = "#d")
        {
            send #5
            return true
        }
        if (combination = "#f")
        {
            run MLO.ahk 3
            return true
        }
        if (combination = "#x")
        {
            send #7
            return true
        }
        if (combination = "#c")
        {
            send #8
            return true
        }
        if (combination = "#v")
        {
            send #9
            return true
        }
        if (combination = "#g")
        {
            send #d
            return true
        }
        if (combination = "#t")
        {
            send #r
            return true
        }
        
        if (combination = "+#w")
        {
            send #+{NumPad7}
            return true
        }
        if (combination = "+#e")
        {
            send #+{NumPad8}
            return true
        }
        if (combination = "+#r")
        {
            send #+{NumPad9}
            return true
        }
        if (combination = "+#s")
        {
            send #+{NumPad4}
            return true
        }
        if (combination = "+#d")
        {
            send #+{NumPad5}
            return true
        }
        if (combination = "+#f")
        {
            send #+{NumPad6}
            return true
        }
        if (combination = "+#x")
        {
            send #+{NumPad1}
            return true
        }
        if (combination = "+#c")
        {
            send #+{NumPad2}
            return true
        }
        if (combination = "+#v")
        {
            send #+{NumPad3}
            return true
        }
        
        if (ActiveWindowClass = "TfrmMyLifeMain")
        {
            if (combination = "!w")
            {
                run MLO.ahk 1
                return true
            }
            if (combination = "!e")
            {
                run MLO.ahk 11
                return true
            }
            if (combination = "!r")
            {
                run MLO.ahk 12
                return true
            }
            if (combination = "+F1")
            {
                run MLO.ahk 5
                return true
            }
            if (combination = "^up")
            {
                run MLO.ahk 7
                return true
            }
            if (combination = "^down")
            {
                run MLO.ahk 8
                return true
            }
            if (combination = "^f")
            {
                run MLO.ahk 9
                return true
            }
            if (combination = "^+f")
            {
                run MLO.ahk 10
                return true
            }
        }
    }
    return false
}

#If navigationMode = 1
    ;-------------------- process key
    
    global leftModifierGroupFirstPressed := false
    global rightModifierGroupFirstPressed := false
    processKeyDown(key)
    {
        if (key = contextKey)
        {
            manageContextKeyDown(key)
            return
        }
        
        if (leftModifierGroupFirstPressed)
        {
            if (key = alternativeCtrlLeft)
            {
                processLeftSideModifierKeyDown("ctrl")
                return		
            }
            if (key = alternativeAltLeft)
            {
                processLeftSideModifierKeyDown("alt")
                return		
            }
            if (key = alternativeShiftLeft)
            {
                processLeftSideModifierKeyDown("shift")
                return		
            }
        }
        
        if (rightModifierGroupFirstPressed)
        {
            if (key = alternativeCtrlRight)
            {
                processRightSideModifierKeyDown("ctrl")
                return		
            }
            if (key = alternativeAltRight)
            {
                processRightSideModifierKeyDown("alt")
                return		
            }
            if (key = alternativeShiftRight)
            {
                processRightSideModifierKeyDown("shift")
                return		
            }
            if (key = alternativeWinRight)
            {
                processRightSideModifierKeyDown("lwin")
                return		
            }
        }
        
        if (modifierKeysAlternativeLayoutActive)
        {
            if (key = alternativeCtrlLeft && !rigthModifierGroupFirstPressed)
            {
                processLeftSideModifierKeyDown("ctrl")
                return		
            }
            
            if (key = alternativeShiftLeft && !rigthModifierGroupFirstPressed)
            {
                processLeftSideModifierKeyDown("shift")
                return
            }
            
            if (key = alternativeAltLeft && !rigthModifierGroupFirstPressed)
            {
                processLeftSideModifierKeyDown("alt")
                return
            }
            
            if (key = alternativeCtrlRight && !leftModifierGroupFirstPressed)
            {
                processRightSideModifierKeyDown("ctrl")
                return
            }
            
            if (key = alternativeShiftRight && !leftModifierGroupFirstPressed)
            {
                processRightSideModifierKeyDown("shift")
                return
            }
            
            if (key = alternativeAltRight && !leftModifierGroupFirstPressed)
            {
                processRightSideModifierKeyDown("alt")
                return
            }
            
            if (key = alternativeWinRight && !leftModifierGroupFirstPressed)
            {
                processRightSideModifierKeyDown("lwin")
                return
            }
        }
        
        if (alternativeLayoutActive)
        {
            if (key = contextLeft)
            {
                processNormalKeyDown("left")
                return
            }
            if (key = contextDown)
            {
                processNormalKeyDown("down")
                return
            }
            if (key = contextRight)
            {
                processNormalKeyDown("right")
                return
            }
            if (key = contextUp)
            {
                processNormalKeyDown("up")
                return
            }
            if (key = contextHome)
            {
                processNormalKeyDown("home")
                return
            }
            if (key = contextEnd)
            {
                processNormalKeyDown("end")
                return
            }
            if (key = contextPgDn)
            {
                processNormalKeyDown("PgDn")
                return
            }
            if (key = contextPgUp)
            {
                processNormalKeyDown("PgUp")
                return
            }
    
            if (key = contextEscape)
            {
                processNormalKeyDown("escape")
                return
            }
            if (key = contextF12)
            {
                processNormalKeyDown("F12")
                return
            }
            if (key = contextTab)
            {
                processNormalKeyDown("tab")
                return
            }
            if (key = contextEnter)
            {
                processNormalKeyDown("enter")
                return
            }
            if (key = contextBackspace)
            {
                processNormalKeyDown("backspace")
                return
            }
            if (key = contextDelete)
            {
                processNormalKeyDown("delete")
                return
            }
    
            if (key = context1)
            {
                processNormalKeyDown("1")
                return
            }
            if (key = context2)
            {
                processNormalKeyDown("2")
                return
            }
            if (key = context3)
            {
                processNormalKeyDown("3")
                return
            }
    
            if (key = context4)
            {
                processNormalKeyDown("4")
                return
            }
            if (key = context5)
            {
                processNormalKeyDown("5")
                return
            }
            if (key = context6)
            {
                processNormalKeyDown("6")
                return
            }
            if (key = context7)
            {
                processNormalKeyDown("7")
                return
            }
            if (key = context8)
            {
                processNormalKeyDown("8")
                return
            }
            if (key = context9)
            {
                processNormalKeyDown("9")
                return
            }
            if (key = context0)
            {
                processNormalKeyDown("0")
                return
            }
            if (key = contextInsert)
            {
                processNormalKeyDown("insert")
                return
            }
        }
            
        processNormalKeyDown(key)
    }
    
    processKeyUp(key)
    {
        if (key = contextKey)
        {
            manageContextKeyUp(key)
            return
        }
        
        if (key = alternativeCtrlLeft)
        {
            processLeftSideModifierKeyUp("ctrl")
        }
        
        if (key = alternativeShiftLeft)
        {
            processLeftSideModifierKeyUp("shift")
        }
        
        if (key = alternativeAltLeft)
        {
            processLeftSideModifierKeyUp("alt")
        }
        
        if (key = alternativeCtrlRight)
        {
            processRightSideModifierKeyUp("ctrl")
        }
        
        if (key = alternativeShiftRight)
        {
            processRightSideModifierKeyUp("shift")
        }
        
        if (key = alternativeAltRight)
        {
            processRightSideModifierKeyUp("alt")
        }
        
        if (key = alternativeWinRight)
        {
            processRightSideModifierKeyUp("lwin")
        }
        
        if (alternativeLayoutActive)
        {
            if (key = contextLeft)
            {
                processNormalKeyUp("left")
                return
            }
            if (key = contextDown)
            {
                processNormalKeyUp("down")
                return
            }
            if (key = contextRight)
            {
                processNormalKeyUp("right")
                return
            }
            if (key = contextUp)
            {
                processNormalKeyUp("up")
                return
            }
            if (key = contextHome)
            {
                processNormalKeyUp("home")
                return
            }
            if (key = contextEnd)
            {
                processNormalKeyUp("end")
                return
            }
            if (key = contextPgDn)
            {
                processNormalKeyUp("PgDn")
                return
            }
            if (key = contextPgUp)
            {
                processNormalKeyUp("PgUp")
                return
            }
    
            if (key = contextEscape)
            {
                processNormalKeyUp("escape")
                return
            }
            if (key = contextF12)
            {
                processNormalKeyUp("F12")
                return
            }
            if (key = contextTab)
            {
                processNormalKeyUp("tab")
                return
            }
            if (key = contextEnter)
            {
                processNormalKeyUp("enter")
                return
            }
            if (key = contextBackspace)
            {
                processNormalKeyUp("backspace")
                return
            }
            if (key = contextDelete)
            {
                processNormalKeyUp("delete")
                return
            }
    
            if (key = context1)
            {
                processNormalKeyUp("1")
                return
            }
            if (key = context2)
            {
                processNormalKeyUp("2")
                return
            }
            if (key = context3)
            {
                processNormalKeyUp("3")
                return
            }
    
            if (key = context4)
            {
                processNormalKeyUp("4")
                return
            }
            if (key = context5)
            {
                processNormalKeyUp("5")
                return
            }
            if (key = context6)
            {
                processNormalKeyUp("6")
                return
            }
            if (key = context7)
            {
                processNormalKeyUp("7")
                return
            }
            if (key = context8)
            {
                processNormalKeyUp("8")
                return
            }
            if (key = context9)
            {
                processNormalKeyUp("9")
                return
            }
            if (key = context0)
            {
                processNormalKeyUp("0")
                return
            }
            if (key = contextInsert)
            {
                processNormalKeyUp("insert")
                return
            }
        }
        
        processNormalKeyUp(key)
    }
    
    ;-------------------- END OF process key
    
    
    
    
    
    ;-------------------- special context management
    global alternativeLayoutActive
    global sendContextKey
    manageContextKeyDown(key)
    {
        if !alternativeLayoutActive 
        {
            if (treatContextKeyAsRegularKey)
            {
                send {blind}{%key%}
                sendContextKey := false
            }
            else
            {
                modifierKeysAlternativeLayoutActive := true
                alternativeLayoutActive := true
                sendContextKey := true
                SetTimer, TimerTimeoutSendSpecialContextKey, %timeoutStillSendSpecialContextKey%
            }
            ;debug(key . " manageContextKeyDown")
        }
    }
    
    global modifierKeysAlternativeLayoutActive := false
    manageContextKeyUp(key)
    {
        alternativeLayoutActive := false
        SetTimer, TimerTimeoutSendSpecialContextKey, OFF
        if (!treatContextKeyAsRegularKey)
        {
            modifierKeysAlternativeLayoutActive := false
        }
        if (sendContextKey && allowSendContextKey)
        {
            send {blind}{%key%}
        }
        ;debug(key . " manageContextKeyUp")
    }
    
    TimerTimeoutSendSpecialContextKey:
        SetTimer, TimerTimeoutSendSpecialContextKey, OFF
        if GetKeyState(contextKey, "P")
        {    
            sendContextKey := false
            ;debug("timer terminat " . sendContextKey)
        }
    return
    
    global leftCtrlModifierActive := false
    global leftAltModifierActive := false
    global leftShiftModifierActive := false
    global rightCtrlModifierActive := false
    global rightAltModifierActive := false
    global rightShiftModifierActive := false
    global rightWinModifierActive := false
    processLeftSideModifierKeyDown(key)
    {
        sendContextKey := false
        leftModifierGroupFirstPressed := true
        if (key = "ctrl")
        {
            leftCtrlModifierActive := true
        }
        if (key = "alt")
        {
            leftAltModifierActive := true
        }
        if (key = "shift")
        {
            leftShiftModifierActive := true
        }    
    }
    processRightSideModifierKeyDown(key)
    {
        sendContextKey := false
        rightModifierGroupFirstPressed := true
        if (key = "ctrl")
        {
            rightCtrlModifierActive := true
        }
        if (key = "alt")
        {
            rightAltModifierActive := true
        }
        if (key = "shift")
        {
            rightShiftModifierActive := true
        }
        if (key = "lwin")
        {
            rightWinModifierActive := true
        }
    }
    processLeftSideModifierKeyUp(key)
    {
        if (key = "ctrl")
        {
            leftCtrlModifierActive := false
        }
        if (key = "alt")
        {
            leftAltModifierActive := false
            if (altDeepPressed)
            {
                altDeepPressed := false
                send {alt up}
            }
        }
        if (key = "shift")
        {
            leftShiftModifierActive := false
        }
        if (!leftShiftModifierActive && !leftAltModifierActive && !leftCtrlModifierActive)
        {
            leftModifierGroupFirstPressed := false
        }
    }
    processRightSideModifierKeyUp(key)
    {
        if (key = "ctrl")
        {
            rightCtrlModifierActive := false
        }
        if (key = "alt")
        {
            rightAltModifierActive := false
            if (altDeepPressed)
            {
                altDeepPressed := false
                send {alt up}
            }
        }
        if (key = "shift")
        {
            rightShiftModifierActive := false
        }
        if (key = "lwin")
        {
            rightWinModifierActive := false
        }
        if (!rightShiftModifierActive && !rightAltModifierActive && !rightCtrlModifierActive && !rightWinModifierActive)
        {
            rightModifierGroupFirstPressed := false
        }
    }
    ;-------------------- END OF special context management
    
    
    
    
    
    ;-------------------- normal keys
    global treatContextKeyAsRegularKey := false
    processNormalKeyDown(key)
    {
         if (!alternativeLayoutActive)
        {
            treatContextKeyAsRegularKey := true
            SetTimer, TriggerResetTreatContextKeyAsRegularKey, OFF
            SetTimer, TriggerResetTreatContextKeyAsRegularKey, %timeoutResetTreatContextKeyAsRegularKey%
        }
        else
        {
            sendContextKey := false
        }
        activeModifiers := getActiveModifiers(key)
        if (!processAhkKeyboardShortcuts(activeModifiers, key))
        {
            send {blind}%activeModifiers%{%key% down}
            ;debug(key . " processNormalKeyDown")
        }
        
    }
    
    global altDeepPressed := false
    getActiveModifiers(key)
    {
        result = 
        if (leftCtrlModifierActive || rightCtrlModifierActive)
        {
            result .= "^"
        }
        if (leftAltModifierActive || rightAltModifierActive)
        {
            if (key = "tab")
            {
                result .= "{alt downTemp}"
                altDeepPressed := true
            }
            else
            {
                result .= "!"
            }
        }
        if (leftShiftModifierActive || rightShiftModifierActive)
        {
            result .= "+"
        }
        if (rightWinModifierActive)
        {
            result .= "#"
        }
        return result
    }
    
    processNormalKeyUp(key)
    {
        Send {Blind}{%key% Up}
        ;debug(key . " processNormalKeyUp")
    }
    
    TriggerResetTreatContextKeyAsRegularKey:
        SetTimer, TriggerResetTreatContextKeyAsRegularKey, OFF
        treatContextKeyAsRegularKey := false
    return
    ;-------------------- END OF normal keys
    
    
    
    
    ;-------------------- keys that will be processed 
    *space::processKeyDown("space")
    *space up::processKeyUp("space")
    
    *q::processKeyDown("q")	
    *q up::processKeyUp("q")
    
    *w::processKeyDown("w")	
    *w up::processKeyUp("w")
    
    *e::processKeyDown("e")	
    *e up::processKeyUp("e")
    
    *r::processKeyDown("r")	
    *r up::processKeyUp("r")
    
    *t::processKeyDown("t")	
    *t up::processKeyUp("t")
    
    *y::processKeyDown("y")	
    *y up::processKeyUp("y")
    
    *u::processKeyDown("u")	
    *u up::processKeyUp("u")
    
    *i::processKeyDown("i")	
    *i up::processKeyUp("i")
    
    *o::processKeyDown("o")	
    *o up::processKeyUp("o")
    
    *p::processKeyDown("p")	
    *p up::processKeyUp("p")
    
    *[::processKeyDown("[")	
    *[ up::processKeyUp("[")
    
    *]::processKeyDown("]")	
    *] up::processKeyUp("]")
    
    *\::processKeyDown("\")	
    *\ up::processKeyUp("\")
    
    *a::processKeyDown("a")	
    *a up::processKeyUp("a")
    
    *s::processKeyDown("s")	
    *s up::processKeyUp("s")
    
    *d::processKeyDown("d")	
    *d up::processKeyUp("d")
    
    *f::processKeyDown("f")	
    *f up::processKeyUp("f")
    
    *g::processKeyDown("g")	
    *g up::processKeyUp("g")
    
    *h::processKeyDown("h")	
    *h up::processKeyUp("h")
    
    *j::processKeyDown("j")	
    *j up::processKeyUp("j")
    
    *k::processKeyDown("k")	
    *k up::processKeyUp("k")
    
    *l::processKeyDown("l")	
    *l up::processKeyUp("l")
    
    *`;::processKeyDown(";")	
    *`; up::processKeyUp(";")
    
    *'::processKeyDown("'")	
    *' up::processKeyUp("'")
    
    *z::processKeyDown("z")	
    *z up::processKeyUp("z")
    
    *x::processKeyDown("x")	
    *x up::processKeyUp("x")
    
    *c::processKeyDown("c")	
    *c up::processKeyUp("c")
    
    *v::processKeyDown("v")	
    *v up::processKeyUp("v")
    
    *b::processKeyDown("b")	
    *b up::processKeyUp("b")
    
    *n::processKeyDown("n")	
    *n up::processKeyUp("n")
    
    *m::processKeyDown("m")	
    *m up::processKeyUp("m")
    
    *capslock::processKeyDown("capslock")
    *capslock up::processKeyUp("capslock")
    
    *sc033::processKeyDown(",")
    *sc033 up::processKeyUp(",")
    
    *sc034::processKeyDown(".")	
    *sc034 up::processKeyUp(".")
    
    *sc035::processKeyDown("/")	
    *sc035 up::processKeyUp("/")
    
    *tab::processKeyDown("tab")	
    *tab up::processKeyUp("tab")
    
    *appskey::processKeyDown("appskey")
    *appskey up::processKeyUp("appskey")
    
    *printscreen::processKeyDown("printscreen")
    *printscreen up::processKeyUp("printscreen")
    
    *sc029::processKeyDown("``")	
    *sc029 up::processKeyUp("``")
    
    *1::processKeyDown("1")	
    *1 up::processKeyUp("1")
    
    *2::processKeyDown("2")	
    *2 up::processKeyUp("2")
        
    *3::processKeyDown("3")	
    *3 up::processKeyUp("3")
    
    *4::processKeyDown("4")	
    *4 up::processKeyUp("4")
    
    *5::processKeyDown("5")	
    *5 up::processKeyUp("5")
    
    *6::processKeyDown("6")	
    *6 up::processKeyUp("6")
            
    *7::processKeyDown("7")	
    *7 up::processKeyUp("7")
    
    *8::processKeyDown("8")	
    *8 up::processKeyUp("8")
        
    *9::processKeyDown("9")	
    *9 up::processKeyUp("9")
    
    *0::processKeyDown("0")	
    *0 up::processKeyUp("0")
    
    *-::processKeyDown("-")	
    *- up::processKeyUp("-")
    
    *=::processKeyDown("=")	
    *= up::processKeyUp("=")
    
    *f1::processKeyDown("f1")
    *f1 up::processKeyUp("f1")
    
    *f2::processKeyDown("f2")
    *f2 up::processKeyUp("f2")
    
    *f3::processKeyDown("f3")
    *f3 up::processKeyUp("f3")
    
    *f4::processKeyDown("f4")
    *f4 up::processKeyUp("f4")
    
    *f5::processKeyDown("f5")
    *f5 up::processKeyUp("f5")
    
    *f6::processKeyDown("f6")
    *f6 up::processKeyUp("f6")
    
    *f7::processKeyDown("f7")
    *f7 up::processKeyUp("f7")
    
    ;*f8::processKeyDown("f8")
    ;*f8 up::processKeyUp("f8")
    
    *f9::processKeyDown("f9")
    *f9 up::processKeyUp("f9")
    
    *f10::processKeyDown("f10")
    *f10 up::processKeyUp("f10")
    
    *f11::processKeyDown("f11")
    *f11 up::processKeyUp("f11")
    
    *f12::processKeyDown("f12")
    *f12 up::processKeyUp("f12")
    
    *insert::processKeyDown("insert")
    *insert up::processKeyUp("insert")
    ;-------------------- END OF keys that will be processed
#if





;-------------------- Debugging
#if debugComputer
    pgdn::end
    pgup::home
    
    *f8::
    	debugInfo := "rightWinModifierActive=" . rightWinModifierActive . "`n"
    	msgbox, % debugInfo
    return
#if

#SC029::
	if navigationMode = 0
	{
		tooltip SPACE modifier active
		sleep 600
		tooltip
		navigationMode = 1
		return
	}
	
	tooltip off
	sleep 600
	tooltip
	navigationMode = 0
	return
return


#f7::
	tooltip Reloading: keyboard test
	sleep 400
	reload
return

debug(value)
{
    store(value)
}

ToolTip(value)
{
    tooltip, |%value%|
    sleep 300
    tooltip
}


send(value)
{
	send % value
}

store(value)
{
	FormatTime, TimeString
	textToSend = %value%
	FileAppend, %TimeString% - %textToSend%`n,c:\Users\cipri\Desktop\debugKeyboardHack.txt
}
;-------------------- END OF Debugging