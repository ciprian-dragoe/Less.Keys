; the way the ahk compiler works is that it stops executing code after it encounters a
; label declaration or hotkey capture. As some files can have labels in them when they 
; are included, the code in the next files is no longer executed - although most files 
; contain function declarations, some also contain variable initialization and this will 
; not happen anymore

CheckRecentMouseMovemet:
    checkRecentMouseMovement()
return

FixStickyKeys: 
    fixStickyKeys()
return

TimerProcessLayoutOnRelease:
    timerProcessLayoutOnRelease()     
return

TimerGetMouseMovement:
    timerGetMouseMovement()     
return

TimerShowMouse:
    systemCursor(1)
return

TimerActivePressedKeysReset:
    activePressedKeys := []
return

TimerTimeoutSpaceAsMouseClick:
    timerTimeoutSpaceAsMouseClick()
return

TimerTimeoutSendLayoutKey:
    timerTimeoutSendLayoutKey()
return

TimerClickDrag:
    timerClickDrag()
return
