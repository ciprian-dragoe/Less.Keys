global debugStoredData := ""
global logInput
global showRealTimeDebugInfo := false



debug(value)
{
    if (logInput)
    {
        writeMemoryStream(value)
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
    result = %A_Hour%:%A_Min%:%A_Sec%:%A_MSec%|%value%|layoutPressed=%layoutKeyPressed%|alternativeLayout=%alternativeLayoutActive%|keysPressed=%keysPressed%|ProcessKeyOnRelease=%processKeyOnRelease%|keyToSendOnUp=%keyToSendOnUp%|lastKeyProcessedAsAlternative=%lastKeyProcessedAsAlternative%|^=%ctrlActive%`|!=%altActive%|+=%shiftActive%|#=%winActive%|sendClickOnRightShiftClickRelease%sendClickOnRightShiftClickRelease%|sendClickOnLeftShiftClickRelease=%sendClickOnLeftShiftClickRelease%|fixQuickTypeLeftRightDoubledModifiers=%fixQuickTypeLeftRightDoubledModifiers%|lastPressedKey=%lastPressedKey%|lastPressedKeyTime=%lastPressedKeyTime%`n
    debugStoredData .= result
    if (StrLen(debugStoredData) > 100000)
    {
        StringTrimLeft, debugStoredData, debugStoredData, 5000  
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

timerRealTimeDebug(displayTime = 1000)
{
    info := "`n"
    info .= "shift down " . GetKeyState("shift") . " shiftActive=" . shiftActive . "`n"
    info .= "ctrl down " . GetKeyState("ctrl") . " ctrlActive=" . ctrlActive . "`n"
    info .= "alt down " . GetKeyState("alt") . " altActive=" . altActive . "`n"
    info .= "lwin down " . GetKeyState("lwin") . " winActive=" . winActive . "`n"
    info .= "rwin down " . GetKeyState("rwin") . " winActive=" . winActive . "`n"
    info .= "layoutPressed=" . layoutKeyPressed . "`n"
    info .= "alternativeLayout=" . alternativeLayoutActive . "`n"

    result := ""
    for index, value in monitoredStickyKeys
    {
        result .= value . "=" . GetKeyState(value, "P") . "`n" 
    }
    info .= result
    
    showToolTip(info, displayTime)
}
