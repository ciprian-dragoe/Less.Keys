#include  %A_ScriptDir%\app\processKey\keyTypes\normal.ahk
#include  %A_ScriptDir%\app\processKey\keyTypes\modifier.ahk
#include  %A_ScriptDir%\app\processKey\keyTypes\layout.ahk
#include  %A_ScriptDir%\app\processKey\keyTypes\mouseScroll.ahk
#include  %A_ScriptDir%\app\sticky\stickyFailBack.ahk



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
        temp := keyToSendOnUp
        processKeyOnRelease := false
        layoutKeyActivatesProcessKeyOnRelease := false
        sendLayoutKey := false
        keyToSendOnUp := ""
        key := alternativeLayout[temp]
        if (temp = key) {
            send {blind}{%layoutChangeKey%}
        }
        processKeyToSend(key)
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
