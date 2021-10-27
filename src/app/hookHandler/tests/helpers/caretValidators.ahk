validateCaretOutput(testDescription, expected)
{
    actual := getCurrentCaretPosition()
    result := evaluateCaretPosition(expected, actual)
    clearText()
    addTestResult(testDescription, turnCaretAsString(expected), turnCaretAsString(actual), result)
    setDefaultTestEnvironment(testDescription)
}

getCurrentCaretPosition(delay = 100)
{
    if (delay)
    {
        sleep %delay%
    }
    result := Object()
    result.x := A_CaretX
    result.y := A_CaretY
    return result
}

evaluateCaretPosition(expected, actual)
{
    if (expected.x = actual.x && expected.y = actual.y) 
    {
        return "PASS"
    }

    return "FAIL"
}

turnCaretAsString(caret)
{
    result := ""
    result .= "X=" . caret.x . " Y=" . caret.y
    return result
}

setMousePositionToCaret()
{
    position := getCurrentCaretPosition()
    CoordMode, Mouse, Window
    MouseMove, position.x, position.y
    return position
}