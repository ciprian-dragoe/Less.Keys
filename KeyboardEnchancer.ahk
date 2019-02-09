#SingleInstance
#Persistent
#MaxHotkeysPerInterval 400
SetKeyDelay -1
;----------------------------------- CONFIGURATION SECTION -----------------------------------
global DebugComputer1 := "lenovo-x230"
global DebugComputer2 := "SURFACE-STUDIO"
global DebugComputer3 := "CIPI-ASUS-ROG"
;----------------------------------- END OF CONFIGURATION SECTION -----------------------------------

global timeoutStillSendLayoutKey
global timeoutProcessLayoutOnRelease
global logInput

global alternativeLayout
global modifierKeys

global debugStoredData := ""
global debugComputer := false
global navigationMode = 1
global keyboardShortcuts

global activePressedKeys := []
global processKeyOnRelease
global layoutChangeKey
global layoutKeyPressed
global alternativeLayoutActive
global sendLayoutKey
global stopManagingLayoutKey
global keyToSendOnUp
global layoutKeyActivatesProcessKeyOnRelease
global lastKeyProcessedAsAlternative

global ctrlActive
global altActive
global shiftActive
global winActive

if (A_ComputerName = DebugComputer1) {
	debugComputer := true
    readLayoutFile("my-alternative-layout.cfg")
    readTimingsFile("my-settings.cfg")
    readKeyboardShortcutsFile("my-keyboard-shortcuts.cfg")
    resetStates()	
} else if (A_ComputerName = DebugComputer2) {
	debugComputer := true
    readLayoutFile("my-alternative-layout.cfg")
    readTimingsFile("my-settings.cfg")
    readKeyboardShortcutsFile("my-keyboard-shortcuts.cfg")
    resetStates()
} else if (A_ComputerName = DebugComputer3){
	debugComputer := true
    readLayoutFile("my-alternative-layout.cfg")
    readTimingsFile("my-settings.cfg")
    readKeyboardShortcutsFile("my-keyboard-shortcuts.cfg")
    resetStates()
} else {
    readLayoutFile("configure-alternative-layout.cfg")
    readTimingsFile("configure-settings.cfg")
    readKeyboardShortcutsFile("configure-keyboard-shortcuts.cfg")
}


; if the cpu is executing intensive tasks then the lift key up command may not be processed for 
; modifier keys (ctrl, shift, alt, win) and they are still registered by the os as pressed.
; this is a fail safe for such situations
SetTimer, FixStickyKeys, 1000
FixStickyKeys: 
    resetKeys = 1
    for key in modifierKeys
    {
        if (GetKeyState(key, "P")) 
        {
            resetKeys = 0
            break
        }
    }
    
    if (resetKeys) 
    {
        ctrlActive := false
        send {ctrl up}
        shiftActive := false
        send {shift up}
        altActive := false
        send {alt up}
        winActive := false
        send {lwin up}
    }
    
    if (!GetKeyState(layoutChangeKey, "P"))
    {
        layoutKeyPressed := false
        alternativeLayoutActive := false
        stopManagingLayoutKey := false
    }
return

processKeyDown(key)
{
    if (processModifierKey(key, 1))
    {
        return
    }
    
    if (key = layoutChangeKey)
    {
        manageLayoutKeyDown(key)
        return
    }
    
    processNormalKeydown(key)
}

processNormalKeyDown(key)
{
    if (processKeyOnRelease)
    {
        keyToSendOnUp := key
        debug(key . "|>>>>>> will be processed on release")
    }
    else
    {   
        if (alternativeLayoutActive)
        {
            lastKeyProcessedAsAlternative := key
            key := alternativeLayout[key]
            sendLayoutKey := false
            processKeyToSend(key)
            debug(key . "|------ key down with alternative layout")
            
            return
        }
        
        if (key != lastKeyProcessedAsAlternative)
        {
            addToActivePressedKeys(key)
            processKeyToSend(key)
            debug(key . "|key down")
        }
    }
}

processKeyToSend(key)
{
    activeModifiers := getActiveModifiers(key)
    if (!processAhkKeyboardShortcuts(activeModifiers, key))
    {
        send {blind}%activeModifiers%{%key% downR}
    }
}

