#include  %A_ScriptDir%\services\processKey\keyTypes\modifier.ahk
#include  %A_ScriptDir%\services\processKey\keyTypes\normal.ahk
#include  %A_ScriptDir%\services\processKey\keyTypes\layout.ahk
#include  %A_ScriptDir%\services\processKey\keyTypes\mouseScroll.ahk


global keyToSendOnUp
global sendLayoutKey
global lastKeyProcessedAsAlternative
global processKeyOnRelease


processKeyDown(scanKeyCode)
{
    keyName := GetKeyName(Format("sc{:x}", scanKeyCode))
    key := layout[keyName]
    debug("[KEY_DOWN_BEGIN] " . key)
    SetTimer TimerStickyFailBack, off
    SetTimer TimerCheckAgainIfTimerTriggeredBeforeKeyLift, OFF
    SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%

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

processKeyUp(scanKeyCode)
{
    keyName := GetKeyName(Format("sc{:x}", scanKeyCode))
    key := layout[keyName]

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
            processKeyToSend(layoutChangeKey)
        }
        processKeyToSend(key)
    }
    else
    {
        if (key = lastKeyProcessedAsAlternative)
        {
            lastKeyProcessedAsAlternative := ""
        }
        debug(key . "|up")
    }
    debug("[KEY_UP_END] " . key)
}
