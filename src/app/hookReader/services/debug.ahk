exitHookReader()
{
    PostMessage, %APP_MESSAGE_FORCE_QUIT%, 0, 0, , %TARGET_HANDLER_SCRIPT%
    showToolTip("EXIT")
    exitApp
}

reloadHookReader()
{
    BlockInput, On
    showToolTip("RELOADING", 1000)
    reload
}

toggleLessKeysState(state)
{
    IS_LESS_KEYS_ENABLED := state
    showtooltip("LessKeys = " . state)
}

resetHookMonitoring()
{
    Suspend, On
    Suspend, Off
}

storeDebugLogHookReader()
{
    name = %A_Hour%-%A_Min%-%A_Sec%-%A_MSec%-hook-reader.txt
    storeDebugData(name)
}
