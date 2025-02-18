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

sendProcessResultAnyModifierKeyPressed(wParam, lParam, msg, hwnd)
{
    for index, key in MONITORED_STICKY_KEYS
    { 
        if (getKeyState(key, "P"))
        {
            ;showtooltip(key . "|" . getKeyState(key, "P"))
            DetectHiddenWindows On
            SendMessage, %APP_MESSAGE_CONTINUE_MONITOR_STICKY%, 0, 0, , %SCRIPT_HOOKS_HANDLER%
            return
        }
    }
    
    DetectHiddenWindows On
    SendMessage, %APP_MESSAGE_RESET_STICKY%, 0, 0, , %SCRIPT_HOOKS_HANDLER%
}
