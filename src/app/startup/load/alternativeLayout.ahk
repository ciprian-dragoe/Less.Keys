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
        remappedKey := StrSplit(A_LoopReadLine, "`:").2
        alternativeLayout[StrSplit(A_LoopReadLine, "`:").1] := remappedKey
    }
}
