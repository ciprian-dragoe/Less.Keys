; if the cpu is executing intensive tasks then the lift key up command may not be processed for
; modifier keys (ctrl, shift, alt, win) and they are still registered by the os as pressed.
; This is a fail safe for such situations
global timeoutCheckAgainIfTimerTriggeredBeforeKeyLift := 300


timerStickyFailBack()
{
    SetTimer TimerStickyFailBack, off
    offloadHookReaderProcessCheckAnyModifierKeyPressed()
}

offloadHookReaderProcessCheckAnyModifierKeyPressed()
{
    DetectHiddenWindows On
    PostMessage, %APP_MESSAGE_IS_ANY_MODIFIER_KEY_PRESSED%, 0, 0, , %SCRIPT_HOOKS_READER%
}

handleModifierKeyPressed()
{
    ;showtooltip("handleModifierKeyPressed")
    SetTimer TimerStickyFailBack, off
    SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
}

handleModifierKeyNotPressed()
{
    resetStates()
}

resetStates()
{
    debug("---RESET STICKY")
    ;showtooltip("RESET STICKY")
    if (shiftActive || GetKeyState("shift"))
    {
        debug("================================= shift sticky")
        send {shift up}
        shiftActive := 0
        storeDebugData("shift")
        DetectHiddenWindows On
        PostMessage, %APP_MESSAGE_STORE_DEBUG_LOG%, 0, 0, , %SCRIPT_HOOKS_READER%
    }
    if (ctrlActive || GetKeyState("ctrl"))
    {
        debug("================================= ctrl sticky")
        send {ctrl up}
        ctrlActive := 0
        storeDebugData("ctrl")
        DetectHiddenWindows On
        PostMessage, %APP_MESSAGE_STORE_DEBUG_LOG%, 0, 0, , %SCRIPT_HOOKS_READER%
    }
    if (altActive || GetKeyState("alt"))
    {
        debug("================================= alt sticky")
        resetModifierWithoutTriggerUpState("alt", altActive)
        storeDebugData("alt")
        DetectHiddenWindows On
        PostMessage, %APP_MESSAGE_STORE_DEBUG_LOG%, 0, 0, , %SCRIPT_HOOKS_READER%
    }
    if (winActive || GetKeyState("lwin"))
    {
        debug("================================= win sticky")
        resetModifierWithoutTriggerUpState("lwin", winActive)
        storeDebugData("win")
        DetectHiddenWindows On
        PostMessage, %APP_MESSAGE_STORE_DEBUG_LOG%, 0, 0, , %SCRIPT_HOOKS_READER%
    }

    if (layoutKeyPressed)
    {
        SetTimer, TimerScrollWithMouseMovement, OFF
        systemCursor(1)
        layoutKeyPressed := 0
        debug("================================= space sticky")
        storeDebugData("space")
        DetectHiddenWindows On
        PostMessage, %APP_MESSAGE_STORE_DEBUG_LOG%, 0, 0, , %SCRIPT_HOOKS_READER%
    }

    resetDoubledModifierClickDrag("leftCtrlClick", isLeftCtrlClickDown)
    resetDoubledModifierClickDrag("leftShiftClick", isLeftShiftClickDown)
    resetDoubledModifierClickDrag("leftAltClick", isLeftAltClickDown)
    resetDoubledModifierClickDrag("leftWinClick", isLeftWinClickDown)
    resetDoubledModifierClickDrag("rightWinClick", isRightWinClickDown)
    resetDoubledModifierClickDrag("rightCtrlClick", isRightCtrlClickDown)
    resetDoubledModifierClickDrag("rightShiftClick", isRightShiftClickDown)
    resetDoubledModifierClickDrag("rightAltClick", isRightAltClickDown)

    processKeyOnRelease := false
    layoutKeyPressed := false
    alternativeLayoutActive := false
    sendLayoutKey := false
    keyToSendOnUp := ""
    lastKeyProcessedAsAlternative := ""
    ctrlActive := false
    altActive := false
    shiftActive := false
    winActive := false
    isNormalShiftActive := false
    isNormalCtrlActive := false
    isNormalAltActive := false
    isNormalWinActive := false

    isLeftCtrlDoubledAsClickPressed := false
    isLeftShiftDoubledAsClickPressed := false
    isLeftAltDoubledAsClickPressed := false
    isLeftWinDoubledAsClickPressed := false
    isRightAltDoubledAsClickPressed := false
    isRightWinDoubledAsClickPressed := false
    isRightCtrlDoubledAsClickPressed := false
    isRightShiftDoubledAsClickPressed := false
}
