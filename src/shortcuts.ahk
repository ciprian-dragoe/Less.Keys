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
    
}
