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
        SetTimer, TimerScrollWithMouseMovement, %timeoutMouseScrollPoll%
        keywait, %keyRemappedAsRightButton%
        SetTimer, TimerScrollWithMouseMovement, OFF
        systemCursor(1)
        if (sendRightMouseButton)
        {
            send {blind}{rbutton}
        }
        return
    }
    
}
