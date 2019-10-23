global timeoutStillSendLayoutKey
global timeoutProcessLayoutOnRelease
global logInput
global alternativeLayout
global modifierKeys
global layout
global keyboardShortcuts
global layoutChangeKey



readLayoutFile("my-layout.cfg")
readAlternativeLayoutFile("my-alternative-layout.cfg")
readSettingsFile("my-settings.cfg")
readKeyboardShortcutsFile("my-keyboard-shortcuts.cfg")
resetStates()



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
            modifierKeys[StrSplit(A_LoopReadLine, "`:").1] := "ctrl"
        } 
        else if (remappedKey = "alt")
        {
            modifierKeys[StrSplit(A_LoopReadLine, "`:").1] := "alt"
        }
        else if (remappedKey = "shift")
        {
            modifierKeys[StrSplit(A_LoopReadLine, "`:").1] := "shift"
        }
        else if (remappedKey = "lwin")
        {
            modifierKeys[StrSplit(A_LoopReadLine, "`:").1] := "lwin"
        }
        
        layout[StrSplit(A_LoopReadLine, "`:").1] := remappedKey
    }
}

readAlternativeLayoutFile(path)
{
    FileReadLine, layoutChangeKey, %path%, 1
    layoutChangeKey := StrSplit(layoutChangeKey, "`:").2 
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

readKeyboardShortcutsFile(path)
{
    keyboardShortcuts:=Object()
    Loop, read, %path%
    {
        IfInString, A_LoopReadLine, ### ;if line has ### in it, is a comment and skip
        { 
            continue
        }
        action := StrSplit(A_LoopReadLine, "`:").2
        keyboardShortcuts[StrSplit(A_LoopReadLine, "`:").1] := action
    }
}

readSettingsFile(path)
{
    IniRead, timeoutStillSendLayoutKey, %path%, timings, timeoutStillSendLayoutKey
    IniRead, timeoutProcessLayoutOnRelease, %path%, timings, timeoutProcessLayoutOnRelease
    IniRead, logInput, %path%, logging, logInput
}
