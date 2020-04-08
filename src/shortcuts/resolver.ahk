#include  %A_ScriptDir%\shortcuts\debug.ahk

processShortcut(index)
{
    if (index = 1)
    {
        reloadApp()
        return
    }
    if (index = 2)
    {
        displayDebugData()
        return
    }
    if (index = 3)
    {
        storeDebugData()
        return
    }
    if (index = 1026)
    {
        sendRightMouseButton := true
        CoordMode, Mouse, Screen
        MouseGetPos, initialMousePositionXAxis, initialMousePositionYAxis
        SetTimer, TimerGetMouseMovement, %timeoutMouseScrollPoll%
        keywait, %keyRemappedAsRightButton%
        SetTimer, TimerGetMouseMovement, OFF
        systemCursor(1)
        if (sendRightMouseButton)
        {
            send {rbutton}
        }
        return
    }
    
}
