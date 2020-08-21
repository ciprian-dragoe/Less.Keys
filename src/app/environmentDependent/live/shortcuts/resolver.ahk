#include %A_ScriptDir%\app\environmentDependent\live\shortcuts\resolver\debug.ahk
#include %A_ScriptDir%\app\environmentDependent\live\shortcuts\resolver\rightClick.ahk
#include %A_ScriptDir%\app\environmentDependent\development\shortcuts\resolver\accentedCharacters.ahk
#include %A_ScriptDir%\app\environmentDependent\_development\shortcuts\resolver\modifier-click.ahk



global resolverAction := object()
resolverAction[1] := func("reloadApp")
resolverAction[2] := func("displayDebugData")
resolverAction[3] := func("storeDebugData")
resolverAction[220] := func("ctrlTab")
resolverAction[221] := func("altTab")
resolverAction[222] := func("altShiftTab")
resolverAction[223] := func("ctrlShiftTab")
resolverAction[224] := func("winShiftTab")
resolverAction[225] := func("winTab")
resolverAction[500] := func("sendAccentedSibling")
resolverAction[510] := func("rightClick")
resolverAction[520] := func("sendTestMessage")

processShortcut(index, combination)
{
    resolverAction[index].call(combination)
    return
}

