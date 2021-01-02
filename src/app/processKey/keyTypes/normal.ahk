processNormalKey(key)
{
    cancelDoubledModifier()
    
    if (keyToSendOnUp)
    {
        processKeyOnRelease := false
        layoutKeyActivatesProcessKeyOnRelease := false
        sendLayoutKey := false

        firstKeyPress := alternativeLayout[keyToSendOnUp]
        secondKeyPressed := alternativeLayout[key]
        lastKeyProcessedAsAlternative := key
        if (firstKeyPress = keyToSendOnUp)
        {
            secondKeyPressed := key
            lastKeyProcessedAsAlternative := ""

            modifiers := getActiveModifiers()
            send {blind}%modifiers%{%layoutChangeKey%}
        }
        processKeyToSend(firstKeyPress)
        keyToSendOnUp := ""
        debug(sendFirstKeyAsAlternative . "|first key typed because 2 keys pressed while alternative key pressed in less timeoutProcessLayoutOnRelease")

        processKeyToSend(secondKeyPressed)
        debug(sendFirstKeyAsAlternative . "|second key typed because 2 keys pressed while alternative key pressed in less timeoutProcessLayoutOnRelease")

        return
    }
    
    if (processKeyOnRelease)
    {
        keyToSendOnUp := key
        debug(key . "|>>>>>> will be processed on release")

        return
    }
    
    sendLayoutKey := false    
    if (alternativeLayoutActive)
    {
        lastKeyProcessedAsAlternative := key
        alternativeValue := alternativeLayout[key]
        if (alternativeValue = key)
        {
            lastKeyProcessedAsAlternative := ""
            modifiers := getActiveModifiers()
            send {blind}%modifiers%{%layoutChangeKey%}
        }
        processKeyToSend(alternativeValue)
        debug(key . " => " . alternativeValue)

        return
    }

    if (key != lastKeyProcessedAsAlternative)
    {
        processKeyToSend(key)
        debug(key . "|key down")
    }
}

processKeyToSend(key)
{
    activeModifiers := getActiveModifiers(key)
    if (!processAhkKeyboardShortcuts(activeModifiers, key))
    {
        send {blind}%activeModifiers%{%key%}
        return true
    }
    
    return false
}

processAhkKeyboardShortcuts(activeModifiers, key)
{
    combination := activeModifiers . key
    index := keyboardShortcuts[combination]
    if (index)
    {
        processShortcut(index, combination)
        return true
    }
    
    return false
}
