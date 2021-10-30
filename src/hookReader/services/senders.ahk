global IS_LESS_KEYS_ENABLED := 1
global KEY_UP_HANDLER
global KEY_DOWN_HANDLER


sendKeyDownToExecutable(key)
{
    key := GetKeySC(key)
    PostMessage, %APP_MESSAGE_PROCESS_KEY_DOWN%, %key%, 0, , %SCRIPT_HOOKS_HANDLER%
}

sendKeyDownToDebug(key)
{
    key := GetKeySC(key)
    PostMessage, %APP_MESSAGE_PROCESS_KEY_DOWN%, %key%, 0, , %SCRIPT_HOOKS_HANDLER%
}

sendKeyUpToExecutable(key)
{
    key := GetKeySC(key)
    PostMessage, %APP_MESSAGE_PROCESS_KEY_UP%, %key%, 0, , %SCRIPT_HOOKS_HANDLER%
}

sendKeyUpToDebug(key)
{
    key := GetKeySC(key)
    PostMessage, %APP_MESSAGE_PROCESS_KEY_UP%, %key%, 0, , %SCRIPT_HOOKS_HANDLER%
}

sendKeyDown(key)
{
    debug("  |D| " . key)
    KEY_DOWN_HANDLER.call(key)
}

sendKeyUp(key)
{
    debug("  |U| " . key)
    KEY_UP_HANDLER.call(key)
}


if (IS_RUNNING_DEBUG_MODE)
{
    KEY_DOWN_HANDLER := func("sendKeyDownToDebug")
    KEY_UP_HANDLER := func("sendKeyUpToDebug")
}
else
{
    KEY_DOWN_HANDLER := func("sendKeyDownToExecutable")
    KEY_UP_HANDLER := func("sendKeyUpToExecutable")
}

