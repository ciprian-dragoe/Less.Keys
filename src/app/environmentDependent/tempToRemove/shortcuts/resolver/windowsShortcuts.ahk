screenSleep()
{
    sleep 500
    Run, %SCREEN_SLEEP_PATH% monitor off
    sleep 500
    Run, %SCREEN_SLEEP_PATH% monitor off
}

showDesktop()
{
    send {blind}d
;    sendKeyCombinationIndependentActiveModifiers("{escape}#d")
}

toggleAlwaysOnTop()
{
    tooltip ALWAYS TOP TOGGLE
    sleep 400
    tooltip
    Winset, Alwaysontop, , A
}

showTime()
{
    send {blind}!d
;    sendKeyCombinationIndependentActiveModifiers("#!d")
}