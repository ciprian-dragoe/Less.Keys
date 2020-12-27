When_rightCtrlClick_pressed_shift_pressed_leftWinClick_THEN_word_is_selected_before_leftWinClickRelease_#6101()
{
    modifierDoubledAsClick["leftWinClick"] := "left"
    simulateTyping("hello world")
    processKeyDown("rightCtrlClick")
    sleep 100
    simulateKeyDown("lshift", 100)
    sleep 100
    processKeyDown("leftWinClick")
    sleep 100
    sleep %timerTimeoutStickyKeys%
    actual := getSelectedText()
    processKeyUp("rightCtrlClick")
    sleep 100
    processKeyUp("leftWinClick")
    sleep 100
    simulateKeyUp("lshift", 100)
    expected := "world"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightCtrlClick_doubled_as_d_pressed_shift_pressed_leftWinClick_rightCtrlClick_release_shift_leftWinClick_release_THEN_text_not_modified_#6102()
{
    modifierDoubledAsClick["leftWinClick"] := "left"
    modifierDoubledAsClick["rightCtrlClick"] := "d"
    simulateTyping("hello world")
    processKeyDown("rightCtrlClick")
    sleep 100
    simulateKeyDown("lshift", 100)
    sleep 100
    modifierDoubledAsClick["leftWinClick"] := "b"
    processKeyDown("leftWinClick")
    sleep 100
    processKeyUp("rightCtrlClick")
    sleep 100
    processKeyUp("leftWinClick")
    sleep 100
    simulateKeyUp("lshift", 100)
    expected := "hello world"

    validateTestOutput(A_ThisFunc , expected)
}
