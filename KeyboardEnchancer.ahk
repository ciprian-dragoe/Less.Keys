#SingleInstance
#Persistent
#MaxHotkeysPerInterval 400

global timeoutStillSendLayoutKey
global timeoutProcessLayoutOnRelease
global timeoutTimeoutSendModifierOnUp

global activePressedKeys = []
global processLayoutOnRelease
global processKeyOnRelease

global alternativeLayout

global layoutChangeKey
global layoutKeyPressed
global alternativeLayoutActive
global sendLayoutKey
global sendModifierOnUp
global stopManagingLayoutKey
global keyToSendOnUp
global lastAlternativeProcessedKey

global leftModifierGroupPressed
global leftCtrlAlternativeKey
global leftAltAlternativeKey
global leftShiftAlternativeKey
global leftWinAlternativeKey
global leftCtrlActive
global leftAltActive
global leftShiftActive
global leftWinActive

global rightModifierGroupPressed
global rightCtrlAlternativeKey
global rightAltAlternativeKey
global rightShiftAlternativeKey
global rightWinAlternativeKey
global rightAltActive
global rightShiftActive
global rightCtrlActive
global rightWinActive

global altDeepPressed
global ctrlDeepPressed

global debugStoredData := ""
global debugComputer := false
global navigationMode = 1

global keyboardShortcuts

SetKeyDelay -1





readLayoutFile("configure-alternative-layout.cfg")
readTimingsFile("configure-timings.cfg")
readKeyboardShortcutsFile("configure-keyboard-shortcuts.cfg")





;-------------------- DEBUGGING
if (A_ComputerName = "lenovo-x230" || A_ComputerName = "CIPI-ASUS-ROG") 
{
	debugComputer := true
	FileDelete, c:\Users\cipri\Desktop\debugKeyboardHack.txt
	readLayoutFile("my-alternative-layout.cfg")
    readTimingsFile("my-timings.cfg")
    readKeyboardShortcutsFile("my-keyboard-shortcuts.cfg")
}

#if debugComputer
    pgdn::end
    pgup::home    
    	
    f8::
    	debugInfo := "leftModifierGroupPressed=" . leftModifierGroupPressed . "`n" . "leftCtrlModifierActive=" . leftCtrlModifierActive . "`n" . "leftAltModifierActive=" . leftAltModifierActive . "`n" . "leftShiftModifierActive=" . leftShiftModifierActive . "`n" . "`n" . "rightModifierGroupPressed=" . rightModifierGroupPressed . "`n" . "rightCtrlModifierActive=" . rightCtrlModifierActive . "`n" . "rightAltModifierActive=" . rightAltModifierActive . "`n" . "rightShiftModifierActive=" . rightShiftModifierActive . "`n" . "rightWinModifierActive=" . rightWinModifierActive
        fixStickyKeys()
        showToolTip("DEBUG FILES STORED")
        
        FileDelete, c:\Users\cipri\Desktop\debugKeyboardHack.txt
        FileAppend, %debugStoredData%,c:\Users\cipri\Desktop\debugKeyboardHack.txt
        debugStoredData := ""
    return
    
    F7::
    	if navigationMode = 0
    	{
    	    showToolTip("alternative layout active")
    		navigationMode = 1
    		return
    	}
    	
    	showToolTip("alternative layout off")
    	navigationMode = 0
    	return
    return
    
    #f7::
        showToolTip("RELOADING FILE")
    	reload
    return
#if

debug(value)
{
    if (debugComputer)
        writeMemoryStream(value)
}

fixStickyKeys()
{
    send {shift up}{alt up}{ctrl up}{lwin up}
}

