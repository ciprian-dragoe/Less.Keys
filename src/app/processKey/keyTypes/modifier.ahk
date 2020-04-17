global ctrlActive := false
global altActive := false
global shiftActive := false
global winActive := false



processModifierKey(key, state)
{
    pressedState := state ? "down" : "up"
    if (key = "ctrl") 
    {
        SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
        ctrlActive := state
        send {blind}{ctrl %pressedState%}
        return true
    } 
    else if (key = "alt")
    {
        SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
        altActive := state
        send {blind}{alt %pressedState%}
        return true
    }
    else if (key = "shift")
    {
        SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
        shiftActive := state
        send {blind}{shift %pressedState%}
        return true
    }
    else if (key = "lwin")
    {
        SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
        winActive := state
        send {blind}{lwin %pressedState%}
        return true
    }
    
    return false
}

getActiveModifiers(key)
{
    result := ""
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
