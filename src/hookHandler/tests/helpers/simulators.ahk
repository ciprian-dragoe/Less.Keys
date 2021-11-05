simulateTyping(input, timePressKey = 100, timeNextKeyPress = 100)
{
    Loop, Parse, input
    {
        key := layout[A_LoopField]
        if (A_LoopField = " ")
        {
            key := "space"
        }
        key := GetKeySC(key)
        processKeyDown(key)
        sleep %timePressKey%
        processKeyUp(key)
        sleep %timeNextKeyPress%
    }
}

simulateKeyDown(key, delayAfter = 0)
{
    key := getRealKeyboardKey(key)
    key := GetKeySC(key)
    processKeyDown(key)
    if (delayAfter)
    {
        sleep %delayAfter%
    }
}

simulateKeyUp(key, delayAfter = 0)
{
    key := getRealKeyboardKey(key)
    key := GetKeySC(key)
    processKeyUp(key)
    if (delayAfter)
    {
        sleep %delayAfter%
    }
}

getRealKeyboardKey(key)
{
    for extraKey, realKey in extraKeysMappings
    {
        if (key = extraKey)
        {
            return realKey
        }
    }
    return key
}
