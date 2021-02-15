When_leftShiftClick_pressed_ctrl_pressed_rightWinClick_doubled_as_left_THEN_word_is_selected_after_rightWinClick_release_#5701()
{
    modifierDoubledAsClick["rightWinClick"] := "left"
    simulateTyping("hello world")
    processKeyDown("leftShiftClick")
    sleep 100
    simulateKeyDown("lctrl", 100)
    sleep 100
    processKeyDown("rightWinClick")
    sleep 100
    processKeyUp("rightWinClick")
    sleep %timerTimeoutStickyKeys%
    actual := getSelectedText()
    sleep 100
    processKeyUp("leftShiftClick")
    sleep 100
    simulateKeyUp("lctrl", 100)
    expected := "world"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftShiftClick_doubled_as_d_pressed_ctrl_pressed_rightWinClick_pressed_leftShiftClick_release_ctrl_release_rightWinClick_release_THEN_b_sent_#5702()
{
    modifierDoubledAsClick["leftShiftClick"] := "d"
    modifierDoubledAsClick["leftShiftClick"] := "b"
    simulateTyping("hello world")
    processKeyDown("leftShiftClick")
    sleep 100
    simulateKeyDown("lctrl", 100)
    sleep 100
    processKeyDown("rightWinClick")
    sleep 100
    processKeyUp("rightWinClick")
    sleep 100
    simulateKeyUp("lctrl", 100)
    sleep 100
    processKeyUp("leftShiftClick")
    expected := "hello world"

    validateTestOutput(A_ThisFunc , expected)
}
