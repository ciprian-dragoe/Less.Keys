global modifierKeys
global layout



readLayoutFile(path)
{
    modifierKeys:=Object()
    layout:=Object()
    Loop, read, %path%
    {
        IfInString, A_LoopReadLine, ### ;if line has ### in it, is a comment and skip
        {
            continue
        }
        remappedKey := StrSplit(A_LoopReadLine, "`:").2
        if (remappedKey = "ctrl")
        {
            addModifier(A_LoopReadLine, "ctrl")
        } 
        else if (remappedKey = "alt")
        {
            addModifier(A_LoopReadLine, "alt")
        }
        else if (remappedKey = "shift")
        {
            addModifier(A_LoopReadLine, "shift")
        }
        else if (remappedKey = "lwin")
        {
            addModifier(A_LoopReadLine, "lwin")
        }
        
        layout[StrSplit(A_LoopReadLine, "`:").1] := remappedKey
    }
}

addModifier(alternative, forModifier) {
    modifierKeys[StrSplit(A_LoopReadLine, "`:").1] := forModifier
    checkStickyKeyList.Push(StrSplit(A_LoopReadLine, "`:").1)
}
