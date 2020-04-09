global checkStickyKeyList := ["lshift", "rshift", "lctrl", "rctrl", "ralt", "lalt", "lwin", "rwin"]
global activeProgramWindowName := ""
global activeProgramWindowClass := ""
global ignoredPrograms := []
global timerTimeoutStickyKeys := 2000



applyDisabledAppsSettings(path)
{
    IniRead, appNames, %path%, disable, appNames
    disabledApps := StrSplit(appNames, "~~~")
    for index, app in disabledApps {
        GroupAdd, IgnoredApps, %app%
        ignoredPrograms.Push(app)
    }
}

; if the cpu is executing intensive tasks then the lift key up command may not be processed for 
; modifier keys (ctrl, shift, alt, win) and they are still registered by the os as pressed.
; this is a fail safe for such situations
fixStickyKeys() {
    WinGetClass, activeProgramWindowClass, A
    WinGetTitle, activeProgramWindowName, A
    for index, app in ignoredPrograms {
        if (activeProgramWindowName = app || activeProgramWindowClass = app) {
            return
        }
    }
    
    
    /*
    showtooltip("dezactivat stick reset fail back")
    
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
    
    resetStates()
    if (resetCapsLock)
    {
        SetCapsLockState, off  
    }
    */
}
