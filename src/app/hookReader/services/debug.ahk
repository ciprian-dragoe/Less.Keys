exitHookReader()
{
    PostMessage, %APP_MESSAGE_FORCE_QUIT%, 0, 0, , %TARGET_HANDLER_SCRIPT%
    showToolTip("EXIT")
    exitApp
}

reloadHookReader()
{
    reload
}

toggleLessKeysState()
{
    if (IS_LESS_KEYS_ENABLED)
    {
        showTooltip("LessKeys DISABLED")
        IS_LESS_KEYS_ENABLED := 0
    }
    else
    {
        showTooltip("LessKeys ACTIVE")
        IS_LESS_KEYS_ENABLED := 1
    }
}

resetHookMonitoring()
{
    Suspend, On
    Suspend, Off
}

showToolTip(value, time = 600)
{
    tooltip, |%value%|
    sleep %time%
    tooltip
}
