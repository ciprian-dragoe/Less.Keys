#SingleInstance
#Persistent
#MaxHotkeysPerInterval 400
SetKeyDelay -1



#include shortcuts.ahk
#include  %A_ScriptDir%\app\debug.ahk




global timeoutStillSendLayoutKey
global timeoutProcessLayoutOnRelease
global logInput

global alternativeLayout
global modifierKeys
global layout


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

global timerTimeoutStickyKeys := 1000

readLayoutFile("my-layout.cfg")
readAlternativeLayoutFile("my-alternative-layout.cfg")
readSettingsFile("my-settings.cfg")
readKeyboardShortcutsFile("my-keyboard-shortcuts.cfg")
resetStates()



; if the cpu is executing intensive tasks then the lift key up command may not be processed for 
; modifier keys (ctrl, shift, alt, win) and they are still registered by the os as pressed.
; this is a fail safe for such situations
SetTimer, FixStickyKeys, %timerTimeoutStickyKeys%
FixStickyKeys: 
    resetCapsLock = false
    for key in modifierKeys
    {
        if ("capslock" = key)
        {
            resetCapsLock = true
        }
        if (GetKeyState(key, "P")) 
        {
            return
        }
    }
    
    if (GetKeyState(layoutChangeKey, "P"))
    {
        return
    }

    ctrlActive := false
    send {ctrl up}
    shiftActive := false
    send {shift up}
    altActive := false
    send {alt up}
    winActive := false
    send {lwin up}
    if (resetCapsLock)
    {
        SetCapsLockState, off  
    }
    
	layoutKeyPressed := false
	alternativeLayoutActive := false
	stopManagingLayoutKey := false
    SetTimer, FixStickyKeys, OFF
return


TimerStickyActivePressedKeys:
    activePressedKeys := []
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
    setTimer TimerStickyActivePressedKeys, 0
    setTimer TimerStickyActivePressedKeys, %timerTimeoutStickyKeys%
    
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
        send {blind}%activeModifiers%{%key%}
        ;showtooltip(activeModifiers . "|" . key)
    }
}


processModifierKey(key, state)
{
    pressedState := state ? "downR" : "up"
    if (key == "ctrl") 
    {
        send {ctrl %pressedState%}
        ctrlActive := state
        return true
    } 
    else if (key == "alt")
    {
        send {alt %pressedState%}
        altActive := state
        return true
    }
    else if (key == "shift")
    {
        send {shift %pressedState%}
        shiftActive := state
        return true
    }
    else if (key == "lwin")
    {
        send {lwin %pressedState%}
        winActive := state
        return true
    }
    
    return false
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
    processKeyOnRelease := false
    layoutKeyActivatesProcessKeyOnRelease := false    
    alternativeLayoutActive := false
     
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
    SetTimer, FixStickyKeys, OFF
    SetTimer, FixStickyKeys, %timerTimeoutStickyKeys%
    
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
    index := keyboardShortcuts[combination]
    if (index)
    {
        processShortcut(index)
        return true
    }
    
    return false
}





;-------------------- READ SETTING FILES --------------------
readLayoutFile(path)
{
    modifierKeys:=Object()
    layout:=Object()
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
        
        layout[StrSplit(A_LoopReadLine, "`:").1] := remappedKey
    }
}

readAlternativeLayoutFile(path)
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
        alternativeLayout[StrSplit(A_LoopReadLine, "`:").1] := remappedKey
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

readSettingsFile(path)
{
    IniRead, timeoutStillSendLayoutKey, %path%, timings, timeoutStillSendLayoutKey
    IniRead, timeoutProcessLayoutOnRelease, %path%, timings, timeoutProcessLayoutOnRelease
    IniRead, logInput, %path%, logging, logInput
}
;-------------------- END OF READ SETTING FILES --------------------





