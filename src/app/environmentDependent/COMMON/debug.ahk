debug(value)
{
    if (logInput)
    {
        writeMemoryStream(value)
    }
}

storeDebugData(fileName = "")
{
    if (logStickyKeys)
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
    }
}

showToolTip(value, time = 600)
{
    tooltip, |%value%|
    sleep %time%
    tooltip
}

writeMemoryStream(value)
{
    keysPressed := ""
    for index , key in activePressedKeys
    {
        keysPressed .= key
    }
    result = %A_Hour%:%A_Min%:%A_Sec%:%A_MSec%|%value%|^=%ctrlActive%`|!=%altActive%|+=%shiftActive%|#=%winActive%|layoutPressed=%layoutKeyPressed%|alternativeLayout=%alternativeLayoutActive%|keysPressed=%keysPressed%|ProcessKeyOnRelease=%processKeyOnRelease%|keyToSendOnUp=%keyToSendOnUp%|sendClickOnLeftCtrlClickRelease=%sendClickOnLeftCtrlClickRelease%|isLeftCtrlClickDown=%isLeftCtrlClickDown%|sendClickOnRightCtrlClickRelease=%sendClickOnRightCtrlClickRelease%|sendClickOnRightShiftClickRelease=%sendClickOnRightShiftClickRelease%|isRightAltDoubledAsClickPressed=%isRightAltDoubledAsClickPressed%|isRightCtrlDoubledAsClickPressed=%isRightCtrlDoubledAsClickPressed%|isRightWinDoubledAsClickPressed=%isRightWinDoubledAsClickPressed%|isRightShiftDoubledAsClickPressed=%isRightShiftDoubledAsClickPressed%`n
    debugStoredData .= result
    if (StrLen(debugStoredData) > 120000)
    {
        StringTrimLeft, debugStoredData, debugStoredData, 50000
    }
}
