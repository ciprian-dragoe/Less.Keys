#include %A_ScriptDir%\app\environmentDependent\development\shortcuts\resolver\debug.ahk
#include %A_ScriptDir%\app\environmentDependent\development\shortcuts\resolver\rightClick.ahk
#include %A_ScriptDir%\app\environmentDependent\development\shortcuts\resolver\accentedCharacters.ahk



global resolverAction := object()
resolverAction[1] := func("reloadApp")
resolverAction[2] := func("displayDebugData")
resolverAction[3] := func("storeDebugData")
resolverAction[1026] := func("rightClick")
resolverAction[1027] := func("sendAccentedSibling")
resolverAction[9999] := func("sendTestMessage")

processShortcut(index, combination)
{
    resolverAction[index].call(combination)
    return
}
