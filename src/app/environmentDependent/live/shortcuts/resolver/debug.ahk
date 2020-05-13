reloadApp()
{
	showToolTip("RELOADING")
    reload
}


displayDebugData()
{
	msgbox % debugStoredData
}


storeDebugData()
{
    showToolTip("DEBUG FILES STORED")
    FileDelete, %A_Desktop%\log.txt
    msgbox % debugStoredData
    FileAppend, %debugStoredData%, %A_Desktop%\debugKeyboardHack.txt
    resetStates()
}
