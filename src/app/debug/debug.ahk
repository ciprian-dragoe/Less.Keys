global debugStoredData := ""
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
    realShift := GetKeyState("shift")
    realCtrl := GetKeyState("ctrl")
    result = %A_Hour%:%A_Min%:%A_Sec%:%A_MSec%|%value%|RealShift=%realShift%|RealCtrl=%realCtrl%|^=%ctrlActive%`|!=%altActive%|+=%shiftActive%|#=%winActive%|layoutPressed=%layoutKeyPressed%|alternativeLayout=%alternativeLayoutActive%|keysPressed=%keysPressed%|ProcessKeyOnRelease=%processKeyOnRelease%|keyToSendOnUp=%keyToSendOnUp%|sendClickOnLeftCtrlClickRelease=%sendClickOnLeftCtrlClickRelease%|isLeftCtrlClickDown=%isLeftCtrlClickDown%|sendClickOnRightCtrlClickRelease=%sendClickOnRightCtrlClickRelease%|sendClickOnRightShiftClickRelease=%sendClickOnRightShiftClickRelease%|fixQuickTypeLeftRightDoubledModifiers=%fixQuickTypeLeftRightDoubledModifiers%|isRightAltDoubledAsClickPressed=%isRightAltDoubledAsClickPressed%|isRightCtrlDoubledAsClickPressed=%isRightCtrlDoubledAsClickPressed%|isRightWinDoubledAsClickPressed=%isRightWinDoubledAsClickPressed%|isRightShiftDoubledAsClickPressed=%isRightShiftDoubledAsClickPressed%`n
    debugStoredData .= result
    if (StrLen(debugStoredData) > 150000)
    {
        StringTrimLeft, debugStoredData, debugStoredData, 75000
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
    showToolTip("showRealTimeDebugInfo = " . showRealTimeDebugInfo)
}

timerRealTimeDebug(displayTime = 1000)
{
    info := geStickyKeys()
    showToolTip(info, displayTime)
}

geStickyKeys()
{
    info := ""
    info .= "shift down " . GetKeyState("shift") . " |shiftActive=" . shiftActive . "`n"
    info .= "ctrl down " . GetKeyState("ctrl") . " |ctrlActive=" . ctrlActive . "`n"
    info .= "alt down " . GetKeyState("alt") . " |altActive=" . altActive . "`n"
    info .= "lwin down " . GetKeyState("lwin") . " |winActive=" . winActive . "`n"
    info .= "rwin down " . GetKeyState("rwin") . " |winActive=" . winActive . "`n"
    info .= "lbutton=" . GetKeyState("lbutton") . "`n"
    info .= "|isLeftCtrlClickDown " . isLeftCtrlClickDown . "|isLeftShiftClickDown " . isLeftShiftClickDown . "|isLeftAltClickDown " . isLeftAltClickDown . "|isLeftWinClickDown " . isLeftWinClickDown . "`n"
    info .= "|isRightWinClickDown " . isRightWinClickDown . "|isRightCtrlClickDown " . isRightCtrlClickDown . "|isRightShiftClickDown " . isRightShiftClickDown . "|isRightAltClickDown " . isRightAltClickDown . "`n"
    info .= "layoutPressed=" . layoutKeyPressed . "`n"
    info .= "alternativeLayout=" . alternativeLayoutActive . "`n"

    result := ""
    for index, value in monitoredStickyKeys
    {
        result .= value . "=" . GetKeyState(value, "P") . "`n"
    }
    info .= result

    return info
}