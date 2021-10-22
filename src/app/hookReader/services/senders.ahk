global IS_LESS_KEYS_ENABLED := 1
global keyUpHandler
global keyDownHandler

sendKeyDownToExecutable(key)
{
    key := GetKeySC(key)
    PostMessage, 0x1000, %key%, 0, , %TARGET_HANDLER_SCRIPT%
}

sendKeyDownToDebug(key)
{
    key := GetKeySC(key)
    PostMessage, 0x1000, %key%, 0, , %TARGET_HANDLER_SCRIPT%
}

sendKeyUpToExecutable(key)
{
    key := GetKeySC(key)
    PostMessage, 0x1001, %key%, 0, , %TARGET_HANDLER_SCRIPT%
}

sendKeyUpToDebug(key)
{
    key := GetKeySC(key)
    PostMessage, 0x1001, %key%, 0, , %TARGET_HANDLER_SCRIPT%
}

toggleLessKeysEnabledMode()
{
    IS_LESS_KEYS_ENABLED := !IS_LESS_KEYS_ENABLED
    tooltip active=%IS_LESS_KEYS_ENABLED%
    sleep 500
    tooltip
    counter := 0
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
    keyUpHandler.call(key)
}
