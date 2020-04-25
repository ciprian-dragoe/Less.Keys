#include %A_ScriptDir%\app\processKey\keyTypes\shiftDoubledAsClick.ahk
#include %A_ScriptDir%\app\processKey\keyTypes\ctrlDoubledAsClick.ahk



global ctrlActive := false
global altActive := false
global shiftActive := false
global winActive := false
global winActive := false
global modifierActions := object()
global modifierDoubledAsClick := object()



modifierActions["ctrl"] := func("setCtrlState")  
modifierActions["alt"] := func("setAltState")  
modifierActions["shift"] := func("setShiftState")  
modifierActions["lwin"] := func("setWinState")  
modifierActions["ctrlClick"] := func("processCtrlDoubledAsClick")  
modifierActions["shiftClick"] := func("processShiftDoubledAsClick")  

modifierDoubledAsClick["shiftClick"] := "lbutton"
modifierDoubledAsClick["ctrlClick"] := "rbutton"

processModifierKey(key, state)
{
    action := modifierActions[key]
    if (action)
    {
        action.call(state)
        return true
    }
    
    return false
}

setCtrlState(state)
{
    if (state)
    {
        cancelDoubledModifier()
    }
    
    SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
    ctrlActive := state
    pressedState := state ? "down" : "up"
    send {blind}{ctrl %pressedState%}
}

setAltState(state)
{
    if (state)
    {
        cancelDoubledModifier()
    }
    
    SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
    altActive := state
    pressedState := state ? "down" : "up"
    send {blind}{alt %pressedState%}
}

setShiftState(state)
{
    if (state)
    {
        cancelDoubledModifier()
    }
        
    SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
    shiftActive := state
    pressedState := state ? "down" : "up"
    send {blind}{shift %pressedState%}
}

setWinState(state)
{
    if (state)
    {
        cancelDoubledModifier()
    }
    
    SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
    winActive := state
    pressedState := state ? "down" : "up"
    send {blind}{lwin %pressedState%}
}

cancelDoubledModifier()
{
    cancelMouseHook(doubledShiftMouseHook)
    cancelMouseHook(doubledCtrlMouseHook)
    sendClickOnShiftClickRelease := false
    sendClickOnCtrlClickRelease := false
    resetShiftClickDrag(modifierDoubledAsClick["shiftClick"])
    resetCtrlClickDrag(modifierDoubledAsClick["ctrlClick"])
}

cancelMouseHook(ByRef id)
{
    if (id)
    {
        DllCall("UnhookWindowsHookEx", "uint", id)
        id := 0
    }
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

timerResetSentClickOnModifierRelease()
{
    SetTimer, TimerResetSentClickOnModifierRelease, OFF
    sendClickOnShiftClickRelease := false
    sendClickOnCtrlClickRelease := false
}