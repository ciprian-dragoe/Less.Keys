; if the cpu is executing intensive tasks then the lift key up command may not be processed for 
; modifier keys (ctrl, shift, alt, win) and they are still registered by the os as pressed.
; this is a fail safe for such situations

FixStickyKeys: 
    WinGetClass, activeProgramWindowClass, A
    WinGetTitle, activeProgramWindowName, A
    for index, app in ignoredPrograms {
        ;showtooltip(activeProgramWindowClass . "|" . activeProgramWindowClass . "|" . app, 2222)
        if (activeProgramWindowName = app || activeProgramWindowClass = app) {
            return
        }
    }
    
    resetCapsLock = false
    for index, key in checkStickyKeyList
    {
        if (key = "capslock")
        {
            resetCapsLock = true
        }
        if (GetKeyState(key, "P")) 
        {
           return
        }
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
	systemCursor(1)
return


TimerStickyActivePressedKeys:
    activePressedKeys := []
return
