When_rightCtrlClick_pressed_rightShiftClick_pressed_leftWinClick_THEN_word_is_selected_before_leftWinClickRelease_#5401()
{
    modifierDoubledAsClick["leftWinClick"] := "left"
    simulateTyping("hello world")
    processKeyDown("rightCtrlClick")
    sleep 100
    processKeyDown("rightShiftClick")
    sleep 100
    processKeyDown("leftWinClick")
    sleep 100
    sleep %timerTimeoutStickyKeys%
    actual := getSelectedText()
    processKeyUp("rightCtrlClick")
    sleep 100
    processKeyUp("leftWinClick")
    sleep 100
    processKeyUp("rightShiftClick")
    sleep 100
    expected := "world"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightCtrlClick_doubled_as_d_pressed_rightShiftClick_pressed_leftWinClick_rightCtrlClick_release_rightShiftClick_release_leftWinClick_release_THEN_text_not_modified_#5402()
{
    modifierDoubledAsClick["leftWinClick"] := "left"
    modifierDoubledAsClick["rightCtrlClick"] := "d"
    simulateTyping("hello world")
    processKeyDown("rightCtrlClick")
    sleep 100
    processKeyDown("rightShiftClick")
    sleep 100
    modifierDoubledAsClick["leftWinClick"] := "b"
    processKeyDown("leftWinClick")
    sleep 100
    processKeyUp("rightCtrlClick")
    sleep 100
    processKeyUp("leftWinClick")
    sleep 100
    processKeyUp("rightShiftClick")
    sleep 100
    expected := "hello world"

    validateTestOutput(A_ThisFunc , expected)
}
