When_rightShiftClick_pressed_ctrl_pressed_leftWinClick_pressed_THEN_word_is_selected_after_leftWinClick_release_#5601()
{
    modifierDoubledAsClick["leftWinClick"] := "left"
    simulateTyping("hello world")
    processKeyDown("rightShiftClick")
    sleep 100
    simulateKeyDown("lctrl", 100)
    sleep 100
    processKeyDown("leftWinClick")
    sleep 100
    processKeyUp("leftWinClick")
    sleep %timerTimeoutStickyKeys%
    actual := getSelectedText()
    processKeyUp("rightShiftClick")
    sleep 100
    simulateKeyUp("lctrl", 100)
    expected := "world"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightShiftClick_doubled_as_d_pressed_shift_pressed_leftWinClick_pressed_rightShiftClick_release_leftWinClick_release_THEN_B_is_sent_#5602()
{
    modifierDoubledAsClick["rightShiftClick"] := "d"
    modifierDoubledAsClick["leftWinClick"] := "b"
    simulateTyping("hello world")
    processKeyDown("rightShiftClick")
    sleep 100
    simulateKeyDown("lshift", 100)
    sleep 100
    processKeyDown("leftWinClick")
    sleep 100
    processKeyUp("rightShiftClick")
    sleep 100
    processKeyUp("leftWinClick")
    sleep 100
    simulateKeyUp("lshift", 100)
    expected := "hello worldB"

    validateTestOutput(A_ThisFunc , expected)
}
