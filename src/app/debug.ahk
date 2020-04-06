global debugStoredData := ""
global logInput



resetStates()
{
    send {lwin up}{ctrl up}{alt up}{shift up}
    activePressedKeys := []
    processKeyOnRelease := false
    layoutKeyPressed := false
    alternativeLayoutActive := false 
    sendLayoutKey := false
    keyToSendOnUp := ""
    lastKeyProcessedAsAlternative := ""
    ctrlActive := false
    altActive := false
    shiftActive := false
    winActive := false
    systemCursor(1)
}

debug(value)
{
    if (logInput)
        writeMemoryStream(value)
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
    for index , key in activePressedKeys {
        keysPressed .= key
    }
	textToSend = %A_Hour%:%A_Min%:%A_Sec%:%A_MSec%|%value%|layoutPressed=%layoutKeyPressed%|alternativeLayout=%alternativeLayoutActive%|keysPressed=%keysPressed%|ProcessKeyOnRelease=%processKeyOnRelease%|keyToSendOnUp=%keyToSendOnUp%|^=%ctrlActive%`|!=%altActive%|+=%shiftActive%|#=%winActive%`n
    debugStoredData .= textToSend
    if (StrLen(debugStoredData) > 8000)
    {
        StringTrimLeft, debugStoredData, debugStoredData, 4000     
    }
}
