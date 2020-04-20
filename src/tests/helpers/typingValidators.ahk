validateTestOutput(testDescription, expectedResult)
{
    testOutput := clearText()
    result := evaluateResult(expectedResult, testOutput)
    addTestResult(testDescription, expectedResult, testOutput, result)
    setDefaultTestEnvironment()
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