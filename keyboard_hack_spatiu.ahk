; nu merge ctrl space delete si da ctrl f in loc de ctrl backspace
; tweak algoritmul de scriu rapid si face diferenta intre context special si programez rapid

#SingleInstance
#Persistent
#MaxHotkeysPerInterval 400
; ^ ctrl	! alt		+ shift		# WindowsKey
; sc033 -> ,
; sc034 -> .
; sc029 -> `
;----------------- CONFIGURATION SECTION
global contextKey := "space"
global timeoutStillSendSpecialContextKey := 201
global timeoutResetSendContextKey := 151
global allowSendContextKey := 1

global contextEnter := "d"
global contextBackspace := "f"
global contextDelete := "s"
global contextTab := "r"
global contextF12 := "e"
global contextEscape := "w"

global contextLeft := "j"
global contextDown := "k"
global contextRight := "l"
global contextUp := "i"
global contextHome := "u"
global contextEnd := "o"
global contextPgUp := "h"
global contextPgDn := ";"

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

global alternativeCtrlLeft := "lalt"
global alternativeShiftLeft := ""
global alternativeAltLeft := "capslock"
global alternativeCtrlRight := ""
global alternativeShiftRight := ""
global alternativeAltRight := ""
;----------------- END OF CONFIGURATION SECTION










global sendSpecialContextKeyOnNormalKeyPress := false
global navigationMode = 1







#If navigationMode  = 1
    ;-------------------- process key
    processKeyDown(key)
    {
        if (key = contextKey)
        {
            manageContextKeyDown(key)
            return
        }
        
        if (key = alternativeCtrlLeft)
        {
            processModifierKeyDown("ctrl")
            return		
        }
        
        if (key = alternativeShiftLeft)
        {
            processModifierKeyDown("shift")
            return
        }
        
        if (key = alternativeAltLeft)
        {
            processModifierKeyDown("alt")
            return
        }
        
        if (key = alternativeCtrlRight)
        {
            processModifierKeyDown("ctrl")
            return
        }
        
        if (key = alternativeShiftRight)
        {
            processModifierKeyDown("shift")
            return
        }
        
        if (key = alternativeAltRight)
        {
            processModifierKeyDown("alt")
            return
        }
        
        if (specialContextActive)
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
            processModifierKeyUp("ctrl")
            return
        }
        
        if (key = alternativeShiftLeft)
        {
            processModifierKeyUp("shift")
            return
        }
        
        if (key = alternativeAltLeft)
        {
            processModifierKeyUp("alt")
            return
        }
        
        if (key = alternativeCtrlRight)
        {
            processModifierKeyUp("ctrl")
            return
        }
        
        if (key = alternativeShiftRight)
        {
            processModifierKeyUp("shift")
            return
        }
        
        if (key = alternativeAltRight)
        {
            processModifierKeyUp("alt")
            return
        }
        
        if (specialContextActive)
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
        }
        
        processNormalKeyUp(key)
    }
    ;-------------------- END OF process key
    
    
    
    
    
    ;-------------------- special context management
    global specialContextActive
    global sendContextKey
    
    manageContextKeyDown(key)
    {
        if !specialContextActive 
        {
            if (sendContextKeyNormal)
            {
                send {blind}{%key%}
                sendContextKey := false
            }
            else
            {
                specialContextActive := true
                sendContextKey := true
                SetTimer, TimerTimeoutSendSpecialContextKey, %timeoutStillSendSpecialContextKey%
            }
            ;show("context key down")
        }
    }
    
    manageContextKeyUp(key)
    {
        specialContextActive := false
        SetTimer, TimerTimeoutSendSpecialContextKey, OFF
        if (sendContextKey && allowSendContextKey)
        {
            send {blind}{%key%}
        }
        ;show(sendContextKey)
    }
    
    TimerTimeoutSendSpecialContextKey:
        SetTimer, TimerTimeoutSendSpecialContextKey, OFF
        if GetKeyState(contextKey, "P")
        {    
            sendContextKey := false
            ;show("timer terminat " . sendContextKey)
        }
    return
    ;-------------------- END OF special context management
    
    
    
    
    
    ;-------------------- normal keys
    global sendContextKeyNormal := false
    processNormalKeyDown(key)
    {
         if (!specialContextActive)
        {
            sendContextKeyNormal := true
        }
        else
        {
            sendContextKey := false
        }
        SetKeyDelay -1
        send {blind}{%key% down}
        ;show("apas normal " . key)
    }
    
    processNormalKeyUp(key)
    {
        if (!specialContextActive)
        {
            SetTimer, TriggerResetSendContextKey, %timeoutResetSendContextKey%
        }
        SetKeyDelay -1
        Send {Blind}{%key% Up}
        ;show("ridic normal " . key)
    }
    
    processModifierKeyDown(key)
    {
        SetKeyDelay -1
        send {%key% down}
        ;show("apas modifier " . key)
    }
    
    processModifierKeyUp(key)
    {
        SetKeyDelay -1
        send {blind}{%key% Up}
        ;show("apas normal " . key)
    }
    
    TriggerResetSendContextKey:
        SetTimer, TriggerResetSendContextKey, OFF
        sendContextKeyNormal := false
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
    
    *lalt::processKeyDown("lalt")
    *lalt up::processKeyUp("lalt")
    
    *ralt::processKeyDown("ralt")
    *ralt up::processKeyUp("ralt")
    
    *capslock::processKeyDown("capslock")
    *capslock up::processKeyUp("capslock")
    
    *lshift::processKeyDown("lshift")
    *lshift up::processKeyUp("lshift")
    
    *rshift::processKeyDown("rshift")
    *rshift up::processKeyUp("rshift")
    
    *lctrl::processKeyDown("lctrl")
    *lctrl up::processKeyUp("lctrl")
    
    *rctrl::processKeyDown("rctrl")
    *rctrl up::processKeyUp("rctrl")
    
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
    
    *f8::processKeyDown("f8")
    *f8 up::processKeyUp("f8")
    
    *f9::processKeyDown("f9")
    *f9 up::processKeyUp("f9")
    
    *f10::processKeyDown("f10")
    *f10 up::processKeyUp("f10")
    ;-------------------- END OF keys that will be processed
#if





;-------------------- Debugging
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

show(value)
{
	tooltip, |%value%|
	sleep 300
	tooltip
}


*f12::
	textToDisplay := "canActivateSpecialContext " . canActivateSpecialContext . "`n" . "modifiersFirstActivatedLeft " . modifiersFirstActivatedLeft . "`n" . "modifiersFirstActivatedRight " . modifiersFirstActivatedRight . "`n" . "specialContextModifierActive " . specialContextModifierActive . "`n" . "specialContextModifierActive " . specialContextModifierActive . "`n"
	msgBox % textToDisplay
return


send(value)
{
	send % value
}

store(value)
{
	FormatTime, TimeString
	FileAppend, %TimeString% - %value%`n,c:\Users\cipri\Desktop\debugKeyboardHack.txt
}
;-------------------- END OF Debugging