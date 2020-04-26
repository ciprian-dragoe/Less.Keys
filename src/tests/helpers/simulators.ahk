simulateTyping(input, timePressKey = 100, timeNextKeyPress = 100)
{
    Loop, Parse, input
    {
        key := layout[A_LoopField]
        if (A_LoopField = " ")
        {
            key := "space" 
        }
        processKeyDown(key)
        sleep %timePressKey%
        processKeyUp(key)
        sleep %timeNextKeyPress%
    }
}

simulateKeyDown(key, delayAfter = 0)
{
    processKeyDown(layout[key])
    if (delayAfter)
    {
        sleep %delayAfter%
    }
}

simulateKeyUp(key, delayAfter = 0)
{
    processKeyUp(layout[key])
    if (delayAfter)
    {
        sleep %delayAfter%
    }
}