validateTestOutput(testDescription, expectedResult)
{
    testOutput := clearText()
    evaluateResult(expectedResult, testOutput)
    addTestResult(testDescription, expectedResult, testOutput)
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
        return "TRUE"
    }
    
    return "FAIL"
}

addTestResult(testDescription, expected, actual)
{
    testResult := Object()
    testResult.description := testDescription
    testResult.result := evaluateResult(expected, actual)
    testResult.expected := expected
    testResult.actual := actual
    testResults.push(testResult)
}