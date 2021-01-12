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
    if (processModifierKey(key, 1))
    {
        return
    }
    
    if (key = layoutChangeKey)
    {
        manageLayoutKeyDown(key)
        return
    }

    if (!alternativeLayoutActive)
    {
        layoutKeyActivatesProcessKeyOnRelease := true
        SetTimer, TimerProcessLayoutOnRelease, OFF
        SetTimer, TimerProcessLayoutOnRelease, %timeoutProcessLayoutOnRelease%, -2147483648
    }
    processNormalKey(key)
}

processKeyUp(key)
{
    if (processModifierKey(key, 0))
    {
        return
    }

    fixQuickTypeLeftRightDoubledModifiers := true
    SetTimer, TimerFixQuickTypeLeftRightDoubledModifiers, OFF
    SetTimer, TimerFixQuickTypeLeftRightDoubledModifiers, %timeoutFixQuickTypeLeftRightDoubledModifiers%, -2147483648
    
    if (key = layoutChangeKey)
    {
        manageLayoutKeyUp(key)
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
}