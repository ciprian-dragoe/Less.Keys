reloadApp()
{
    tooltip `n`nRELOADING
    SendMessage, %APP_MESSAGE_FORCE_QUIT%, 0, 0, , %SCRIPT_HOOKS_READER%
    SendMessage, %APP_MESSAGE_FORCE_RELOAD%, 0, 0, , %SCRIPT_HOOKS_HANDLER%
    sleep 300
    run %HOOK_READER%
    sleep 500
    run %HOOK_HANDLER%
    tooltip
}

exitLessKeys()
{
    tooltip `n`nEXIT
    SendMessage, %APP_MESSAGE_FORCE_QUIT%, 0, 0, , %SCRIPT_HOOKS_READER%
    sleep 300
    SendMessage, %APP_MESSAGE_FORCE_QUIT%, 0, 0, , %SCRIPT_HOOKS_HANDLER%
    tooltip
    exitApp
}

restartHooksMonitoring()
{
    SendMessage, %APP_MESSAGE_RESET_HOOK_MONITORING%, 0, 0, , %SCRIPT_HOOKS_READER%
    SendMessage, %APP_MESSAGE_RESET_HOOK_MONITORING%, 0, 0, , %SCRIPT_HOOKS_HANDLER%
}

storeDebugLog()
{
    SendMessage, %APP_MESSAGE_STORE_DEBUG_LOG%, 0, 0, , %SCRIPT_HOOKS_READER%
    SendMessage, %APP_MESSAGE_STORE_DEBUG_LOG%, 0, 0, , %SCRIPT_HOOKS_HANDLER%
}

startApp()
{
    tooltip `n`nLessKeys
    run %HOOK_READER%
    sleep 500
    run %HOOK_HANDLER%
    tooltip
}