#If navigationMode = 1
    
    *escape::processKeyDown("escape")
    *escape up::processKeyUp("escape")
    
    *f1::processKeyDown(layout["F1"])
    *f1 up::processKeyUp(layout["F1"])
    
    *f2::processKeyDown(layout["F2"])
    *f2 up::processKeyUp(layout["F2"])
    
    *f3::processKeyDown(layout["F3"])
    *f3 up::processKeyUp(layout["F3"])
    
    *f4::processKeyDown(layout["F4"])
    *f4 up::processKeyUp(layout["F4"])
    
    *f5::processKeyDown(layout["F5"])
    *f5 up::processKeyUp(layout["F5"])
    
    *f6::processKeyDown(layout["F6"])
    *f6 up::processKeyUp(layout["F6"])
    
    *f7::processKeyDown(layout["F7"])
    *f7 up::processKeyUp(layout["F7"])
    
    *f8::processKeyDown(layout["F8"])
    *f8 up::processKeyUp(layout["F8"])
    
    *f9::processKeyDown(layout["F9"])
    *f9 up::processKeyUp(layout["F9"])
    
    *f10::processKeyDown(layout["F10"])
    *f10 up::processKeyUp(layout["F10"])
    
    *f11::processKeyDown(layout["F11"])
    *f11 up::processKeyUp(layout["F11"])
    
    *f12::processKeyDown(layout["F12"])
    *f12 up::processKeyUp(layout["F12"])
    
    *home::processKeyDown(layout["home"])
    *home up::processKeyUp(layout["home"])
            
    *end::processKeyDown(layout["end"])
    *end up::processKeyUp(layout["end"])
        
    *insert::processKeyDown(layout["insert"])
    *insert up::processKeyUp(layout["insert"])
            
    *delete::processKeyDown(layout["delete"])
    *delete up::processKeyUp(layout["delete"])
        
    *sc029::processKeyDown(layout["``"])
    *sc029 up::processKeyUp(layout["``"])        
    
    *1::processKeyDown(layout[1])
    *1 up::processKeyUp(layout[1])
    
    *2::processKeyDown(layout[2])
    *2 up::processKeyUp(layout[2])
        
    *3::processKeyDown(layout[3])
    *3 up::processKeyUp(layout[3])
    
    *4::processKeyDown(layout[4])
    *4 up::processKeyUp(layout[4])
    
    *5::processKeyDown(layout[5])
    *5 up::processKeyUp(layout[5])
    
    *6::processKeyDown(layout[6])
    *6 up::processKeyUp(layout[6])
            
    *7::processKeyDown(layout[7])
    *7 up::processKeyUp(layout[7])
    
    *8::processKeyDown(layout[8])
    *8 up::processKeyUp(layout[8])
        
    *9::processKeyDown(layout[9])
    *9 up::processKeyUp(layout[9])
    
    *0::processKeyDown(layout[0])
    *0 up::processKeyUp(layout[0])
    
    *-::processKeyDown(layout["-"])
    *- up::processKeyUp(layout["-"])
    
    *=::processKeyDown(layout["="])	
    *= up::processKeyUp(layout["="])
            
    *backspace::processKeyDown(layout["backspace"])
    *backspace up::processKeyUp(layout["backspace"])
        
    *tab::processKeyDown(layout["tab"])
    *tab up::processKeyUp(layout["tab"])
    
    *q::processKeyDown(layout["q"])
    *q up::processKeyUp(layout["q"])
    
    *w::processKeyDown(layout["w"])
    *w up::processKeyUp(layout["w"])
    
    *e::processKeyDown(layout["e"])
    *e up::processKeyUp(layout["e"])
    
    *r::processKeyDown(layout["r"])
    *r up::processKeyUp(layout["r"])
    
    *t::processKeyDown(layout["t"])
    *t up::processKeyUp(layout["t"])
    
    *y::processKeyDown(layout["y"])
    *y up::processKeyUp(layout["y"])
    
    *u::processKeyDown(layout["u"])
    *u up::processKeyUp(layout["u"])
    
    *i::processKeyDown(layout["i"])
    *i up::processKeyUp(layout["i"])
    
    *o::processKeyDown(layout["o"])
    *o up::processKeyUp(layout["o"])
    
    *p::processKeyDown(layout["p"])
    *p up::processKeyUp(layout["p"])
    
    *[::processKeyDown(layout["["])
    *[ up::processKeyUp(layout["["])
    
    *]::processKeyDown(layout["]"])	
    *] up::processKeyUp(layout["]"])
    
    *\::processKeyDown(layout["\"])	
    *\ up::processKeyUp(layout["\"])
            
    *capslock::processKeyDown(layout["capslock"])
    *capslock up::processKeyUp(layout["capslock"])
    
    *a::processKeyDown(layout["a"])
    *a up::processKeyUp(layout["a"])
    
    *s::processKeyDown(layout["s"])
    *s up::processKeyUp(layout["s"])
    
    *d::processKeyDown(layout["d"])
    *d up::processKeyUp(layout["d"])
    
    *f::processKeyDown(layout["f"])
    *f up::processKeyUp(layout["f"])
    
    *g::processKeyDown(layout["g"])
    *g up::processKeyUp(layout["g"])
    
    *h::processKeyDown(layout["h"])
    *h up::processKeyUp(layout["h"])
    
    *j::processKeyDown(layout["j"])
    *j up::processKeyUp(layout["j"])
    
    *k::processKeyDown(layout["k"])
    *k up::processKeyUp(layout["k"])
    
    *l::processKeyDown(layout["l"])
    *l up::processKeyUp(layout["l"])
    
    *`;::processKeyDown(layout[";"])
    *`; up::processKeyUp(layout[";"])
    
    *'::processKeyDown(layout["'"])
    *' up::processKeyUp(layout["'"])
        
    *enter::processKeyDown(layout["enter"])
    *enter up::processKeyUp(layout["enter"])
            
    *z::processKeyDown(layout["z"])
    *z up::processKeyUp(layout["z"])
    
    *x::processKeyDown(layout["x"])
    *x up::processKeyUp(layout["x"])
    
    *c::processKeyDown(layout["c"])
    *c up::processKeyUp(layout["c"])
    
    *v::processKeyDown(layout["v"])
    *v up::processKeyUp(layout["v"])
    
    *b::processKeyDown(layout["b"])
    *b up::processKeyUp(layout["b"])
    
    *n::processKeyDown(layout["n"])
    *n up::processKeyUp(layout["n"])
    
    *m::processKeyDown(layout["m"])
    *m up::processKeyUp(layout["m"])
    
    *sc033::processKeyDown(layout[","])
    *sc033 up::processKeyUp(layout[","])
    
    *sc034::processKeyDown(layout["."])
    *sc034 up::processKeyUp(layout["."])
    
    *sc035::processKeyDown(layout["/"])
    *sc035 up::processKeyUp(layout["/"])
    
    *space::processKeyDown(layout["space"])
    *space up::processKeyUp(layout["space"])
    
    *left::processKeyDown(layout["left"])
    *left up::processKeyUp(layout["left"])
    
    *down::processKeyDown(layout["down"])
    *down up::processKeyUp(layout["down"])
    
    *right::processKeyDown(layout["right"])
    *right up::processKeyUp(layout["right"])
    
    *up::processKeyDown(layout["up"])
    *up up::processKeyUp(layout["up"])
    
    *pgdn::processKeyDown(layout["pgdn"])
    *pgdn up::processKeyUp(layout["pgdn"])
    
    *pgup::processKeyDown(layout["pgup"])
    *pgup up::processKeyUp(layout["pgup"])
    
    *appskey::processKeyDown(layout["appskey"])
    *appskey up::processKeyUp(layout["appskey"])
    
    *printscreen::processKeyDown(layout["printscreen"])
    *printscreen up::processKeyUp(layout["printscreen"])
    
    *lctrl::processKeyDown(layout["lctrl"])
    *lctrl up::processKeyUp(layout["lctrl"])
        
    *rctrl::processKeyDown(layout["rctrl"])
    *rctrl up::processKeyUp(layout["rctrl"])
        
    *lalt::processKeyDown(layout["lalt"])
    *lalt up::processKeyUp(layout["lalt"])
        
    *ralt::processKeyDown(layout["ralt"])
    *ralt up::processKeyUp(layout["ralt"])
    
    *lshift::processKeyDown(layout["lshift"])
    *lshift up::processKeyUp(layout["lshift"])
    
    *rshift::processKeyDown(layout["rshift"])
    *rshift up::processKeyUp(layout["rshift"])
    
    *lwin::processKeyDown("lwin")
    *lwin up::processKeyUp("lwin")
    
    *rwin::processKeyDown("lwin")
    *rwin up::processKeyUp("lwin")    
    
;-------------------- END OF keys that will be processed
#if