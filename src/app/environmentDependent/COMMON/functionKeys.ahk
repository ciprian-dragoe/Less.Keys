sendFunctionKey(combination, index)
{
    validModifiers := "^+!"
    modifiers := extractValidModifiers(combination, validModifiers)
    number := "F" + Mod(index, functionKeysStartIndexMinusOne)
    final := "{lwin up}{" . number . "}{lwin down}"
    processKeyToSend(final, true)
}

extractValidModifiers(combination, validModifiers)
{
    modifiers := ""
    Loop, Parse, combination
    {
        IfInString, validModifiers, %A_LoopField%
        {
            modifiers := modifiers . A_LoopField
        }
    }
    return modifiers
}
