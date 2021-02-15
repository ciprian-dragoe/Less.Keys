When_leftShiftClick_pressed_ctrl_pressed_rightShiftClick_THEN_word_is_selected_after_rightCtrlClickRelease_#2501()
{
    modifierDoubledAsClick["rightShiftClick"] := "left"
    simulateTyping("hello world")
    processKeyDown("leftShiftClick")
    sleep 100
    simulateKeyDown("lctrl", 100)
    sleep 100
    processKeyDown("rightShiftClick")
    sleep 100
    processKeyUp("rightShiftClick")
    sleep %timerTimeoutStickyKeys%
    actual := getSelectedText()
    processKeyUp("leftShiftClick")
    sleep 100
    simulateKeyUp("lctrl", 100)
    expected := "world"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftShiftClick_doubled_as_d_pressed_ctrl_pressed_rightShiftClick_leftShiftClick_release_ctrl_rightShiftClick_release_THEN_text_not_modified_#2502()
{
    modifierDoubledAsClick["rightShiftClick"] := "left"
    modifierDoubledAsClick["leftShiftClick"] := "d"
    simulateTyping("hello world")
    processKeyDown("leftShiftClick")
    sleep 100
    simulateKeyDown("lctrl", 100)
    sleep 100
    modifierDoubledAsClick["rightShiftClick"] := "b"
    processKeyDown("rightShiftClick")
    sleep 100
    processKeyUp("leftShiftClick")
    sleep 100
    processKeyUp("rightShiftClick")
    sleep 100
    simulateKeyUp("lctrl", 100)
    expected := "hello world"

    validateTestOutput(A_ThisFunc , expected)
}
