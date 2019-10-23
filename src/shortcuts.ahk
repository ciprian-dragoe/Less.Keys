#include  %A_ScriptDir%\shortcuts\debug.ahk

processShortcut(index)
{
    if (index = 1)
    {
        deactivateLayout()
        return
    }
    if (index = 2)
    {
        reloadApp()
        return
    }
    if (index = 3)
    {
        displayDebugData()
        return
    }
    if (index = 4)
    {
        storeDebugData()
        return
    }
    
}
