global IS_LESS_KEYS_ENABLED := 1
global keyUpHandler
global keyDownHandler


sendKeyDownToExecutable(key)
{
    PostMessage, 0x1000, %key%, 0, , processKey.exe
}

sendKeyDownToDebug(key)
{
    PostMessage, 0x1000, %key%, 0, , processKey.exe
}

sendKeyUpToExecutable(key)
{
    PostMessage, 0x1001, %key%, 0, , processKey.exe
}

sendKeyUpToDebug(key)
{
    PostMessage, 0x1001, %key%, 0, , processKey.exe
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
