prepareTestEnvironment()
{
    showtooltip("RUNNING INTEGRATION TESTS", 1000)
    run %TESTING_ENVIRONMENT%
    sleep 2000
    if (WinActive("ahk_class " . TESTING_ENVIRONMENT))
    {
       send ^n ; write in new file
       WinMaximize ahk_class %TESTING_ENVIRONMENT%
       return true
    }
    
    showtooltip("Please install " . TESTING_ENVIRONMENT, 2000)
    return false
}

printTestResults(testResults)
{
    result := ""
    for index , test in testResults
    {
        result .= StrReplace(test.description, "_", A_Space) . "`n"
        result .= "Result: " . test.result . "`n"
        result .= "Exp: " . test.expected . "`n"
        result .= "Act: " . test.actual . "`n"
        result .=  "`n`n`n"
    }
    clipboard := result
    send ^v
    sleep 100
}

setDefaultTestEnvironment(testName)
{
    output := "CLEANING | " . testName . " |"
    tooltip % output
    setTestVariables()
    sleep 1000
    send {ctrl down}
    sleep 200
    send {ctrl up}
    sleep 200
    send {alt down}
    sleep 200
    send {alt up}
    sleep 200
    send {alt down}
    sleep 200
    send {alt up}
    sleep 200
    send {escape down}
    sleep 200
    send {escape up}
    sleep 200
    send {escape down}
    sleep 200
    send {escape up}
    if (!WinActive("ahk_class " . TESTING_ENVIRONMENT))
    {
        WinActivate ahk_class %TESTING_ENVIRONMENT%
        sleep 200
    }
    clearText()
    
    ctrlActive := false
    shiftActive := false
    altActive := false
    winActive := false
    isNormalCtrlActive := false
    isNormalShiftActive := false
    isNormalAltActive := false
    isNormalWinActive := false
    layoutKeyPressed := 0
    alternativeLayoutActive := 0
    layoutKeyActivatesProcessKeyOnRelease := 0
    sendClickOnLeftAltClickRelease := false
    isLeftAltDoubledAsClickPressed := false
    doubledLeftAltMouseHook := 0
    isLeftAltClickDown := false
    sendClickOnLeftCtrlClickRelease := 0
    isLeftCtrlDoubledAsClickPressed := 0
    doubledLeftCtrlMouseHook := 0
    isLeftCtrlClickDown := 0
    sendClickOnLeftShiftClickRelease := false
    isLeftShiftDoubledAsClickPressed := false
    doubledLeftShiftMouseHook := 0
    isLeftShiftClickDown := false
    sendClickOnLeftWinClickRelease := false
    isLeftWinDoubledAsClickPressed := false
    doubledLeftWinMouseHook := 0
    isLeftWinClickDown := false
    sendClickOnRightAltClickRelease := false
    isRightAltDoubledAsClickPressed := false
    doubledRightAltMouseHook := 0
    isRightAltClickDown := false
    sendClickOnRightCtrlClickRelease := false
    isRightCtrlDoubledAsClickPressed := false
    doubledRightCtrlMouseHook := 0
    isRightCtrlClickDown := false
    sendClickOnRightShiftClickRelease := false
    isRightShiftDoubledAsClickPressed := false
    doubledRightShiftMouseHook := 0
    isRightShiftClickDown := false
    sendClickOnRightWinClickRelease := false
    isRightWinDoubledAsClickPressed := false
    doubledRightWinMouseHook := 0
    isRightWinClickDown := false
    keyToSendOnUp := ""
    sendLayoutKey := ""
    lastKeyProcessedAsAlternative := ""
    processKeyOnRelease := ""
    activePressedKeys := []
    
    SetTimer TimerLessKeysManagementBasedOnActiveApp, off
    SetTimer TimerStickyFailBack, off
    setTimer TimerResetModifierReleaseAction, OFF
    SetTimer TimerProcessLayoutOnRelease, OFF
    SetTimer TimerTimeoutSendLayoutKey, OFF
    SetTimer TimerScrollWithMouseMovement, OFF
    MouseMove, 500, 500
    tooltip
    sleep 200
}

clearText()
{
    send ^a
    sleep 300
    send ^x
    sleep 300
    
    ; some text editors also encode a new line when it is not present
    clipboard := RegExReplace(clipboard, "[^a-zA-Z0-9 _-]", "")

    return %clipboard%
}

getSelectedText()
{
    clipboard := ""
    sleep 100
    send ^c
    sleep 100
    
    ; some text editors also encode a new line when it is not present
    clipboard := RegExReplace(clipboard, "[^a-zA-Z0-9 _-]", "")

    return %clipboard%
}

setTestVariables()
{
    clipboard :=
    debugStoredData := ""
    timeoutProcessLayoutOnRelease := 500
    timeoutStillSendLayoutKey := 2000
    timerTimeoutStickyKeys := 4000
    modifierDoubledAsClick["leftCtrlClick"] := "lbutton"
    modifierDoubledAsClick["leftShiftClick"] := "lbutton"
    modifierDoubledAsClick["leftWinClick"] := "lbutton"
    modifierDoubledAsClick["leftAltClick"] := "lbutton"
    modifierDoubledAsClick["rightCtrlClick"] := "lbutton"
    modifierDoubledAsClick["rightShiftClick"] := "lbutton"
    modifierDoubledAsClick["rightWinClick"] := "lbutton"
    modifierDoubledAsClick["rightAltClick"] := "lbutton"

    alternativeModifierDoubledAsClick["leftCtrlClick"] := "y"
    alternativeModifierDoubledAsClick["leftShiftClick"] := "y"
    alternativeModifierDoubledAsClick["leftWinClick"] := "y"
    alternativeModifierDoubledAsClick["leftAltClick"] := "y"
    alternativeModifierDoubledAsClick["rightCtrlClick"] := "y"
    alternativeModifierDoubledAsClick["rightShiftClick"] := "y"
    alternativeModifierDoubledAsClick["rightWinClick"] := "y"
    alternativeModifierDoubledAsClick["rightAltClick"] := "y"

    send {shift up}
    send {ctrl up}
    send {alt up}
    send {win up}
}
