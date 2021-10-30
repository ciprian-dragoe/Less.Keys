; when the processor it under heavy load some messages might not be caught in time
; to reduce such situations, give the onMessage functions higher priority and the
; rest of the functions lower priority so that onMessage functions can always interrupt
; them. Basically it's a very simple implementation of an event loop


global eventLoop := []
global isEventLoopBeingProcessed := 0


addKeyDownToEventLoop(key)
{
    critical
    eventLoop.push(func("processKeyDown").bind(key))
    if (!isEventLoopBeingProcessed)
    {
        setTimer TimerProcessEventLoop, -10, -1000
    }
    critical off
}

addKeyUpToEventLoop(key)
{
    critical
    eventLoop.push(func("processKeyUp").bind(key))
    if (!isEventLoopBeingProcessed)
    {
        setTimer TimerProcessEventLoop, -10, -1000
    }
    critical off
}

TimerProcessEventLoop()
{
    isEventLoopBeingProcessed := 1
    Loop
    {
        if (eventLoop.length())
        {
            eventLoop[1].call()
            eventLoop.remove(1)
        }
        else
        {
            break
        }
    }
    isEventLoopBeingProcessed := 0
}


onMessage(APP_MESSAGE_PROCESS_KEY_DOWN, "addKeyDownToEventLoop")
onMessage(APP_MESSAGE_PROCESS_KEY_UP, "addKeyUpToEventLoop")
onMessage(APP_MESSAGE_FORCE_QUIT, "exitHookHandler")
onMessage(APP_MESSAGE_FORCE_RELOAD, "reloadHookHandler")
onMessage(APP_MESSAGE_RESET_HOOK_MONITORING, "restartHookHandlerMonitoring")
onMessage(APP_MESSAGE_STORE_DEBUG_LOG, "storeDebugLogHookHandler")
