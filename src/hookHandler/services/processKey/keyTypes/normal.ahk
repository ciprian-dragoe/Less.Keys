processNormalKey(key)
{
    cancelDoubledModifier()
    SetTimer, TimerTimeoutSendLayoutKey, OFF

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
                processKeyToSend(layoutChangeKey)
            }
            processKeyToSend(alternativeKey)
        }
        else
        {
            debug(keyToSendOnUp . " & " . key . "| timeoutProcessLayoutOnRelease 2 keys pressed")
            processKeyToSend(layoutChangeKey)
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
        debug(key . " => " . alternativeValue)
        if (alternativeValue = key)
        {
            lastKeyProcessedAsAlternative := ""
            modifiers := getActiveModifiers()
            processKeyToSend(layoutChangeKey)
        }
        processKeyToSend(alternativeValue)

        return
    }

    if (key != lastKeyProcessedAsAlternative)
    {
        processKeyToSend(key)
        debug(key . "|key down")
    }
}

processKeyToSend(key, literal = 0)
{
    otherKeyPressedWhileWobblyKeyDown := 1
    activeModifiers := getActiveModifiers(key)

    if (!processAhkKeyboardShortcuts(activeModifiers, key))
    {
        addToActivePressedKeys(key)
        if (literal)
        {
            send {blind}%key%
        }
        else
        {
            send {blind}{%key%}
        }
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
