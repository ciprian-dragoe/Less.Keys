global sendKeyDown
global sendKeyUp
global IS_LESS_KEYS_ENABLED


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
if (A_ScriptName = "keyHooks.exe")
{
    sendKeyDown := sendKeyDownToExecutable
    sendKeyUp := sendKeyUpToExecutable
}
else
{
    sendKeyDown := sendKeyDownToDebug
    sendKeyUp := sendKeyUpToDebug
}

