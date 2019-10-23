global keyToSendOnUp

global sendLayoutKey
global lastKeyProcessedAsAlternative
global activePressedKeys := []



processKeyDown(key)
{
    if (processModifierKey(key, 1))
    {
        return
    }
    
    if (key = layoutChangeKey)
    {
        manageLayoutKeyDown(key)
        return
    }
    
    processNormalKeydown(key)
}

processKeyUp(key) 
{
    SetTimer, FixStickyKeys, OFF
    SetTimer, FixStickyKeys, %timerTimeoutStickyKeys%
    
    if (processModifierKey(key, 0))
    {
        return
    }
    
    if (key = layoutChangeKey)
    {
        manageLayoutKeyUp(key)
        return
    }
    
    if (keyToSendOnUp)
    {
        key := alternativeLayout[keyToSendOnUp]
        processKeyToSend(key)
        processKeyOnRelease := false
        layoutKeyActivatesProcessKeyOnRelease := false
        keyToSendOnUp := ""
        sendLayoutKey := false        
        debug(key . "|***^^^ key up & process release")      
    }
    else
    {
        if (key = lastKeyProcessedAsAlternative)
        {
            lastKeyProcessedAsAlternative := ""
        }
        
        removeFromActivePressedKeys(key)
        send {Blind}{%key% Up}
        
        if (activePressedKeys.Length() = 0 && !alternativeLayoutActive)
        {
            layoutKeyActivatesProcessKeyOnRelease := true
            SetTimer, TimerProcessLayoutOnRelease, OFF
            SetTimer, TimerProcessLayoutOnRelease, %timeoutProcessLayoutOnRelease%
        }
        
        debug(key . "|up")
    }
}

removeFromActivePressedKeys(key)
{
    For index, value in activePressedKeys
    {
        if (value = key)
            activePressedKeys.Remove(index)
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
