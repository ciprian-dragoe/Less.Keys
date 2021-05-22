; the way the ahk compiler works is that it stops executing code after it encounters a
; label declaration or hotkey capture. As some files can have labels in them when they 
; are included, the code in the next files is no longer executed - although most files 
; contain function declarations, some also contain variable initialization and this will 
; not happen anymore

TimerStickyFailBack:
    timerStickyFailBack()
return

TimerResetAllModifiers:
    timerResetAllModifiers()
return

TimerRealTimeDebug:
    timerRealTimeDebug()
return

TimerProcessLayoutOnRelease:
    timerProcessLayoutOnRelease()
return

TimerScrollWithMouseMovement:
    timerScrollWithMouseMovement()
return

TimerResetModifierReleaseAction:
    timerResetModifierReleaseAction()
return

TimerShowMouse:
    systemCursor(1)
return

TimerTimeoutSendLayoutKey:
    timerTimeoutSendLayoutKey()
return

TimerFixAppsOverwriteLessKeysKeyboardHooks:
    timerFixAppsOverwriteLessKeysKeyboardHooks()
return
