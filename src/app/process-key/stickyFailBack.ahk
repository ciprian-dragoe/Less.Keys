global activeStickyKeys := []
global timerTimeoutStickyKeys := 2000

; if the cpu is executing intensive tasks then the lift key up command may not be processed for 
; modifier keys (ctrl, shift, alt, win) and they are still registered by the os as pressed.
; This is a fail safe for such situations
timerStickyFailBack() 
{
    if (activeStickyKeys.Length() = 0)
    {
        SetTimer, TimerStickyFailBack, off
        return
    }
    
    resetCapsLock = false
    for index, key in monitoredStickyKeys
    {
        if (key = "capslock")
        {
            resetCapsLock = true
        }
        
        if (showRealTimeDebugInfo)
        {
            showDebugData(key)
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
    Loop, % activeStickyKeys.Length()
    {
        activeStickyKeys.Pop()
    }
    
    SetTimer, TimerStickyFailBack, off
}

showDebugData(key)
{
    allActiveKeys := ""
    for index, value in activeStickyKeys
    {
        allActiveKeys .= " " . value
    } 
    value := key . "=" . GetKeyState(key, "P") . "|activeStickyKeys= " . allActiveKeys
    showtooltip(value, 1000)
}

trackStickyKey(key, state)
{
    if (state)
    {
        itemNotPresent := true
        for index, value in activeStickyKeys
        {
            if (value = key)
            {
                itemNotPresent := false
                break
            }
        }
        if (itemNotPresent)
        {
            activeStickyKeys.Push(key)
        }
        
        SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
    }
    else
    {
        for index, value in activeStickyKeys
        {
            if (value = key)
            {
                activeStickyKeys.Remove(index)
                break
            }
        }
    }
}