showToolTip(value)
{
    tooltip, |%value%|
    sleep 800
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
	textToSend = %A_Hour%:%A_Min%:%A_Sec%:(%A_MSec%)|%value%|layoutKeyPressed=%layoutKeyPressed%|alternativeLayoutActive=%alternativeLayoutActive%|activePressedKeys=%keyPressCount%|processKeyOnRelease=%processKeyOnRelease%|keyToSendOnUp=%keyToSendOnUp%|`n
    debugStoredData .= textToSend 
}
;-------------------- DEBUGGING





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
    if (key = layoutChangeKey)
    {
        manageLayoutKeyDown(key)
        return
    }
    
    if (leftModifierGroupPressed && setLeftModifierKeyState(key, true))
    {
        return
    }
    if (rightModifierGroupPressed && setRightModifierKeyState(key, true))
    {
        return
    }
    
    if (alternativeLayoutActive)
    {
        if (setLeftModifierKeyState(key, true))
        {
            leftModifierGroupPressed := true
            if (processKeyOnRelease)
            {
                processKeyOnRelease := false
                keyToSendOnUp := key
                SetTimer, TimerTimeoutSendModifierOnUp, OFF
                SetTimer, TimerTimeoutSendModifierOnUp, %timeoutTimeoutSendModifierOnUp%
                debug(key . " |modifier on up")
            }
            else
            {
                sendLayoutKey := false
            }
            return
        }
        if (setRightModifierKeyState(key, true))
        {
            rightModifierGroupPressed := true
            if (processKeyOnRelease)
            {
                processKeyOnRelease := false
                keyToSendOnUp := key
                SetTimer, TimerTimeoutSendModifierOnUp, OFF
                SetTimer, TimerTimeoutSendModifierOnUp, %timeoutTimeoutSendModifierOnUp%                
                debug(key . " |modifier on up")
            }
            else
            {
                sendLayoutKey := false
            }
            return
        }
    }
    
    if (!processKeyOnRelease)
    {
        if (alternativeLayoutActive)
        {
            lastAlternativeProcessedKey := key
            key := alternativeLayout[key]
            sendLayoutKey := false
            activeModifiers := getActiveModifiers(key)
            if (!processAhkKeyboardShortcuts(activeModifiers, key))
            {
                send {blind}%activeModifiers%{%key% down}
                debug(key . " |layout active down ")
            }
            return
        }
        
        if (key != lastAlternativeProcessedKey)
        {
            addToActivePressedKeys(key)
            activeModifiers := getActiveModifiers(key)
            if (!processAhkKeyboardShortcuts(activeModifiers, key))
            {
                send {blind}%activeModifiers%{%key% down}
                debug(key . " |normal down ")
            }
            return
        }
        
        return
    }
    
    keyToSendOnUp := key
    debug(key . " |not processed")
}

TimerTimeoutSendModifierOnUp:
    SetTimer, TimerTimeoutSendModifierOnUp, OFF
    keyToSendOnUp := ""
return

getActiveModifiers(key)
{
    result = 
    if (leftCtrlActive || rightCtrlActive)
    {
        if (key = "tab")
        {
            result .= "{ctrl downTemp}"
            ctrlDeepPressed := true
        }
        else
        {
            result .= "^"
        }
    }
    if (leftAltActive || rightAltActive)
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
    if (leftShiftActive || rightShiftActive)
    {
        result .= "+"
    }
    if (leftWinActive || rightWinActive)
    {
        result .= "#"
    }
    
    return result
}

setLeftModifierKeyState(key, state)
{
    if (key = leftCtrlAlternativeKey)
    {
        leftCtrlActive := state
        if (!state && ctrlDeepPressed)
        {
            ctrlDeepPressed := false
            send {ctrl up}
        }
        return true
    }
    if (key = leftAltAlternativeKey)
    {
        leftAltActive := state
        if (!state && altDeepPressed)
        {
            altDeepPressed := false
            send {alt up}
        }
        return true
    }
    if (key = leftShiftAlternativeKey)
    {
        leftShiftActive := state
        return true
    }
    if (key = leftWinAlternativeKey)
    {
        leftWinActive := state
        return true
    } 
    return false
}

setRightModifierKeyState(key, state)
{
    if (key = RightCtrlAlternativeKey)
    {
        rightCtrlActive := state
        if (!state && ctrlDeepPressed)
        {
            ctrlDeepPressed := false
            send {ctrl up}
        }
        return true
    }
    if (key = RightAltAlternativeKey)
    {
        rightAltActive := state
        if (!state && altDeepPressed)
        {
            altDeepPressed := false
            send {alt up}
        }
        return true
    }
    if (key = RightShiftAlternativeKey)
    {
        rightShiftActive := state
        return true
    }
    if (key = RightWinAlternativeKey)
    {
        rightWinActive := state
        return true
    } 
    return false
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



4manageLayoutKeyDown(key)
{
    layoutKeyPressed := true
    if (!stopManagingLayoutKey)
    {
        if (activePressedKeys.Length() > 0)
        {
            send {blind}{%key%}
            sendLayoutKey := false
            stopManagingLayoutKey := true
            debug(key . " |sent special condition ")
        }
        else
        {
            ;debug("specialKey" . " down")
            stopManagingLayoutKey := true
            alternativeLayoutActive := true
            sendLayoutKey := true
            if (processLayoutOnRelease)
            {
                processKeyOnRelease := true
            }
            SetTimer, TimerTimeoutSendLayoutKey, OFF
            SetTimer, TimerTimeoutSendLayoutKey, %timeoutStillSendLayoutKey%
            debug(key . " |processing")
        }
    }
}

TimerTimeoutSendLayoutKey:
    SetTimer, TimerTimeoutSendLayoutKey, OFF
    if (processKeyOnRelease && keyToSendOnUp != "")
    {
        processKeyOnRelease := false
        key := alternativeLayout[keyToSendOnUp]
        send {blind}{%key% down}
        keyToSendOnUp := ""
        debug(key . " |space timer over")
    }
    if (layoutKeyPressed)
    {    
        sendLayoutKey := false
    }
return

manageLayoutKeyUp(key)
{
    debug(key . " |processing space up")
    stopManagingLayoutKey := false
    layoutKeyPressed := false
    alternativeLayoutActive := false
    SetTimer, TimerTimeoutSendLayoutKey, OFF
    
    if (sendLayoutKey)
    {
        send {blind}{%key%}
        debug(key . " |sent on up")
    }
    
    if (processKeyOnRelease && keyToSendOnUp != "")
    {
        send {blind}{%keyToSendOnUp% down}
        keyToSendOnUp := ""
        debug(keyToSendOnUp . " |on space release")
    }
    
    processKeyOnRelease := false
}

processKeyUp(key) 
{
    if (key = lastAlternativeProcessedKey)
    {
        lastAlternativeProcessedKey := ""
    }
    
    if (keyToSendOnUp)
    {
        if (alternativeLayoutActive)
        {
            keyToSend := alternativeLayout[keyToSendOnUp]
            send {blind}{%keyToSend% down}
            debug(keyToSend . "alternative on up sent")
        }
        else
        {
            send {blind}{%keyToSendOnUp%}
            debug(keyToSendOnUp . "on up sent")
        }
        keyToSendOnUp := ""
    }
     
    if (key = layoutChangeKey)
    {
        manageLayoutKeyUp(key)
        return
    }
    
    if (setLeftModifierKeyState(key, false))
    {
        if (leftModifierGroupPressed && !leftCtrlActive && !leftAltActive && !leftShiftActive && !leftWinActive)
        {
            leftModifierGroupPressed := false
        }
    }
    
    if (setRightModifierKeyState(key, false))
    {
        if (rightModifierGroupPressed && !rightCtrlActive && !rightAltActive && !rightShiftActive && !rightWinActive)
        {
            rightModifierGroupPressed := false
        }
    }
       
    removeFromActivePressedKeys(key)
    if (activePressedKeys.Length() = 0)
    {
        processLayoutOnRelease := true        
        SetTimer, TimerProcessLayoutOnRelease, OFF
        SetTimer, TimerProcessLayoutOnRelease, %timeoutProcessLayoutOnRelease%
    }
    send {Blind}{%key% Up}
    debug(key . " |up")
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
    SetTimer, TimerProcessLayoutOnRelease, OFF
return

processAhkKeyboardShortcuts(activeModifiers, key)
{
    combination := activeModifiers . key    
    action := keyboardShortcuts[combination]
    if (action)
    {
        run %action%
        return true
    }
    
    return false
}



;-------------------- READ SETTING FILES
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
        remappedKey := StrSplit(A_LoopReadLine, "`:").2
        if (remappedKey = "lctrl")
        {
            leftCtrlAlternativeKey := StrSplit(A_LoopReadLine, "`:").1
        }
        else if (remappedKey = "rctrl")
        {
            rightCtrlAlternativeKey := StrSplit(A_LoopReadLine, "`:").1
        } 
        else if (remappedKey = "lalt")
        {
            leftAltAlternativeKey := StrSplit(A_LoopReadLine, "`:").1
        }
        else if (remappedKey = "ralt")
        {
            rightAltAlternativeKey := StrSplit(A_LoopReadLine, "`:").1
        }
        else if (remappedKey = "lshift")
        {
            leftShiftAlternativeKey := StrSplit(A_LoopReadLine, "`:").1
        }
        else if (remappedKey = "rshift")
        {
            rightShiftAlternativeKey := StrSplit(A_LoopReadLine, "`:").1
        }
        else if (remappedKey = "lwin")
        {
            leftWinAlternativeKey := StrSplit(A_LoopReadLine, "`:").1
        }
        else if (remappedKey = "rwin")
        {
            rightWinAlternativeKey := StrSplit(A_LoopReadLine, "`:").1
        }
        else
        {
            alternativeLayout[StrSplit(A_LoopReadLine, "`:").1] := remappedKey
        }
    }
}

readKeyboardShortcutsFile(path)
{
    keyboardShortcuts:=Object()
    Loop, read, %path%
    {
        IfInString, A_LoopReadLine, ### ;if line has ### in it, is a comment and skip
        { 
            continue
        }
        action := StrSplit(A_LoopReadLine, "`:").2
        keyboardShortcuts[StrSplit(A_LoopReadLine, "`:").1] := action
    }
}

readTimingsFile(path)
{
    IniRead, timeoutStillSendLayoutKey, %path%, timings, timeoutStillSendLayoutKey
    IniRead, timeoutProcessLayoutOnRelease, %path%, timings, timeoutProcessLayoutOnRelease
    IniRead, timeoutTimeoutSendModifierOnUp, %path%, timings, timeoutTimeoutSendModifierOnUp
}
;-------------------- READ SETTING FILES