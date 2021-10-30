#include %A_ScriptDir%\services\processKey\keyTypes\commonDoubledAs.ahk
#include %A_ScriptDir%\services\processKey\keyTypes\leftShiftDoubledAsClick.ahk
#include %A_ScriptDir%\services\processKey\keyTypes\leftCtrlDoubledAsClick.ahk
#include %A_ScriptDir%\services\processKey\keyTypes\leftWinDoubledAsClick.ahk
#include %A_ScriptDir%\services\processKey\keyTypes\leftAltDoubledAsClick.ahk
#include %A_ScriptDir%\services\processKey\keyTypes\rightCtrlDoubledAsClick.ahk
#include %A_ScriptDir%\services\processKey\keyTypes\rightShiftDoubledAsClick.ahk
#include %A_ScriptDir%\services\processKey\keyTypes\rightAltDoubledAsClick.ahk
#include %A_ScriptDir%\services\processKey\keyTypes\rightWinDoubledAsClick.ahk
#include %A_ScriptDir%\services\processKey\keyTypes\wobblyKeyPress.ahk


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
modifierActions["rightAltClick"] := func("processRightAltDoubledAsClick")
modifierActions["wobblyWinKey"] := func("wobblyKeyPress")

processModifierKey(key, state)
{
    action := modifierActions[key]
    if (action)
    {
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
    setWinState(state)
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

resetModifiersToState(state)
{
    if (state["altActive"])
    {
        send {alt down}
    }
    if (state["ctrlActive"])
    {
        send {ctrl down}
    }
    if (state["shiftActive"])
    {
        send {shift down}
    }
    if (state["winActive"])
    {
        send {lwin down}
    }
}

resetAllModifiers()
{
    dummy := 0
    resetModifierWithoutTriggerUpState("lwin", dummy)
    resetModifierWithoutTriggerUpState("alt", dummy)
    send {ctrl up}
    send {shift up}
}

getModifierStates()
{
    result := Object()
    result["winActive"] := winActive
    result["altActive"] := altActive
    result["ctrlActive"] := ctrlActive
    result["shiftActive"] := shiftActive
    return result
}

sendKeyCombinationIndependentActiveModifiers(combination)
{
    originalState := getModifierStates()
    resetAllModifiers()
    send %combination%
    resetModifiersToState(originalState)
    debug("finish sendKeyCombinationIndependentActiveModifiers")
}
