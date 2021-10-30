global monitoredStickyKeys := []
global layout


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
        originalKey := GetKeyName(Format("sc{:x}", GetKeySC(originalKey)))
        newValueForKey := StrSplit(A_LoopReadLine, "`:").2

        if (isModifierKey(newValueForKey))
        {
            monitoredStickyKeys.Push(originalKey)
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
