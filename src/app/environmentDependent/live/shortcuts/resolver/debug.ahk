reloadApp()
{
    showToolTip("RELOADING")
    reload
}


displayDebugData()
{
    msgbox % debugStoredData
    clipboard := debugStoredData
}

storeDebugData()
{
    if (logInput) {
        FileAppend, %debugStoredData%, %A_Desktop%\%A_Hour%-%A_Min%-%A_Sec%-%A_MSec%-log.txt
    }
}
