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
        if (isModifierKey(newValueForKey))
        {
            monitoredStickyKeys.Push(originalKey)
        } 
        else if (newValueForKey = "rbutton")
        {
            keyRemappedAsRightButton := originalKey
        }
        
        specialCharacter := accentedCharacter[newValueForKey]
        if (specialCharacter)
        {
            keyboardShortcuts["+" . specialCharacter] := 500
            layout[originalKey] := specialCharacter
        }
        else
        {
            layout[originalKey] := newValueForKey
        }
    }
}

isModifierKey(key)
{
    return key = "ctrl" || key = "alt" || key = "shift" || key = "lwin" || key = "rightShiftClick" || key = "leftShiftClick" || key = "leftCtrlClick" || key = "rightCtrlClick" || key = "leftAltClick" || key = "rightAltClick" || key = "leftWinClick" || key = "rightWinClick"
}
