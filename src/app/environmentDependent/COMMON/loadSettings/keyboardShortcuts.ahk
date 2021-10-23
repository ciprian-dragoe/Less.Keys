global keyboardShortcuts := Object()


readKeyboardShortcutsFile(path)
{
    Loop, read, %path%
    {
        IfInString, A_LoopReadLine, ### ;if line has ### in it, is a comment and skip
        { 
            continue
        }
        action := StrSplit(A_LoopReadLine, "`:").2
        ; todo integrate key name based on vk code to real key name
        keyboardShortcuts[StrSplit(A_LoopReadLine, "`:").1] := action
    }
}
