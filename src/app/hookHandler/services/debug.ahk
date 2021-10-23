storeDebugLogHookHandler()
{
    PostMessage, %APP_MESSAGE_STORE_DEBUG_LOG%, 0, 0, , %TARGET_HANDLER_SCRIPT%
    storeDebugData(%A_Hour%-%A_Min%-%A_Sec%-%A_MSec%-hooks-handler.txt)
}

exitHookHandler()
{
    PostMessage, %APP_MESSAGE_FORCE_QUIT%, 0, 0, , %TARGET_HANDLER_SCRIPT%
    exitApp
}

reloadHookHandler()
{
    showToolTip("RELOADING")
    reload
}

displayDebugData()
{
    clipboard := debugStoredData
    msgbox % debugStoredData
}
