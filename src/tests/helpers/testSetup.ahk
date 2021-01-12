prepareTestEnvironment()
{
    showtooltip("RUNNING INTEGRATION TESTS", 1000)
    run notepad
    WinWaitActive, ahk_class Notepad, , 2
    WinActivate, ahk_class Notepad, , 2
    IfWinActive, ahk_class Notepad
    {
       WinMaximize
       return true
    }
    
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
    send {escape}
    sleep 200
    send {escape}
    if (!WinActive("ahk_class Notepad"))
    {
        WinActivate ahk_class Notepad
    }
    clearText()
    MouseMove, 500, 500
    setTestVariables()
    SetTimer, TimerStickyFailBack, off
    SetTimer, TimerStickyFailBack, %timerTimeoutStickyKeys%, -2147483648
    tooltip
}

clearText()
{
    send ^a
    sleep 300
    send ^x
    sleep 300
    return %clipboard%
}

getSelectedText()
{
    sleep 100
    send ^c
    sleep 100
    return %clipboard%
}

setTestVariables()
{
    clipboard :=
    debugStoredData := ""
    timeoutFixQuickTypeLeftRightDoubledModifiers := 130
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
    send {shift up}
    send {ctrl up}
    send {alt up}
    send {win up}
}