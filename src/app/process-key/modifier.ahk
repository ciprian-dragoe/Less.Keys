global ctrlActive := false
global altActive := false
global shiftActive := false
global winActive := false



processModifierKey(key, state)
{
    pressedState := state ? "down" : "up"
    if (key = "ctrl") 
    {
        trackStickyKey(key, state)
        ctrlActive := state
        send {blind}{ctrl %pressedState%}
        return true
    } 
    else if (key = "alt")
    {
        trackStickyKey(key, state)
        altActive := state
        send {blind}{alt %pressedState%}
        return true
    }
    else if (key = "shift")
    {
        trackStickyKey(key, state)
        shiftActive := state
        send {blind}{shift %pressedState%}
        return true
    }
    else if (key = "lwin")
    {
        trackStickyKey(key, state)
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
