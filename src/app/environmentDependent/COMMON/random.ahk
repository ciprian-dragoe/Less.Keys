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
