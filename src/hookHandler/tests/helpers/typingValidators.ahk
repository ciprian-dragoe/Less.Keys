validateTestOutput(testDescription, expectedResult)
{
    testOutput := clearText()
    result := evaluateResult(expectedResult, testOutput)
    addTestResult(testDescription, expectedResult, testOutput, result)
    setDefaultTestEnvironment(testDescription)
}

evaluateResult(expected, actual)
{
    if (expected == actual)
    {
        return "PASS"
    }
    
    return "FAIL"
}

addTestResult(testDescription, expected, actual, result)
{
    testResult := Object()
    testResult.description := testDescription
    testResult.result := result 
    testResult.expected := expected
    testResult.actual := actual
    if (result = "PASS")
    {
        successTestResults.push(testResult)
    }
    else
    {
        failureTestResults.push(testResult)
        testNumber := SubStr(testDescription, InStr(testDescription, "#")+1, 10)
        FileAppend, %final%, %A_Desktop%\%testNumber%.txt
        showtooltip( "==========================" . "`n`n`n" . testDescription . "`n`n`n" . "==========================", 3000)
    }
}