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
    result = %A_Hour%:%A_Min%:%A_Sec%:%A_MSec%|%value%|RealShift=%realShift%|RealCtrl=%realCtrl%|RealAlt=%realAlt%|RealWin=%realWin%|^=%ctrlActive%`|!=%altActive%|+=%shiftActive%|#=%winActive%|layoutPressed=%space%|alternativeLayout=%layoutKeyPressed%|ProcessKeyOnRelease=%processKeyOnRelease%|keyToSendOnUp=%keyToSendOnUp%|layoutKeyActivatesProcessKeyOnRelease=%layoutKeyActivatesProcessKeyOnRelease%`n
    debugStoredData .= result
    if (StrLen(debugStoredData) > 120000)
    {
        StringTrimLeft, debugStoredData, debugStoredData, 50000
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
