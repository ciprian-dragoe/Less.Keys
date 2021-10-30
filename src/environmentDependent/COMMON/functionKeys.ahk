sendFunctionKey(combination, index)
{
    number := "F" + Mod(index, functionKeysStartIndexMinusOne)
    resetModifierWithoutTriggerUpState("lwin", winActive)
    processKeyToSend(number)
    send {blind}{lwin down}
    winActive := 1
}
