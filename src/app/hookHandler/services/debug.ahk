global REAL_TIME_DEBUG

storeDebugLogHookHandler()
{
    storeDebugData(%A_Hour%-%A_Min%-%A_Sec%-%A_MSec%-hooks-handler.txt)
}

exitHookHandler()
{
    PostMessage, %APP_MESSAGE_FORCE_QUIT%, 0, 0, , %TARGET_HANDLER_SCRIPT%
    exitApp
}

reloadHookHandler()
{
    showToolTip("RELOADING")
    reload
}

toggleRealTimeDebug()
{
    if (REAL_TIME_DEBUG)
    {
        REAL_TIME_DEBUG := false
        SetTimer, TimerRealTimeDebug, off
    }
    else
    {
        REAL_TIME_DEBUG := true
        SetTimer, TimerRealTimeDebug, 1000
    }
    showToolTip("toggleRealTimeDebug = " . REAL_TIME_DEBUG)
}

timerRealTimeDebug(displayTime = 1000)
{
    info := getStickyKeys()
    showToolTip(info, displayTime)
}

getStickyKeys()
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
    info .= "isLessKeysEnabled=" . isLessKeysEnabled . "`n"

    result := ""
    for index, value in monitoredStickyKeys
    {
        result .= value . "=" . GetKeyState(value, "P") . "`n"
    }
    info .= result

    return info
}

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
