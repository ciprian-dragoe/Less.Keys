When_leftShiftClick_pressed_ctrl_pressed_rightWinClick_doubled_as_left_THEN_word_is_selected_before_rightWinClick_release_#5701()
{
    modifierDoubledAsClick["rightWinClick"] := "left"
    simulateTyping("hello world")
    processKeyDown("leftShiftClick")
    sleep 100
    simulateKeyDown("lctrl", 100)
    sleep 100
    processKeyDown("rightWinClick")
    sleep 100
    sleep %timerTimeoutStickyKeys%
    actual := getSelectedText()
    processKeyUp("rightWinClick")
    sleep 100
    processKeyUp("leftShiftClick")
    sleep 100
    simulateKeyUp("lctrl", 100)
    expected := "world"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftShiftClick_doubled_as_d_pressed_ctrl_pressed_rightWinClick_pressed_leftShiftClick_release_ctrl_release_rightWinClick_release_THEN_text_not_modified_#5702()
{
    modifierDoubledAsClick["leftShiftClick"] := "d"
    modifierDoubledAsClick["rightWinClick"] := "left"
    simulateTyping("hello world")
    processKeyDown("leftShiftClick")
    sleep 100
    simulateKeyDown("lctrl", 100)
    sleep 100
    processKeyDown("rightWinClick")
    sleep 100
    modifierDoubledAsClick["leftShiftClick"] := "b"
    processKeyUp("leftShiftClick")
    sleep 100
    processKeyUp("rightWinClick")
    sleep 100
    simulateKeyUp("lctrl", 100)
    expected := "hello world"

    validateTestOutput(A_ThisFunc , expected)
}
