When_rightShiftClick_pressed_ctrl_pressed_leftShiftClick_THEN_word_is_selected_after_leftShiftClickRelease_#2601()
{
    modifierDoubledAsClick["leftShiftClick"] := "left"
    simulateTyping("hello world")
    processKeyDown("rightShiftClick")
    sleep 100
    simulateKeyDown("lctrl", 100)
    sleep 100
    processKeyDown("leftShiftClick")
    sleep 100
    processKeyUp("leftShiftClick")
    sleep %timerTimeoutStickyKeys%
    actual := getSelectedText()
    processKeyUp("rightShiftClick")
    sleep 100
    simulateKeyUp("lctrl", 100)
    expected := "world"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightShiftClick_doubled_as_d_pressed_ctrl_pressed_leftShiftClick_rightShiftClick_release_ctrl_leftShiftClick_release_THEN_text_not_modified_#2602()
{
    modifierDoubledAsClick["leftShiftClick"] := "left"
    modifierDoubledAsClick["rightShiftClick"] := "d"
    simulateTyping("hello world")
    processKeyDown("rightShiftClick")
    sleep 100
    simulateKeyDown("lctrl", 100)
    sleep 100
    modifierDoubledAsClick["leftShiftClick"] := "b"
    processKeyDown("leftShiftClick")
    sleep 100
    processKeyUp("rightShiftClick")
    sleep 100
    processKeyUp("leftShiftClick")
    sleep 100
    simulateKeyUp("lctrl", 100)
    expected := "hello world"

    validateTestOutput(A_ThisFunc , expected)
}
