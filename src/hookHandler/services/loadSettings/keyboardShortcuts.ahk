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
        combination := StrSplit(A_LoopReadLine, "`:").1
        if (!combination)
        {
            continue
        }
        key := getKeyWithoutModifiers(combination)
        modifiers := StrReplace(combination, key, "")
        validatedKey := GetKeyName(Format("sc{:x}", GetKeySC(key)))
        if (validatedKey)
        {
            combination := modifiers . validatedKey
        }
        keyboardShortcuts[combination] := action
    }
}

