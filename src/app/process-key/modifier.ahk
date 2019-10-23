global ctrlActive
global altActive
global shiftActive
global winActive



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
