#include %A_ScriptDir%\..\environmentDependent\COMMON\debug.ahk
#include %A_ScriptDir%\..\environmentDependent\COMMON\rightClick.ahk
#include %A_ScriptDir%\..\environmentDependent\COMMON\accentedCharacters.ahk
#include %A_ScriptDir%\..\environmentDependent\COMMON\functionKeys.ahk
#include %A_ScriptDir%\..\environmentDependent\COMMON\random.ahk



global resolverAction := object()
resolverAction[500] := func("sendAccentedSibling")
resolverAction[501] := func("rightClick")
resolverAction[502] := func("sendTestMessage")
resolverAction[503] := func("displayDebugData")
resolverAction[504] := func("reloadApp")
resolverAction[505] := func("exit")
resolverAction[509] := func("storeDebugData")
global functionKeysStartIndexMinusOne := 510
resolverAction[511] := func("sendFunctionKey")
resolverAction[512] := func("sendFunctionKey")
resolverAction[513] := func("sendFunctionKey")
resolverAction[514] := func("sendFunctionKey")
resolverAction[515] := func("sendFunctionKey")
resolverAction[516] := func("sendFunctionKey")
resolverAction[517] := func("sendFunctionKey")
resolverAction[518] := func("sendFunctionKey")
resolverAction[519] := func("sendFunctionKey")
resolverAction[520] := func("sendFunctionKey")
resolverAction[521] := func("sendFunctionKey")
resolverAction[522] := func("sendFunctionKey")
resolverAction[523] := func("ignoreShortcut")

processShortcut(index, combination)
{
    debug("shortcut: " . combination)
    resolverAction[index].call(combination, index)
    return
}
