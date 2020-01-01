activateDeactivateLayout()
{
	if navigationMode = 0 
    {
        navigationMode = 1
        showToolTip("Less.Keys - ON")
        sleep 1000
        resetStates()
    }
    else
    {
        navigationMode = 0
        showToolTip("NORMAL LAYOUT")
        sleep 1000
        resetStates()
    }
}


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
