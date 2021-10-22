global IS_LESS_KEYS_ENABLED := 1
global keyUpHandler
global keyDownHandler


sendKeyDownToExecutable(key)
{
    PostMessage, 0x1000, %key%, 0, , %TARGET_HANDLER_SCRIPT%
}

sendKeyDownToDebug(key)
{
    key := GetKeySC(key)
    PostMessage, 0x1000, %key%, 0, , %TARGET_HANDLER_SCRIPT%
}

sendKeyUpToExecutable(key)
{
    PostMessage, 0x1001, GetKeySC(key), 0, , %TARGET_HANDLER_SCRIPT%
}

sendKeyUpToDebug(key)
{
    PostMessage, 0x1001, GetKeySC(key), 0, , %TARGET_HANDLER_SCRIPT%
}

toggleLessKeysEnabledMode()
{
    IS_LESS_KEYS_ENABLED := !IS_LESS_KEYS_ENABLED
}


onMessage(0x1000, "toggleLessKeysEnabledMode")
if (IS_RUNNING_DEBUG_MODE)
{
    keyDownHandler := func("sendKeyDownToDebug")
    keyUpHandler := func("sendKeyUpToDebug")
}
else
{
    keyDownHandler := func("sendKeyDownToExecutable")
    keyUpHandler := func("sendKeyUpToExecutable")
}

sendKeyDown(key)
{
    keyDownHandler.call(key)
}

sendKeyUp(key)
{
    keyDownHandler.call(key)
}
