#include  %A_ScriptDir%\app\processKey\keyTypes\modifier.ahk
#include  %A_ScriptDir%\app\processKey\keyTypes\normal.ahk
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
    debug("[KEY_DOWN_BEGIN] " . key)
    if (processModifierKey(key, 1))
    {
        debug("[KEY_DOWN_END] " . key)
        return
    }
    
    if (key = layoutChangeKey)
    {
        manageLayoutKeyDown(key)
        debug("[KEY_DOWN_END] " . key)
        return
    }

    if (!alternativeLayoutActive)
    {
        layoutKeyActivatesProcessKeyOnRelease := true
        SetTimer, TimerProcessLayoutOnRelease, OFF
        SetTimer, TimerProcessLayoutOnRelease, %timeoutProcessLayoutOnRelease%
    }
    processNormalKey(key)
    debug("[KEY_DOWN_END] " . key)
}

processKeyUp(key)
{
    debug("[KEY_UP_BEGIN] " . key)
    if (processModifierKey(key, 0))
    {
        debug("[KEY_UP_END] " . key)
        return
    }

    if (key = layoutChangeKey)
    {
        manageLayoutKeyUp(key)
        debug("[KEY_UP_END] " . key)
        return
    }

    if (keyToSendOnUp)
    {
        processKeyOnRelease := false
        layoutKeyActivatesProcessKeyOnRelease := false
        sendLayoutKey := false
        buffer := keyToSendOnUp
        keyToSendOnUp := ""
        key := alternativeLayout[buffer]
        debug(buffer . " => " . key . " on release")
        if (buffer = key)
        {
            modifiers := getActiveModifiers()
            send {blind}%modifiers%{%layoutChangeKey%}
        }
        processKeyToSend(key)
    }
    else
    {
        if (key = lastKeyProcessedAsAlternative)
        {
            lastKeyProcessedAsAlternative := ""
        }
        removeFromActivePressedKeys(key)
        debug(key . "|up")
    }
    debug("[KEY_UP_END] " . key)
}