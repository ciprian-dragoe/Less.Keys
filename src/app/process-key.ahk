#include  %A_ScriptDir%\app\process-key\normal.ahk
#include  %A_ScriptDir%\app\process-key\modifier.ahk
#include  %A_ScriptDir%\app\process-key\layout.ahk
#include  %A_ScriptDir%\app\process-key\mouseScroll.ahk
#include  %A_ScriptDir%\app\process-key\stickyFailBack.ahk



global keyToSendOnUp
global sendLayoutKey
global lastKeyProcessedAsAlternative
global activePressedKeys := []
global processKeyOnRelease



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
    
    processNormalKey(key)
}

processKeyUp(key) 
{
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
        if (keyToSendOnUp = key) {
            send {blind}{%layoutChangeKey%}
        }
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
        
        if (!alternativeLayoutActive && activePressedKeys.Length() = 0)
        {
            layoutKeyActivatesProcessKeyOnRelease := true
            SetTimer, TimerProcessLayoutOnRelease, %timeoutProcessLayoutOnRelease%
        }
        
        debug(key . "|up")
    }
}
