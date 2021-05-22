#include %A_ScriptDir%\app\processKey\keyTypes\commonDoubledAs.ahk
#include %A_ScriptDir%\app\processKey\keyTypes\leftShiftDoubledAsClick.ahk
#include %A_ScriptDir%\app\processKey\keyTypes\leftCtrlDoubledAsClick.ahk
#include %A_ScriptDir%\app\processKey\keyTypes\leftWinDoubledAsClick.ahk
#include %A_ScriptDir%\app\processKey\keyTypes\leftAltDoubledAsClick.ahk
#include %A_ScriptDir%\app\processKey\keyTypes\rightCtrlDoubledAsClick.ahk
#include %A_ScriptDir%\app\processKey\keyTypes\rightShiftDoubledAsClick.ahk
#include %A_ScriptDir%\app\processKey\keyTypes\rightAltDoubledAsClick.ahk
#include %A_ScriptDir%\app\processKey\keyTypes\rightWinDoubledAsClick.ahk



global ctrlActive := false
global shiftActive := false
global altActive := false
global winActive := false
global isNormalCtrlActive := false
global isNormalShiftActive := false
global isNormalAltActive := false
global isNormalWinActive := false
global modifierActions := object()



modifierActions["ctrl"] := func("setNormalCtrl")
modifierActions["alt"] := func("setNormalAlt")
modifierActions["shift"] := func("setNormalShift")
modifierActions["lwin"] := func("setNormalWin")
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
        SetTimer TimerStickyFailBack, OFF
        SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
        debug(key . " |" . state . "|")
        action.call(state)
        processKeyOnRelease := false
        return true
    }
    
    return false
}
setNormalCtrl(state)
{
    isNormalCtrlActive := state
    setCtrlState(state)
}

setNormalShift(state)
{
    isNormalShiftActive := state
    setShiftState(state)
}

setNormalAlt(state)
{
    isNormalAltActive := state
    setAltState(state)
}

setNormalWin(state)
{
    isNormalWinActive := state
    setAltState(state)
}

setCtrlState(state)
{
    ctrlActive := state
    pressedState := state ? "down" : "up"
    debug("ctrl " . state)
    send {ctrl %pressedState%}
}

setAltState(state)
{
    altActive := state
    pressedState := state ? "down" : "up"
    debug("alt " . state)
    send {alt %pressedState%}
}

setShiftState(state)
{
    shiftActive := state
    pressedState := state ? "down" : "up"
    debug("shift " . state)
    send {shift %pressedState%}
}

setWinState(state)
{
    winActive := state
    pressedState := state ? "down" : "up"
    debug("win " . state)
    send {lwin %pressedState%}
}

getActiveModifiers(key = "")
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