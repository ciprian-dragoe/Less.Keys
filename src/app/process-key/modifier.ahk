global ctrlActive := false
global altActive := false
global shiftActive := false
global winActive := false



processModifierKey(key, state)
{
    pressedState := state ? "downR" : "up"
    if (key == "ctrl") 
    {
        trackStickyKey(key, state)
        send {ctrl %pressedState%}
        ctrlActive := state
        return true
    } 
    else if (key == "alt")
    {
        trackStickyKey(key, state)
        send {alt %pressedState%}
        altActive := state
        return true
    }
    else if (key == "shift")
    {
        trackStickyKey(key, state)
        send {shift %pressedState%}
        shiftActive := state
        return true
    }
    else if (key == "lwin")
    {
        trackStickyKey(key, state)
        send {lwin %pressedState%}
        winActive := state
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
