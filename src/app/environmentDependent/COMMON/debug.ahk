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
    send {ctrl up}
    send INTEGRATION_TEST
}

exit()
{
    showToolTip("EXIT")
    exitApp
}