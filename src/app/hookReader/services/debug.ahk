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

showToolTip(value, time = 600)
{
    tooltip, |%value%|
    sleep %time%
    tooltip
}
