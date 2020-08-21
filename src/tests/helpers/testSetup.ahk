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

setDefaultTestEnvironment()
{
    send {escape 2}
    clearText()
    MouseMove, 500, 500
    clipboard :=
    timeGreaterTimeoutProcessLayoutOnRelease := 500
    sleep %timeGreaterTimeoutProcessLayoutOnRelease%
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
