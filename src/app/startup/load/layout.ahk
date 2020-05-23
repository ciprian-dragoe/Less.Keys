global monitoredStickyKeys := []
global layout
global keyRemappedAsRightButton



readLayoutFile(path)
{
    layout:=Object()
    commentPattern := "###"
    Loop, read, %path%
    {
        IfInString, A_LoopReadLine, %commentPattern%
        {
            continue
        }
        originalKey := StrSplit(A_LoopReadLine, "`:").1
        newValueForKey := StrSplit(A_LoopReadLine, "`:").2
        if (newValueForKey = "ctrl")
        {
            addToMonitoredStickyKeys(originalKey, newValueForKey)
        } 
        else if (newValueForKey = "alt")
        {
            addToMonitoredStickyKeys(originalKey, newValueForKey)
        }
        else if (newValueForKey = "shift")
        {
            addToMonitoredStickyKeys(originalKey, newValueForKey)
        }
        else if (newValueForKey = "lwin")
        {
            addToMonitoredStickyKeys(originalKey, newValueForKey)
        }
        else if (newValueForKey = "rbutton")
        {
            keyRemappedAsRightButton := originalKey
        }
        else if (newValueForKey = "shiftClick")
        {
            monitoredStickyKeys.Push(originalKey)
        }
        else if (newValueForKey = "ctrlClick")
        {
            monitoredStickyKeys.Push(originalKey)
        }
        else if (newValueForKey = "altClick")
        {
            monitoredStickyKeys.Push(originalKey)
        }
        else if (newValueForKey = "winClick")
        {
            monitoredStickyKeys.Push(originalKey)
        }
        
        layout[originalKey] := newValueForKey
    }
}

addToMonitoredStickyKeys(originalKey, newValueForKey)
{
    monitoredStickyKeys.Push(originalKey)
}
