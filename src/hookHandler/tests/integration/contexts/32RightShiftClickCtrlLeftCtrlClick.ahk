When_rightShiftClick_pressed_ctrl_pressed_leftCtrlClick_doubled_as_left_THEN_word_is_selected_after_leftCtrlClick_release_#3201()
{
    modifierDoubledAsClick["leftCtrlClick"] := "left"
    simulateTyping("hello world")
    simulateKeyDown("rightShiftClick")
    sleep 100
    simulateKeyDown("lctrl", 100)
    sleep 100
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyUp("leftCtrlClick")
    sleep %timerTimeoutStickyKeys%
    actual := getSelectedText()
    sleep 100
    simulateKeyUp("rightShiftClick")
    sleep 100
    simulateKeyUp("lctrl", 100)
    expected := "world"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightShiftClick_doubled_as_d_pressed_ctrl_pressed_leftCtrlClick_pressed_rightShiftClick_release_ctrl_release_leftCtrlClick_release_THEN_text_not_modified_#3202()
{
    modifierDoubledAsClick["rightShiftClick"] := "d"
    modifierDoubledAsClick["leftCtrlClick"] := "left"
    simulateTyping("hello world")
    simulateKeyDown("rightShiftClick")
    sleep 100
    simulateKeyDown("lctrl", 100)
    sleep 100
    simulateKeyDown("leftCtrlClick")
    sleep 100
    modifierDoubledAsClick["rightShiftClick"] := "b"
    simulateKeyUp("rightShiftClick")
    sleep 100
    simulateKeyUp("leftCtrlClick")
    sleep 100
    simulateKeyUp("lctrl", 100)
    expected := "hello world"

    validateTestOutput(A_ThisFunc , expected)
}
