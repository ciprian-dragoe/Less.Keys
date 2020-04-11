global debugStoredData := ""
global logInput
global showRealTimeDebugInfo := false



resetStates()
{
    if (showRealTimeDebugInfo)
    {
        showToolTip("reset states")
    }
    send {shift up}
    send {alt up}
    send {ctrl up}
    send {lwin up}
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
	result = %A_Hour%:%A_Min%:%A_Sec%:%A_MSec%|%value%|layoutPressed=%layoutKeyPressed%|alternativeLayout=%alternativeLayoutActive%|keysPressed=%keysPressed%|ProcessKeyOnRelease=%processKeyOnRelease%|keyToSendOnUp=%keyToSendOnUp%|lastKeyProcessedAsAlternative=%lastKeyProcessedAsAlternative%|^=%ctrlActive%`|!=%altActive%|+=%shiftActive%|#=%winActive%`n
    debugStoredData .= result
    if (StrLen(debugStoredData) > 8000)
    {
        StringTrimLeft, debugStoredData, debugStoredData, 4000     
    }
}

toggleRealTimeDebug(onOff)
{
    if (onOff)
    {
        showRealTimeDebugInfo := false
        SetTimer, TimerRealTimeDebug, off
    }
    else
    {
        showRealTimeDebugInfo := true
        SetTimer, TimerRealTimeDebug, 1000
    }
    showtoolTip("showRealTimeDebugInfo = " . showRealTimeDebugInfo)
}

timerRealTimeDebug()
{
    info := "`n"
    info .= "is shift down " . GetKeyState("shift") . " shiftActive=" . shiftActive . "`n"
    info .= "is ctrl down " . GetKeyState("ctrl") . " ctrlActive=" . ctrlActive . "`n"
    info .= "is alt down " . GetKeyState("alt") . " altActive=" . altActive . "`n"
    info .= "is lwin down " . GetKeyState("lwin") . " winActive=" . winActive . "`n"
    info .= "is rwin down " . GetKeyState("rwin") . " winActive=" . winActive . "`n"
    info .= "layoutPressed=" . layoutKeyPressed . "`n"
    info .= "alternativeLayout=" . alternativeLayoutActive . "`n"
    result := ""
    for index, value in activePressedKeys
    {
        result .= " " . value 
    }
    info .= "activePressedKeys=|" . result . "|`n"
    result := ""
    for index, value in monitoredStickyKeys
    {
        result .= value . "=" . GetKeyState(value, "P") . "`n" 
    }
    info .= result
    result := ""
    for index, value in activeStickyKeys
    {
        result .= " " . value 
    }
    info .= "activePressedStickyKeys=|" . result . "|`n"
    showToolTip(info, 1000)
}
