altModifierPressEmulate(combination, index)
{
    validModifiers := "^+#"
    modifiers := extractValidModifiers(combination, validModifiers)
    activateAltWithKey(modifiers . "{tab}")
}

ctrlModifierPressEmulate(combination, index)
{
    validModifiers := "!+#"
    modifiers := extractValidModifiers(combination, validModifiers)
    activateCtrlWithKey(modifiers . "{tab}")
}

winModifierPressEmulate(combination, index)
{
    validModifiers := "^+!"
    modifiers := extractValidModifiers(combination, validModifiers)
    activateWinWithKey(modifiers . "{tab}")
}