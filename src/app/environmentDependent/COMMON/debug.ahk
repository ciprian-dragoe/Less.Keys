reloadApp()
{
    showToolTip("RELOADING")
    reload
}

displayDebugData()
{
    clipboard := debugStoredData
    msgbox % debugStoredData
}

storeDebugData()
{
    if (logStickyKeys) {
        FileAppend, %debugStoredData%, %A_Desktop%\%A_Hour%-%A_Min%-%A_Sec%-%A_MSec%-stored-log.txt
    }
}

sendTestMessage()
{
    shouldRestoreAlt := 0
    if (GetKeyState("alt"))
    {
        shouldRestoreAlt := 1
    }
    shouldRestoreShift := 0
    if (GetKeyState("shift"))
    {
        shouldRestoreShift := 1
    }
    shouldRestoreCtrl := 0
    if (GetKeyState("ctrl"))
    {
        shouldRestoreCtrl := 1
    }
    shouldRestoreWin := 0
    if (GetKeyState("lwin"))
    {
        shouldRestoreWin := 1
    }
    send {ctrl up}
    send {capslock}{capslock}{lwin up}
    send {capslock}{capslock}{alt up}
    send {shift up}
    send INTEGRATION_TEST
    if (shouldRestoreAlt)
    {
        send {alt down}
    }
    if (shouldRestoreCtrl)
    {
        send {ctrl down}
    }
    if (shouldRestoreShift)
    {
        send {shift down}
    }
    if (shouldRestoreWin)
    {
        send {lwin down}
    }
}

exit()
{
    showToolTip("EXIT")
    exitApp
}