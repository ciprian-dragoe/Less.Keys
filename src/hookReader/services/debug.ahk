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
    DetectHiddenWindows On
    for index, key in MONITORED_STICKY_KEYS
    {
        if (getKeyState(key, "P"))
        {
            PostMessage, %APP_MESSAGE_IS_ANY_MODIFIER_KEY_PRESSED_HANDLE%, 0, 0, , %SCRIPT_HOOKS_HANDLER%
            return
        }
    }
    PostMessage, %APP_MESSAGE_IS_NOT_ANY_MODIFIER_KEY_PRESSED_HANDLE%, 0, 0, , %SCRIPT_HOOKS_HANDLER%
}
