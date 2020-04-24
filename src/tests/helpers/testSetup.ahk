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
    send {escape}
    clearText()
    MouseMove, 500, 500
    
    timeGreaterTimeoutProcessLayoutOnRelease := 500
    sleep %timeGreaterTimeoutProcessLayoutOnRelease%
    clipboard := ""
}

clearText()
{
    send ^a
    sleep 100
    send ^x
    sleep 100
    return %clipboard%
}

getSelectedText()
{
    sleep 100
    send ^c
    sleep 100
    return %clipboard%
}
