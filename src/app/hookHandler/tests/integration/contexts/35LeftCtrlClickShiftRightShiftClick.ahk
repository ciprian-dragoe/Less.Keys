When_leftCtrlClick_pressed_shift_pressed_rightShiftClick_THEN_word_is_selected_after_rightShiftClickRelease_#3501()
{
    modifierDoubledAsClick["rightShiftClick"] := "left"
    simulateTyping("hello world")
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyDown("lshift", 100)
    sleep 100
    simulateKeyDown("rightShiftClick")
    sleep 100
    simulateKeyUp("rightShiftClick")
    sleep %timerTimeoutStickyKeys%
    actual := getSelectedText()
    simulateKeyUp("leftCtrlClick")
    sleep 100
    simulateKeyUp("lshift", 100)
    expected := "world"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftCtrlClick_as_d_pressed_shift_pressed_rightShiftClick_pressed_leftCtrlClick_as_b_release_rightShiftClick_released_shift_release_THEN_capital_b_sent_#3502()
{
    modifierDoubledAsClick["rightShiftClick"] := "b"
    modifierDoubledAsClick["leftCtrlClick"] := "d"
    simulateTyping("hello world")
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyDown("lshift", 100)
    sleep 100
    simulateKeyDown("rightShiftClick")
    sleep 100
    simulateKeyUp("leftCtrlClick")
    sleep 100
    simulateKeyUp("rightShiftClick")
    sleep 100
    simulateKeyUp("lshift", 100)
    expected := "hello worldB"

    validateTestOutput(A_ThisFunc , expected)
}
