global layoutChangeKey
global alternativeLayout


readAlternativeLayoutFile(path)
{
    FileReadLine, layoutChangeKey, %path%, 1
    layoutChangeKey := StrSplit(layoutChangeKey, "`:").2
    monitoredStickyKeys.Push(layoutChangeKey)
    alternativeLayout:=Object()
    Loop, read, %path%
    {
        IfInString, A_LoopReadLine, ### ;if line has ### in it, is a comment and skip
        { 
            continue
        }
        normalKey := StrSplit(A_LoopReadLine, "`:").1
        alternativeKey := StrSplit(A_LoopReadLine, "`:").2
        
        specialCharacter := accentedCharacter[alternativeKey]
        if (specialCharacter)
        {
            keyboardShortcuts["+" . specialCharacter] := 500
            alternativeLayout[normalKey] := specialCharacter
        }
        else
        {
            alternativeLayout[normalKey] := alternativeKey
        }
    }
}
