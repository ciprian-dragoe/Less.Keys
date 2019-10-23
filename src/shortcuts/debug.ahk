deactivateLayout()
{
	if navigationMode = 0 
    	{
    		navigationMode = 1
    		showToolTip("AlternativeMode ON")
    		resetStates()
    		return
    	}
    	else
    	{
    		navigationMode = 0
    		showToolTip("NORMAL")
    		resetStates()
    		return
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
