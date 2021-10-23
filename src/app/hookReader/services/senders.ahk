global IS_LESS_KEYS_ENABLED := 1
global KEY_UP_HANDLER
global KEY_DOWN_HANDLER


sendKeyDownToExecutable(key)
{
    key := GetKeySC(key)
    PostMessage, %APP_MESSAGE_PROCESS_KEY_DOWN%, %key%, 0, , %TARGET_HANDLER_SCRIPT%
}

sendKeyDownToDebug(key)
{
    key := GetKeySC(key)
    PostMessage, %APP_MESSAGE_PROCESS_KEY_DOWN%, %key%, 0, , %TARGET_HANDLER_SCRIPT%
}

sendKeyUpToExecutable(key)
{
    key := GetKeySC(key)
    PostMessage, %APP_MESSAGE_PROCESS_KEY_UP%, %key%, 0, , %TARGET_HANDLER_SCRIPT%
}

sendKeyUpToDebug(key)
{
    key := GetKeySC(key)
    PostMessage, %APP_MESSAGE_PROCESS_KEY_UP%, %key%, 0, , %TARGET_HANDLER_SCRIPT%
}

sendKeyDown(key)
{
    ;setTimer TimerCheckAgainIfTimerTriggeredBeforeKeyLift, off ; TODO wobbly win key
    SetTimer TimerStickyFailBack, off
    SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
    KEY_DOWN_HANDLER.call(key)
}

sendKeyUp(key)
{
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

