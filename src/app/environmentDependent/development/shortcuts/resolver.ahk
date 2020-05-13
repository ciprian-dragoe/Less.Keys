#include %A_ScriptDir%\app\environmentDependent\development\shortcuts\resolver\debug.ahk
#include %A_ScriptDir%\app\environmentDependent\development\shortcuts\resolver\rightClick.ahk



global resolverAction := object()
resolverAction[1] := func("reloadApp")
resolverAction[2] := func("displayDebugData")
resolverAction[3] := func("storeDebugData")
resolverAction[1026] := func("rightClick")
resolverAction[9999] := func("sendTestMessage")

processShortcut(index)
{
    resolverAction[index]()
    return
}
