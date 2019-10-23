processNormalKey(key)
{
    setTimer TimerStickyActivePressedKeys, 0
    setTimer TimerStickyActivePressedKeys, %timerTimeoutStickyKeys%
    
    if (processKeyOnRelease)
    {
        keyToSendOnUp := key
        debug(key . "|>>>>>> will be processed on release")
    }
    else
    {   
        if (alternativeLayoutActive)
        {
            lastKeyProcessedAsAlternative := key
            key := alternativeLayout[key]
            sendLayoutKey := false
            processKeyToSend(key)
            debug(key . "|------ key down with alternative layout")
            
            return
        }
        
        if (key != lastKeyProcessedAsAlternative)
        {
            addToActivePressedKeys(key)
            processKeyToSend(key)
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
        ;showtooltip(activeModifiers . "|" . key)
    }
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
                itemNotPresent := false
        }
        if (itemNotPresent)
            activePressedKeys.Push(key)
    }
}
