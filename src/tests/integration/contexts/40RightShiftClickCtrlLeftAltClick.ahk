When_rightShiftClick_pressed_ctrl_pressed_leftAltClick_pressed_THEN_word_is_selected_before_leftAltClick_release_#4001()
{
    modifierDoubledAsClick["leftAltClick"] := "left"
    simulateTyping("hello world")
    processKeyDown("rightShiftClick")
    sleep 100
    simulateKeyDown("lctrl", 100)
    sleep 100
    processKeyDown("leftAltClick")
    sleep 100
    sleep %timerTimeoutStickyKeys%
    actual := getSelectedText()
    processKeyUp("rightShiftClick")
    sleep 100
    processKeyUp("leftAltClick")
    sleep 100
    simulateKeyUp("lctrl", 100)
    expected := "world"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightShiftClick_doubled_as_d_pressed_ctrl_pressed_leftAltClick_rightShiftClick_release_ctrl_leftAltClick_release_THEN_text_not_modified_#4002()
{
    modifierDoubledAsClick["leftAltClick"] := "left"
    modifierDoubledAsClick["rightShiftClick"] := "d"
    simulateTyping("hello world")
    processKeyDown("rightShiftClick")
    sleep 100
    simulateKeyDown("lctrl", 100)
    sleep 100
    modifierDoubledAsClick["leftAltClick"] := "b"
    processKeyDown("leftAltClick")
    sleep 100
    processKeyUp("rightShiftClick")
    sleep 100
    processKeyUp("leftAltClick")
    sleep 100
    simulateKeyUp("lctrl", 100)
    expected := "hello world"

    validateTestOutput(A_ThisFunc , expected)
}
