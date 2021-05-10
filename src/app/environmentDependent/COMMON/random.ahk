ignoreShortcut()
{
    return
}

sendKeyCombinationIndependentActiveModifiers(combination)
{
    originalState := getModifierStates()
    resetAllModifiers()
    send %combination%
    resetModifiersToState(originalState)
}