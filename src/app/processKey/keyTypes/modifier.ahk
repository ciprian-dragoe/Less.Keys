#include %A_ScriptDir%\app\processKey\keyTypes\commonDoubledAs.ahk
#include %A_ScriptDir%\app\processKey\keyTypes\shiftDoubledAsClick.ahk
#include %A_ScriptDir%\app\processKey\keyTypes\leftCtrlDoubledAsClick.ahk
#include %A_ScriptDir%\app\processKey\keyTypes\rightCtrlDoubledAsClick.ahk
#include %A_ScriptDir%\app\processKey\keyTypes\winDoubledAsClick.ahk
#include %A_ScriptDir%\app\processKey\keyTypes\altDoubledAsClick.ahk



global ctrlActive := false
global altActive := false
global shiftActive := false
global winActive := false
global winActive := false
global modifierActions := object()



modifierActions["ctrl"] := func("setCtrlState")
modifierActions["alt"] := func("setAltState")
modifierActions["shift"] := func("setShiftState")
modifierActions["lwin"] := func("setWinState")
modifierActions["leftCtrlClick"] := func("processLeftCtrlDoubledAsClick")
modifierActions["leftShiftClick"] := func("processLeftShiftDoubledAsClick")
modifierActions["leftWinClick"] := func("processLeftWinDoubledAsClick")
modifierActions["leftAltClick"] := func("processLeftAltDoubledAsClick")
modifierActions["rightCtrlClick"] := func("processRightCtrlDoubledAsClick")
modifierActions["rightShiftClick"] := func("processRightShiftDoubledAsClick")
modifierActions["rightWinClick"] := func("processRightWinDoubledAsClick")
modifierActions["rightAltClick"] := func("processRightAltDoubledAsClick")

processModifierKey(key, state)
{
    action := modifierActions[key]
    if (action)
    {
        debug(key . " modifier |" . state . "|")
        action.call(state)
        processKeyOnRelease := false
        return true
    }
    
    return false
}

setCtrlState(state)
{
    SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
    if (ctrlActive && isLeftCtrlDoubledAsClickPressed)
    {
        leftCtrlActiveBeforeCtrlClickPress := true
    }
    ctrlActive := state
    pressedState := state ? "down" : "up"
    send {blind}{ctrl %pressedState%}
}

setAltState(state)
{
    SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
    if (altActive && isAltDoubledAsClickPressed)
    {
        altActiveBeforeAltClickPress := true
    }
    altActive := state
    pressedState := state ? "down" : "up"
    send {blind}{alt %pressedState%}
}

setShiftState(state)
{
    SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
    if (shiftActive && isShiftDoubledAsClickPressed)
    {
        shiftActiveBeforeShiftClickPress := true
    }
    shiftActive := state
    pressedState := state ? "down" : "up"
    send {blind}{shift %pressedState%}
}

setWinState(state)
{
    SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
    if (winActive && isWinDoubledAsClickPressed)
    {
        winActiveBeforeWinClickPress := true
    }
    winActive := state
    pressedState := state ? "down" : "up"
    send {blind}{lwin %pressedState%}
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