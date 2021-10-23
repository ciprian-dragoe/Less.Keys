; if the cpu is executing intensive tasks then the lift key up command may not be processed for
; modifier keys (ctrl, shift, alt, win) and they are still registered by the os as pressed.
; This is a fail safe for such situations
timerStickyFailBack()
{
    SetTimer TimerStickyFailBack, off

    if (!isAllMonitoredStickyKeysLifted())
    {
        SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
        return
    }

    debug("---CHECK AGAIN STICKY TO MEASURE FALSE POSITIVE") ; merge multiple debugging info from multiple files
    setTimer TimerCheckAgainIfTimerTriggeredBeforeKeyLift, 300
}

isAllMonitoredStickyKeysLifted()
{
    for index, key in monitoredStickyKeys
    {
        if (getKeyState(key, "P"))
        {
            debug("STICKY TIMER RESET => " . key . " pressed")
            return 0
        }
    }

    return 1
}

timerCheckAgainIfTimerTriggeredBeforeKeyLift()
{
    setTimer TimerCheckAgainIfTimerTriggeredBeforeKeyLift, OFF
    critical on
    if (isAllMonitoredStickyKeysLifted())
    {
        PostMessage, %APP_MESSAGE_RESET_STATES%, 0, 0, , %TARGET_HANDLER_SCRIPT%
    }
    critical off
}

getDllKeyState(key)
{
    keyCode := GetKeyVK(key)
    discardHistory := dllcall("GetAsyncKeyState", "uint", keyCode)
    keyPressedState := dllcall("GetAsyncKeyState", "uint", keyCode)
    return keyPressedState
}