processModifierKey(key, state)
{
    pressedState := state ? "downR" : "up"
    modifierKey := modifierKeys[key]
    if (modifierKey) { 
        if (modifierKey == "ctrl") {
            send {ctrl %pressedState%}
            ctrlActive := state
        } else if (modifierKey == "alt") {
            send {alt %pressedState%}
            altActive := state
        } else if (modifierKey == "shift") {
            send {shift %pressedState%}
            shiftActive := state
        } else if (modifierKey == "lwin") {       
            send {lwin %pressedState%}
            winActive := state
        }
        
        return true
    }
}

getActiveModifiers(key)
{
    result = 
    if (ctrlActive)
    {
        result .= "^"
    }
    if (altActive)
    {
        result .= "!"
    }
    if (shiftActive)
    {
        result .= "+"
    }
    if (winActive)
    {
        result .= "#"
    }

    return result
}

addToActivePressedKeys(key)
{
    if (activePressedKeys.Length() = 0)
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
            sendLayoutKey := false
            stopManagingLayoutKey := true
            debug(key . "|because other keys pressed")
        }
        else
        {
            stopManagingLayoutKey := true
            alternativeLayoutActive := true
            sendLayoutKey := true
            SetTimer, TimerTimeoutSendLayoutKey, OFF
            SetTimer, TimerTimeoutSendLayoutKey, %timeoutStillSendLayoutKey%
            if (layoutKeyActivatesProcessKeyOnRelease)
            {
                processKeyOnRelease := true
            }
            debug(key . "|activates alternative layout")
        }
    }
}

TimerTimeoutSendLayoutKey:
    SetTimer, TimerTimeoutSendLayoutKey, OFF
    sendLayoutKey := false
    if (keyToSendOnUp)
    {
        key := alternativeLayout[keyToSendOnUp]
        processKeyToSend(key)
        processKeyOnRelease := false
        layoutKeyActivatesProcessKeyOnRelease := false
        keyToSendOnUp := ""
        debug(key . "|---*** on alternative layout hard pressed and send key on up")            
    }
return

manageLayoutKeyUp(key)
{
    SetTimer, TimerTimeoutSendLayoutKey, OFF
    stopManagingLayoutKey := false
    layoutKeyPressed := false
    alternativeLayoutActive := false
    processKeyOnRelease := false
    layoutKeyActivatesProcessKeyOnRelease := false
     
    if (sendLayoutKey)
    {   
        activeModifiers := getActiveModifiers(key)
        if (!processAhkKeyboardShortcuts(activeModifiers, key))
        {
            send {blind}%activeModifiers%{%key%}
        }
        debug(key . "|UP")
        
        if (keyToSendOnUp)
        {
            processKeyToSend(keyToSendOnUp)
            keyToSendOnUp := ""
            debug(keyToSendOnUp . "|^^^^^^ on alternative layout released before")
        }
        
        return
    }
    
    debug(key . "|NOT SENT CAUSE CONSUMED")
}

