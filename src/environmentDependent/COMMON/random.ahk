getKeyWithoutModifiers(combination)
{
    result := StrReplace(combination, "^", "")
    result := StrReplace(result, "#", "")
    result := StrReplace(result, "!", "")
    result := StrReplace(result, "+", "")
    return result
}

ignoreShortcut()
{
    return
}

isModifierKey(key)
{
    return key = "lwin" || key = "rightShiftClick" || key = "leftShiftClick" || key = "leftCtrlClick" || key = "rightCtrlClick" || key = "leftAltClick" || key = "rightAltClick" || key = "leftWinClick" || key = "rightWinClick" || key = "ctrl" || key = "alt" || key = "shift"
}
