When_leftShiftClick_pressed_ctrl_pressed_rightCtrlClick_doubled_as_left_THEN_word_is_selected_after_rightCtrlClick_release_#3101()
{
    modifierDoubledAsClick["rightCtrlClick"] := "left"
    simulateTyping("hello world")
    simulateKeyDown("leftShiftClick")
    sleep 100
    simulateKeyDown("lctrl", 100)
    sleep 100
    simulateKeyDown("rightCtrlClick")
    sleep 100
    simulateKeyUp("rightCtrlClick")
    sleep % timerTimeoutStickyKeys + 2 * timerTimeoutStickyKeys
    actual := getSelectedText()
    sleep 100
    simulateKeyUp("leftShiftClick")
    sleep 100
    simulateKeyUp("lctrl", 100)
    expected := "world"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftShiftClick_doubled_as_d_pressed_ctrl_pressed_rightCtrlClick_pressed_leftShiftClick_release_ctrl_release_rightCtrlClick_release_THEN_text_not_modified_#3102()
{
    modifierDoubledAsClick["leftShiftClick"] := "d"
    modifierDoubledAsClick["rightCtrlClick"] := "left"
    simulateTyping("hello world")
    simulateKeyDown("leftShiftClick")
    sleep 100
    simulateKeyDown("lctrl", 100)
    sleep 100
    simulateKeyDown("rightCtrlClick")
    sleep 100
    modifierDoubledAsClick["leftShiftClick"] := "b"
    simulateKeyUp("leftShiftClick")
    sleep 100
    simulateKeyUp("rightCtrlClick")
    sleep 100
    simulateKeyUp("lctrl", 100)
    expected := "hello world"

    validateTestOutput(A_ThisFunc , expected)
}
