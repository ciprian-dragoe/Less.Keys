global debugStoredData := ""



resetStates()
{
    send {lwin up}{ctrl up}{alt up}{shift up}
    activePressedKeys := []
    processKeyOnRelease := false
    layoutKeyPressed := false
    alternativeLayoutActive := false 
    sendLayoutKey := false
    stopManagingLayoutKey :=false 
    keyToSendOnUp := ""
    lastKeyProcessedAsAlternative := ""
    ctrlActive := false
    altActive := false
    shiftActive := false
    winActive := false
}


debug(value)
{
    if (logInput)
        writeMemoryStream(value)
}


showToolTip(value)
{
    tooltip, |%value%|
    sleep 600
    tooltip
}


writeMemoryStream(value)
{
    keyPressNr := activePressedKeys.Length()
	textToSend = %A_Hour%:%A_Min%:%A_Sec%:%A_MSec%|%value%|layoutPressed=%layoutKeyPressed%|alternativeLayout=%alternativeLayoutActive%|PressedKeysNr=%keyPressNr%|ProcessKeyOnRelease=%processKeyOnRelease%|keyToSendOnUp=%keyToSendOnUp%|^=%ctrlActive%`|!=%altActive%|+=%shiftActive%`n
    debugStoredData .= textToSend
    if (StrLen(debugStoredData) > 8000)
    {
        StringTrimLeft, debugStoredData, debugStoredData, 4000     
    }
}
