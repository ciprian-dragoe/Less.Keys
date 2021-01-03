processNormalKey(key)
{
    cancelDoubledModifier()
    
    if (keyToSendOnUp)
    {
        processKeyOnRelease := false
        layoutKeyActivatesProcessKeyOnRelease := false
        sendLayoutKey := false

        if (keyToSendOnUp = key)
        {
            lastKeyProcessedAsAlternative := key
            alternativeKey := alternativeLayout[key]
            debug(key . " => " . alternativeKey . "| timeoutProcessLayoutOnRelease deep press keyToSendOnUp")
            if (key = alternativeKey)
            {
                lastKeyProcessedAsAlternative := ""
                debug(layoutChangeKey . " sent because keyToSendOnUp without alternative value")
                send {blind}{%layoutChangeKey%}
            }
            processKeyToSend(alternativeKey)
        }
        else
        {
            debug(keyToSendOnUp . " & " . key . "| timeoutProcessLayoutOnRelease 2 keys pressed")
            send {blind}{%layoutChangeKey%}
            processKeyToSend(keyToSendOnUp)
            processKeyToSend(key)
        }

        keyToSendOnUp := ""
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
        if (processKeyToSend(key))
        {
            addToActivePressedKeys(key)
        }
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

addToActivePressedKeys(key)
{
    if (activePressedKeys.Length() = 0)
    {
        activePressedKeys.Push(key)
    }
    else 
    {
        itemNotPresent := true
        For index, value in activePressedKeys
        {
            if (value = key)
            {
                itemNotPresent := false
                break
            }
        }
        if (itemNotPresent)
            activePressedKeys.Push(key)
    }
}

removeFromActivePressedKeys(key)
{
    For index, value in activePressedKeys
    {
        if (value = key)
        {
            activePressedKeys.Remove(index)
            break
        }
    }
}
