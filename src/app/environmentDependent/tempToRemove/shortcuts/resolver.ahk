global ACTIVE_COMPUTER_1 := "lenovo-x230"
global ACTIVE_COMPUTER_2 := "CIPI-ASUS-ROG"
global ACTIVE_COMPUTER_3 := "yoga-cipi"
global SCREEN_SLEEP_PATH := A_ScriptDir . "\environmentDependent\_development\shortcuts\nircmd"
if (A_ScriptName = "LessKeys.exe")
{
    SCREEN_SLEEP_PATH := A_ScriptDir .  "\externalResources\nircmd"
}


#include %A_ScriptDir%\..\environmentDependent\_development\shortcuts\resolver\modifierClick.ahk
#include %A_ScriptDir%\..\environmentDependent\_development\shortcuts\resolver\mloShortcutScripts.ahk
#include %A_ScriptDir%\..\environmentDependent\_development\shortcuts\resolver\freeplaneShortcutScripts.ahk
#include %A_ScriptDir%\..\environmentDependent\_development\shortcuts\resolver\conceptsShortcutScripts.ahk
#include %A_ScriptDir%\..\environmentDependent\_development\shortcuts\resolver\simplemindShortcutScripts.ahk
#include %A_ScriptDir%\..\environmentDependent\_development\shortcuts\resolver\foobarShortcutScripts.ahk
#include %A_ScriptDir%\..\environmentDependent\_development\shortcuts\resolver\winSplit.ahk
#include %A_ScriptDir%\..\environmentDependent\_development\shortcuts\resolver\contextDependent.ahk
#include %A_ScriptDir%\..\environmentDependent\_development\shortcuts\resolver\windowsShortcuts.ahk
#include %A_ScriptDir%\..\environmentDependent\_development\shortcuts\resolver\timedCapsLock.ahk
#include %A_ScriptDir%\..\environmentDependent\_development\shortcuts\resolver\autoSyncMlo.ahk
#include %A_ScriptDir%\..\environmentDependent\COMMON\accentedCharacters.ahk
#include %A_ScriptDir%\..\environmentDependent\COMMON\functionKeys.ahk


global resolverAction := object()
resolverAction[1] := func("processCtrlW")
resolverAction[2] := func("processCtrlE")
resolverAction[3] := func("processCtrlR")
resolverAction[10] := func("processCtrlF")
resolverAction[11] := func("processCtrlShiftF")
resolverAction[20] := func("processCtrlUp")
resolverAction[21] := func("processCtrlDown")
resolverAction[22] := func("rapidTaskEntry")
resolverAction[51] := func("processShiftF1")
resolverAction[52] := func("processShiftF2")
resolverAction[71] := func("processModifierWithNumber")
resolverAction[111] := func("activateWin1")
resolverAction[112] := func("activateWin2")
resolverAction[113] := func("activateWin3")
resolverAction[114] := func("activateWin4")
resolverAction[115] := func("activateWin5")
resolverAction[116] := func("activateWin6")
resolverAction[117] := func("activateWin7")
resolverAction[118] := func("activateWin8")
resolverAction[119] := func("activateWin9")
resolverAction[120] := func("activateWin0")
resolverAction[121] := func("mediaNext")
resolverAction[122] := func("mediaPLayPause")
resolverAction[123] := func("mediaPrevious")
resolverAction[124] := func("screenSleep")
resolverAction[126] := func("showDesktop")
resolverAction[127] := func("toggleAlwaysOnTop")
resolverAction[128] := func("showTime")
resolverAction[130] := func("foobarOrderShuffle")
resolverAction[131] := func("foobarOrderDefault")
resolverAction[132] := func("foobarOrderRepeat")
resolverAction[133] := func("foobarSearchAllSongs")
resolverAction[134] := func("saveAllPlayLists")
resolverAction[201] := func("winsplitMoveToArea1")
resolverAction[202] := func("winsplitMoveToArea2")
resolverAction[203] := func("winsplitMoveToArea3")
resolverAction[204] := func("winsplitMoveToArea4")
resolverAction[205] := func("winsplitMoveToArea5")
resolverAction[206] := func("winsplitMoveToArea6")
resolverAction[207] := func("winsplitMoveToArea7")
resolverAction[208] := func("winsplitMoveToArea8")
resolverAction[209] := func("winsplitMoveToArea9")
resolverAction[499] := func("timedCapsLock")
resolverAction[500] := func("sendAccentedSibling")
resolverAction[504] := func("reloadHookHandler")
resolverAction[505] := func("exitHookHandler")
resolverAction[509] := func("storeDebugLogHookHandler")
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
resolverAction[524] := func("wobblyKeyPress")
resolverAction[525] := func("toggleRealTimeDebug")

processShortcut(index, combination)
{
    debug("shortcut: " . combination)
    resolverAction[index].call(combination, index)
}
