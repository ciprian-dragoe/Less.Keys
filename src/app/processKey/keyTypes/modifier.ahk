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
        debug(key . " |" . state . "|")
        action.call(state)
        processKeyOnRelease := false
        return true
    }
    
    return false
}

setCtrlState(state)
{
    ctrlActive := state
    pressedState := state ? "down" : "up"
    if (repressNormalCtrlRelease)
    {
        pressedState := "down"
        ctrlActive := 1
        repressNormalCtrlRelease := false
    }
    debug("ctrl " . state)
    send {blind}{ctrl %pressedState%}
}

setAltState(state)
{
    altActive := state
    pressedState := state ? "down" : "up"
    if (repressNormalAltRelease)
    {
        pressedState := "down"
        altActive := 1
        repressNormalAltRelease := false
    }
    debug("alt " . state)
    send {blind}{alt %pressedState%}
}

setShiftState(state)
{
    shiftActive := state
    pressedState := state ? "down" : "up"
    if (repressNormalShiftRelease)
    {
        pressedState := "down"
        shiftActive := 1
        repressNormalShiftRelease := false
    }
    send {blind}{shift %pressedState%}
}

setWinState(state)
{
    winActive := state
    pressedState := state ? "down" : "up"
    if (repressNormalWinRelease)
    {
        pressedState := "down"
        winActive := 1
        repressNormalWinRelease := false
    }
    debug("win " . state)
    send {blind}{lwin %pressedState%}
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