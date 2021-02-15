When_rightShiftClick_pressed_ctrl_pressed_leftAltClick_pressed_THEN_word_is_selected_after_leftAltClick_release_#4001()
{
    modifierDoubledAsClick["leftAltClick"] := "left"
    simulateTyping("hello world")
    processKeyDown("rightShiftClick")
    sleep 100
    simulateKeyDown("lctrl", 100)
    sleep 100
    processKeyDown("leftAltClick")
    sleep 100
    processKeyUp("leftAltClick")
    sleep %timerTimeoutStickyKeys%
    actual := getSelectedText()
    processKeyUp("rightShiftClick")
    sleep 100
    simulateKeyUp("lctrl", 100)
    expected := "world"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightShiftClick_doubled_as_d_pressed_ctrl_pressed_leftAltClick_pressed_rightShiftClick_release_ctrl_release_leftAltClick_release_THEN_letter_sent_#4002()
{
    modifierDoubledAsClick["rightShiftClick"] := "d"
    modifierDoubledAsClick["leftAltClick"] := "b"
    simulateTyping("hello world")
    processKeyDown("rightShiftClick")
    sleep 100
    simulateKeyDown("lctrl", 100)
    sleep 100
    processKeyDown("leftAltClick")
    sleep 100
    processKeyUp("rightShiftClick")
    sleep 100
    simulateKeyUp("lctrl", 100)
    sleep 100
    processKeyUp("leftAltClick")
    expected := "hello worldb"

    validateTestOutput(A_ThisFunc , expected)
}
