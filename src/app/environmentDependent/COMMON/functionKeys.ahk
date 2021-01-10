sendFunctionKey(combination, index)
{
    validModifiers := "^+!"
    modifiers := extractValidModifiers(combination, validModifiers)
    number := "F" + Mod(index, functionKeysStartIndexMinusOne)
    send %modifiers%{%number%}
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
