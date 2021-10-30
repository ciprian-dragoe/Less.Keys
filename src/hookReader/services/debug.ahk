exitHookReader()
{
    exitApp
}

reloadHookReader()
{
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

isAnyModifierKeyPressed()
{
    for index, key in MONITORED_STICKY_KEYS
    {
        if (getKeyState(key, "P"))
        {
            return 1
        }
    }

    return 0
}
