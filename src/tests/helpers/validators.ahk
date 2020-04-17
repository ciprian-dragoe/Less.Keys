validateTestOutput(testDescription, expectedResult)
{
    testOutput := clearText()
    evaluateResult(expectedResult, testOutput)
    addTestResult(testDescription, expectedResult, testOutput, evaluateResult(expectedResult, testOutput))
}

clearText()
{
    send ^a
    sleep 10
    send ^x
    sleep 100
    return %clipboard%
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
    if (result == "PASS")
    {
        successTestResults.push(testResult)
    }
    else
    {
        failureTestResults.push(testResult)
    }
}