; if the cpu is executing intensive tasks then the lift key up command may not be processed for 
; modifier keys (ctrl, shift, alt, win) and they are still registered by the os as pressed.
; this is a fail safe for such situations
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
	systemCursor(1)
return


TimerStickyActivePressedKeys:
    activePressedKeys := []
return
