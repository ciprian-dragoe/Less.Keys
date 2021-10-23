storeDebugLogHookReader()
{
    storeDebugData(%A_Hour%-%A_Min%-%A_Sec%-%A_MSec%-hooks-read.txt)
}

exitHookReader()
{
    showToolTip("EXIT")
    PostMessage, %APP_MESSAGE_FORCE_QUIT%, 0, 0, , %TARGET_HANDLER_SCRIPT%
    exitApp
}

reloadHookReader()
{
    reload
}
