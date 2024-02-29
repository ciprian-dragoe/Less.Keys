global REAL_TIME_DEBUG

exitLessKeys()
{
    PostMessage, %APP_MESSAGE_FORCE_QUIT%, 0, 0, , %SCRIPT_LESSKEYS%
}

exitHookHandler()
{
    exitApp
}

restartHookHandlerMonitoring()
{
    return
}

reloadLessKeys()
{
    DetectHiddenWindows On
    PostMessage, %APP_MESSAGE_FORCE_RELOAD%, 0, 0, , %SCRIPT_LESSKEYS%
}

reloadHookHandler()
{
    logInput := 0
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
    info .= "win down " . GetKeyState("lwin") . " |winActive=" . winActive . "`n"
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

storeDebugLogLessKeys()
{
    PostMessage, %APP_MESSAGE_STORE_DEBUG_LOG%, 0, 0, , %SCRIPT_LESSKEYS%
}

storeDebugLogHookHandler()
{
    name = %A_Hour%-%A_Min%-%A_Sec%-%A_MSec%-hook-handler.txt
    storeDebugData(name)
}

sendTestMessage()
{
    sendKeyCombinationIndependentActiveModifiers("INTEGRATION_TEST")
}
