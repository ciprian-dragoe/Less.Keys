#SingleInstance
#Persistent
#MaxHotkeysPerInterval 400
; ^ ctrl	! alt		+ shift		# WindowsKey
global debugComputer
global navigationMode = 1
global activePressedKeys = []
global timeoutStillSendLayoutKey

global timeoutProcessLayoutOnRelease
global processLayoutOnRelease
global processKeyOnRelease

global alternativeLayout
global layoutChangeKey
global layoutKeyPressed
global alternativeLayoutActive
global modifierKeysAlternativeLayoutActive
global sendLayoutKey
global stopManagingLayoutKey
global lastAlternativeLayoutProcessedKey

global debugStoredData := ""



readLayoutFile("alternative-layout.cfg")
readTimingsFile("timings.cfg")

readLayoutFile(path)
{
    FileReadLine, layoutChangeKey, %path%, 1
    layoutChangeKey := StrSplit(layoutChangeKey, "`:").2 
    alternativeLayout:=Object()
    Loop, read, %path%
    {
        IfInString, A_LoopReadLine, ### ;if line has ### in it, is a comment and skip
        { 
            continue
        }
        alternativeLayout[StrSplit(A_LoopReadLine, "`:").1] :=StrSplit(A_LoopReadLine, "`:").2  
    }
}

readTimingsFile(path)
{
    IniRead, timeoutStillSendLayoutKey, %path%, timings, timeoutStillSendLayoutKey
    IniRead, timeoutProcessLayoutOnRelease, %path%, timings, timeoutProcessLayoutOnRelease
}


SetKeyDelay -1
global ast := { "ceva":1, "altceva":"dsf"}
global nou:= "ceva"
;if (ast[nou])
;msgbox % "valoarea este " ast.altceva





if (A_ComputerName = "lenovo-x230" || "CIPI-ASUS-ROG") 
{
	debugComputer := true
	FileDelete, c:\Users\cipri\Desktop\debugKeyboardHack.txt
}



#if debugComputer
    pgdn::end
    pgup::home    
    	
    *f9::
    	debugInfo := "leftModifierGroupPressed=" . leftModifierGroupPressed . "`n" . "leftCtrlModifierActive=" . leftCtrlModifierActive . "`n" . "leftAltModifierActive=" . leftAltModifierActive . "`n" . "leftShiftModifierActive=" . leftShiftModifierActive . "`n" . "`n" . "rightModifierGroupPressed=" . rightModifierGroupPressed . "`n" . "rightCtrlModifierActive=" . rightCtrlModifierActive . "`n" . "rightAltModifierActive=" . rightAltModifierActive . "`n" . "rightShiftModifierActive=" . rightShiftModifierActive . "`n" . "rightWinModifierActive=" . rightWinModifierActive
    	
        fixStickyKeys()
        ;msgbox, % debugInfo
        
        FileDelete, c:\Users\cipri\Desktop\debugKeyboardHack.txt
        FileAppend, %debugStoredData%,c:\Users\cipri\Desktop\debugKeyboardHack.txt
        debugStoredData := ""
    return
#if



#If navigationMode = 1
    ;-------------------- keys that will be processed 
    *escape::processKeyDown("escape")
    *escape up::processKeyUp("escape")
    
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
    
    ;*f9::processKeyDown("f9")
    ;*f9 up::processKeyUp("f9")
    
    *f10::processKeyDown("f10")
    *f10 up::processKeyUp("f10")
    
    *f11::processKeyDown("f11")
    *f11 up::processKeyUp("f11")
    
    *f12::processKeyDown("f12")
    *f12 up::processKeyUp("f12")
    
    *home::processKeyDown("home")
    *home up::processKeyUp("home")
            
    *end::processKeyDown("end")
    *end up::processKeyUp("end")
        
    *insert::processKeyDown("insert")
    *insert up::processKeyUp("insert")
            
    *delete::processKeyDown("delete")
    *delete up::processKeyUp("delete")
        
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
            
    *backspace::processKeyDown("backspace")
    *backspace up::processKeyUp("backspace")
        
    *tab::processKeyDown("tab")
    *tab up::processKeyUp("tab")
    
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
            
    *capslock::processKeyDown("capslock")
    *capslock up::processKeyUp("capslock")
    
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
        
    *enter::processKeyDown("enter")
    *enter up::processKeyUp("enter")
            
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
    
    *sc033::processKeyDown(",")
    *sc033 up::processKeyUp(",")
    
    *sc034::processKeyDown(".")	
    *sc034 up::processKeyUp(".")
    
    *sc035::processKeyDown("/")	
    *sc035 up::processKeyUp("/")
    
    *space::processKeyDown("space")
    *space up::processKeyUp("space")
    
    *appskey::processKeyDown("appskey")
    *appskey up::processKeyUp("appskey")
    
    *printscreen::processKeyDown("printscreen")
    *printscreen up::processKeyUp("printscreen")
    
    *left::processKeyDown("left")
    *left up::processKeyUp("left")
    
    *down::processKeyDown("down")
    *down up::processKeyUp("down")
    
    *right::processKeyDown("right")
    *right up::processKeyUp("right")
    
    *up::processKeyDown("up")
    *up up::processKeyUp("up")
    
    *pgdn::processKeyDown("pgdn")
    *pgdn up::processKeyUp("pgdn")
    
    *pgup::processKeyDown("pgup")
    *pgup up::processKeyUp("pgup")
    ;-------------------- END OF keys that will be processed
