global debugStoredData := ""

showToolTip(value, time = 600, locationX = 0, locationY = 0)
{
    if (locationX && locationY)
    {
        tooltip, |%value%|, %locationX%, %locationY%
    }
    else
    {
        tooltip, |%value%|
    }
    sleep %time%
    tooltip
}

debug(value)
{
    if (logInput)
    {
        writeMemoryStream(value)
    }
}

writeMemoryStream(value)
{
    realShift := GetKeyState("shift")
    realCtrl := GetKeyState("ctrl")
    realAlt := GetKeyState("alt")
    realWin := GetKeyState("lwin")
    space := GetKeyState("space", "P")
    keysPressed := ""
    if (activePressedKeys.Length())
    {
        For index, value in activePressedKeys
        {
            keysPressed := keysPressed . value 
        }
    }
    result = %A_Hour%:%A_Min%:%A_Sec%:%A_MSec%|%value%|layoutPressed=%space%|alternativeLayout=%layoutKeyPressed%|keysPressed=%keysPressed%|ProcessKeyOnRelease=%processKeyOnRelease%|keyToSendOnUp=%keyToSendOnUp%|layoutKeyActivatesProcessKeyOnRelease=%layoutKeyActivatesProcessKeyOnRelease%|RealShift=%realShift%|RealCtrl=%realCtrl%|RealAlt=%realAlt%|RealWin=%realWin%|^=%ctrlActive%`|!=%altActive%|+=%shiftActive%|#=%winActive%|`n
    debugStoredData .= result
    if (StrLen(debugStoredData) > 50000)
    {
        StringTrimLeft, debugStoredData, debugStoredData, 20000
        debugStoredData := "------------------------TRIMMED------------------------" . debugStoredData
    }
}

storeDebugData(fileName = "")
{
    if (logInput)
    {
        if (!fileName)
        {
            fileName = %A_Hour%-%A_Min%-%A_Sec%-%A_MSec%-stored-log.txt
        }
        else
        {
            fileName = %fileName%-%A_Hour%-%A_Min%-%A_Sec%-%A_MSec%.txt
        }

        showtooltip(fileName)
        FileAppend, %debugStoredData%, %A_Desktop%\%fileName%
        debugStoredData := ""
    }
}