processKeyUp(key) 
{
    if (processModifierKey(key, 0))
    {
        return
    }
    
    if (key = layoutChangeKey)
    {
        manageLayoutKeyUp(key)
        return
    }
    
    if (keyToSendOnUp)
    {
        key := alternativeLayout[keyToSendOnUp]
        processKeyToSend(key)
        processKeyOnRelease := false
        layoutKeyActivatesProcessKeyOnRelease := false
        keyToSendOnUp := ""
        sendLayoutKey := false        
        debug(key . "|***^^^ key up & process release")        
    }
    else
    {
        if (key = lastKeyProcessedAsAlternative)
        {
            lastKeyProcessedAsAlternative := ""
        }
        
        removeFromActivePressedKeys(key)
        send {Blind}{%key% Up}
        
        if (activePressedKeys.Length() = 0 && !alternativeLayoutActive)
        {
            layoutKeyActivatesProcessKeyOnRelease := true
            SetTimer, TimerProcessLayoutOnRelease, OFF
            SetTimer, TimerProcessLayoutOnRelease, %timeoutProcessLayoutOnRelease%
        }
        
         debug(key . "|up")
    }
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
    SetTimer, TimerProcessLayoutOnRelease, OFF
    layoutKeyActivatesProcessKeyOnRelease := false 
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





;-------------------- READ SETTING FILES --------------------
readLayoutFile(path)
{
    FileReadLine, layoutChangeKey, %path%, 1
    layoutChangeKey := StrSplit(layoutChangeKey, "`:").2 
    alternativeLayout:=Object()
    modifierKeys:=Object()
    Loop, read, %path%
    {
        IfInString, A_LoopReadLine, ### ;if line has ### in it, is a comment and skip
        { 
            continue
        }
        remappedKey := StrSplit(A_LoopReadLine, "`:").2
        
        if (remappedKey = "ctrl")
        {
            modifierKeys[StrSplit(A_LoopReadLine, "`:").1] := "ctrl"
        } 
        else if (remappedKey = "alt")
        {
            modifierKeys[StrSplit(A_LoopReadLine, "`:").1] := "alt"
        }
        else if (remappedKey = "shift")
        {
            modifierKeys[StrSplit(A_LoopReadLine, "`:").1] := "shift"
        }
        else if (remappedKey = "lwin")
        {
            modifierKeys[StrSplit(A_LoopReadLine, "`:").1] := "lwin"
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
    IniRead, logInput, %path%, logging, logInput
}
;-------------------- END OF READ SETTING FILES --------------------





;-------------------- DEBUGGING --------------------
processDebugData()
{
    showToolTip("DEBUG FILES STORED")
    FileDelete, %A_Desktop%\debugKeyboardHack.txt
    msgbox % debugStoredData
    FileAppend, %debugStoredData%, %A_Desktop%\debugKeyboardHack.txt
    resetStates()
}

resetStates()
{
    send {lwin up}{ctrl up}{alt up}{shift up}
    activePressedKeys := []
    processKeyOnRelease := false
    layoutKeyPressed := false
    alternativeLayoutActive := false 
    sendLayoutKey := false
    stopManagingLayoutKey :=false 
    keyToSendOnUp := ""
    lastKeyProcessedAsAlternative := ""
    ctrlActive := false
    altActive := false
    shiftActive := false
    winActive := false
}

debug(value)
{
    if (logInput)
        writeMemoryStream(value)
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

writeMemoryStream(value)
{
    keyPressNr := activePressedKeys.Length()
	textToSend = %A_Hour%:%A_Min%:%A_Sec%:%A_MSec%|%value%|layoutPressed=%layoutKeyPressed%|alternativeLayout=%alternativeLayoutActive%|PressedKeysNr=%keyPressNr%|ProcessKeyOnRelease=%processKeyOnRelease%|keyToSendOnUp=%keyToSendOnUp%|`n
    debugStoredData .= textToSend
    if (StrLen(debugStoredData) > 8000)
    {
        StringTrimLeft, debugStoredData, debugStoredData, 4000     
    }
}
;-------------------- END OF DEBUGGING --------------------





;-------------------- DEBUGGING KEYS -------------------- 
#f9::
    processDebugData()
return

#if debugComputer
    #SC029::
    	if navigationMode = 0 
    	{
    		tooltip alternative layout
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
        showToolTip("RELOADING")
    	reload
    return
    
    #f8::
        resetStates()
        showToolTip("STATES RESTORED")
    return
#if
;-------------------- END OF DEBUGGING SHORTCUTS --------------------




;-------------------- keys that will be processed --------------------
#If navigationMode = 1
    
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
    
    *f9::processKeyDown("f9")
    *f9 up::processKeyUp("f9")
    
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
    
    *appskey::processKeyDown("appskey")
    *appskey up::processKeyUp("appskey")
    
    *printscreen::processKeyDown("printscreen")
    *printscreen up::processKeyUp("printscreen")
    
    *lctrl::processKeyDown("lctrl")
    *lctrl up::processKeyUp("lctrl")
        
    *rctrl::processKeyDown("rctrl")
    *rctrl up::processKeyUp("rctrl")
        
    *lalt::processKeyDown("lalt")
    *lalt up::processKeyUp("lalt")
        
    *ralt::processKeyDown("ralt")
    *ralt up::processKeyUp("ralt")
        
    *lshift::processKeyDown("lshift")
    *lshift up::processKeyUp("lshift")
    
    *rshift::processKeyDown("rshift")
    *rshift up::processKeyUp("rshift")
;-------------------- END OF keys that will be processed
#if