validateCaretOutput(testDescription, expected)
{
    actual := getCurrentCaretPosition()
    result := evaluateCaretPosition(expected, actual)
    clearText()
    addTestResult(testDescription, turnCaretAsString(expected), turnCaretAsString(actual), result)
    setDefaultTestEnvironment(testDescription)
}

validateCaretOutputDiffers(testDescription, expected)
{
    actual := getCurrentCaretPosition()
    isMatch := evaluateCaretPosition(expected, actual)
    if (isMatch = "FAIL")
    {
        isMatch := "PASS"
    }
    clearText()
    addTestResult(testDescription, turnCaretAsString(expected), turnCaretAsString(actual), isMatch)
    setDefaultTestEnvironment(testDescription)
}

getCurrentCaretPosition(delay = 100)
{
    if (delay)
    {
        sleep %delay%
    }
    result := Object()
    if (A_ScreenWidth > 2600) ; 4k resolutions usually give a factor of error in the current caret position
    {
        result.x := A_CaretX + 2
        result.y := A_CaretY + 2
    }
    else
    {
        result.x := A_CaretX
        result.y := A_CaretY
    }
    return result
}

evaluateCaretPosition(expected, actual)
{
    ; at higher resolutions there can appear small differences
    if (abs(expected.x - actual.x) < 5 && abs(expected.y - actual.y) < 5)
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