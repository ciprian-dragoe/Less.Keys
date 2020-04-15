processNormalKey(key)
{ 
    if (processKeyOnRelease)
    {
        keyToSendOnUp := key
        debug(key . "|>>>>>> will be processed on release")
    }
    else
    {
        sendLayoutKey := false
        
        if (alternativeLayoutActive)
        {
            lastKeyProcessedAsAlternative := key
            key := alternativeLayout[key]
            if (keyToSendOnUp && keyToSendOnUp = key) {
                send {blind}{%layoutChangeKey%}
            }
            processKeyToSend(key)
            debug(key . "|------ key down with alternative layout")
            
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
        processShortcut(index)
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