#if



processKeyDown(key)
{
    debug(key . " |down")    
    if (key = layoutChangeKey)
    {
        manageLayoutKeyDown(key)
        return
    }
    
    if (!processKeyOnRelease)
    {
        if (alternativeLayoutActive)
        {
            lastAlternativeLayoutProcessedKey := key
            key := alternativeLayout[key]
            sendLayoutKey := false
            send {blind}{%key% down}
            return
        }
        
        if (key != lastAlternativeLayoutProcessedKey)
        {
            addToActivePressedKeys(key)
            send {blind}{%key% down}
        }
    }
}



addToActivePressedKeys(key)
{
    if (activePressedKeys.Length() < 0)
    {
        activePressedKeys.Push(key)
    }
    else 
    {
        itemNotPresent := true
        For index, value in activePressedKeys
        {
            if (value = key)
                itemNotPresent := false
        }
        if (itemNotPresent)
            activePressedKeys.Push(key)
    }
}



manageLayoutKeyDown(key)
{
    layoutKeyPressed := true
    if (!stopManagingLayoutKey)
    {
        if (activePressedKeys.Length() > 0)
        {
            send {blind}{%key%}
            ;debug("real space" . " sent on key down")
            sendLayoutKey := false
            stopManagingLayoutKey := true
        }
        else
        {
            ;debug("specialKey" . " down")
            stopManagingLayoutKey := true
            modifierKeysAlternativeLayoutActive := true
            alternativeLayoutActive := true
            sendLayoutKey := true
            if (processLayoutOnRelease)
            {
                processKeyOnRelease := true
            }
            SetTimer, TimerTimeoutSendLayoutKey, OFF
            SetTimer, TimerTimeoutSendLayoutKey, %timeoutStillSendLayoutKey%
        }
    }
}

manageLayoutKeyUp(key)
{
    stopManagingLayoutKey := false
    layoutKeyPressed := false
    alternativeLayoutActive := false
    modifierKeysAlternativeLayoutActive := false
    processLayoutOnRelease := false
    processKeyOnRelease := false
    SetTimer, TimerTimeoutSendLayoutKey, OFF
    
    if (sendLayoutKey)
    {
        send {blind}{%key%}
        ;debug("specialKey as space sent on key" . " up")
        return
    }
    ;debug("specialKey" . " up")
}

TimerTimeoutSendLayoutKey:
    SetTimer, TimerTimeoutSendLayoutKey, OFF
    if (layoutKeyPressed)
    {    
        sendLayoutKey := false
        ;debug("timer terminat")
    }
return



processKeyUp(key) 
{
    if (key = layoutChangeKey)
    {
        manageLayoutKeyUp(key)
        return
    }
    
    if (processKeyOnRelease)
    {
        processKeyOnRelease := false
        sendLayoutKey := false
        if (alternativeLayoutActive)
        {
            key := alternativeLayout[key]
            send {blind}{%key% down}
            return
        }
        send {blind}{%layoutChangeKey%}
        send {blind}{%key%}
        return
    }
    
    if (key = lastAlternativeLayoutProcessedKey)
    {
        lastAlternativeLayoutProcessedKey := ""
    }    
    removeFromActivePressedKeys(key)
    processLayoutOnRelease := true        
    SetTimer, TimerProcessLayoutOnRelease, OFF
    SetTimer, TimerProcessLayoutOnRelease, %timeoutProcessLayoutOnRelease%
    send {Blind}{%key% Up}
}

removeFromActivePressedKeys(key)
{
    For index, value in activePressedKeys
    {
        if (value = key)
            activePressedKeys.Remove(index)
    }
}

TimerProcessLayoutOnRelease:
    processLayoutOnRelease := false
    processKeyOnRelease := false
    SetTimer, TimerProcessLayoutOnRelease, OFF
return



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



debug(value)
{
    ;msgbox % value
    writeMemoryStream(value)
}



fixStickyKeys()
{
    send {shift up}{alt up}{ctrl up}{lwin up}
}



showToolTip(value)
{
    tooltip, |%value%|
    sleep 1800
    tooltip
}



send(value)
{
	send % value
}



store(value)
{
    keyPressCount := activePressedKeys.Length()
	textToSend = %value% |contextKeyPressed=%contextKeyPressed%| - |alternativeLayoutActive=%alternativeLayoutActive%| |activePressedKeys=%keyPressCount%|
	FileAppend, %A_Hour%:%A_Min%:%A_Sec% (%A_MSec%) - %textToSend%`n,c:\Users\cipri\Desktop\debugKeyboardHack.txt
}




writeMemoryStream(value)
{
    keyPressCount := activePressedKeys.Length()
	textToSend = %A_Hour%:%A_Min%:%A_Sec% (%A_MSec%) - %value% |layoutKeyPressed=%layoutKeyPressed%| - |alternativeLayoutActive=%alternativeLayoutActive%| |activePressedKeys=%keyPressCount%|`n
    debugStoredData .= textToSend 
}
;-------------------- END OF Debugging
