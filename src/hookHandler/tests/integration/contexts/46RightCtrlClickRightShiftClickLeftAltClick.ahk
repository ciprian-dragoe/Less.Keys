When_rightCtrlClick_pressed_rightShiftClick_pressed_leftAltClick_THEN_word_is_selected_after_leftAltClickRelease_#4601()
{
    modifierDoubledAsClick["leftAltClick"] := "left"
    simulateTyping("hello world")
    simulateKeyDown("rightCtrlClick")
    sleep 100
    simulateKeyDown("rightShiftClick")
    sleep 100
    simulateKeyDown("leftAltClick")
    sleep 100
    simulateKeyUp("leftAltClick")
    sleep % timerTimeoutStickyKeys + 2 * timerTimeoutStickyKeys
    actual := getSelectedText()
    simulateKeyUp("rightCtrlClick")
    sleep 100
    simulateKeyUp("rightShiftClick")
    sleep 100
    expected := "world"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightCtrlClick_doubled_as_d_pressed_rightShiftClick_pressed_leftAltClick_pressed_rightCtrlClick_release_rightShiftClick_release_leftAltClick_release_THEN_b_letter_sent_#4602()
{
    modifierDoubledAsClick["rightCtrlClick"] := "d"
    modifierDoubledAsClick["leftAltClick"] := "b"
    simulateTyping("hello world")
    simulateKeyDown("rightCtrlClick")
    sleep 100
    simulateKeyDown("rightShiftClick")
    sleep 100
    simulateKeyDown("leftAltClick")
    sleep 100
    simulateKeyUp("rightCtrlClick")
    sleep 100
    simulateKeyUp("leftAltClick")
    sleep 100
    simulateKeyUp("rightShiftClick")
    sleep 100
    expected := "hello worldb"

    validateTestOutput(A_ThisFunc , expected)
}
