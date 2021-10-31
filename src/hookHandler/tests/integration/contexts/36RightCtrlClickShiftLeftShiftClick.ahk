When_rightCtrlClick_pressed_shift_pressed_leftShiftClick_THEN_word_is_selected_after_leftShiftClickRelease_#3601()
{
    modifierDoubledAsClick["leftShiftClick"] := "left"
    simulateTyping("hello world")
    simulateKeyDown("rightCtrlClick")
    sleep 100
    simulateKeyDown("lshift", 100)
    sleep 100
    simulateKeyDown("leftShiftClick")
    sleep 100
    simulateKeyUp("leftShiftClick")
    sleep % timerTimeoutStickyKeys + 2 * timerTimeoutStickyKeys
    actual := getSelectedText()
    simulateKeyUp("rightCtrlClick")
    sleep 100
    simulateKeyUp("lshift", 100)
    expected := "world"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightCtrlClick_doubled_as_d_pressed_shift_pressed_leftShiftClick_rightCtrlClick_release_shift_release_leftShiftClick_release_THEN_b_sent_#3602()
{
    modifierDoubledAsClick["rightCtrlClick"] := "d"
    modifierDoubledAsClick["leftShiftClick"] := "b"
    simulateTyping("hello ")
    simulateKeyDown("rightCtrlClick")
    sleep 100
    simulateKeyDown("lshift", 100)
    sleep 100
    simulateKeyDown("leftShiftClick")
    sleep 100
    simulateKeyUp("rightCtrlClick")
    sleep 100
    simulateKeyUp("lshift", 100)
    sleep 100
    simulateKeyUp("leftShiftClick")
    expected := "hello b"

    validateTestOutput(A_ThisFunc , expected)
}
