global timeoutStillSendLayoutKey
global timeoutProcessLayoutOnRelease
global timeoutMouseScrollPoll
global logInput
global alternativeLayout
global modifierKeys
global layout
global keyboardShortcuts
global layoutChangeKey
global mouseScrollAcceleration
global timerTimeoutStickyKeys := 2000
global totalDifferenceXAxis := 0
global totalDifferenceYAxis := 0
global checkStickyKeyList := ["lshift", "rshift", "lctrl", "rctrl", "ralt", "lalt", "lwin", "rwin"]
global activeProgramWindowName := ""
global activeProgramWindowClass := ""
global ignoredPrograms := []



readLayoutFile("my-layout.cfg")
readAlternativeLayoutFile("my-alternative-layout.cfg")
readSettingsFile("my-settings.cfg")
readKeyboardShortcutsFile("my-keyboard-shortcuts.cfg")
resetStates()
SetTimer, FixStickyKeys, %timerTimeoutStickyKeys%



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


readAlternativeLayoutFile(path)
{
    FileReadLine, layoutChangeKey, %path%, 1
    layoutChangeKey := StrSplit(layoutChangeKey, "`:").2
    checkStickyKeyList.Push(layoutChangeKey)
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
    IniRead, timeoutMouseScrollPoll, %path%, mouse, scrollPoll
    IniRead, mouseScrollAcceleration, %path%, mouse, scrollAcceleration
    IniRead, logInput, %path%, logging, logInput
    IniRead, appNames, %path%, disable, appNames
    disabledApps := StrSplit(appNames, "~~~")
    for index, app in disabledApps {
        GroupAdd, IgnoredApps, %app%
        ignoredPrograms.Push(app)
    }
}
