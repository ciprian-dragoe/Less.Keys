global REAL_TIME_DEBUG

exitHookHandler()
{
    PostMessage, %APP_MESSAGE_FORCE_QUIT%, 0, 0, , %TARGET_HANDLER_SCRIPT%
    exitApp
}

reloadHookHandler()
{
    PostMessage, %APP_MESSAGE_FORCE_RESET%, 0, 0, , %TARGET_HANDLER_SCRIPT%
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

storeDebugLogHookHandler()
{
    PostMessage, %APP_MESSAGE_STORE_DEBUG_LOG%, 0, 0, , %TARGET_HANDLER_SCRIPT%
    name = %A_Hour%-%A_Min%-%A_Sec%-%A_MSec%-hook-handler.txt
    storeDebugData(name)
}
