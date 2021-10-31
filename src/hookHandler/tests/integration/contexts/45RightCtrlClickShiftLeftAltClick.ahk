When_rightCtrlClick_pressed_shift_pressed_leftAltClick_THEN_word_is_selected_after_leftAltClickRelease_#3601()
{
    modifierDoubledAsClick["leftAltClick"] := "left"
    simulateTyping("hello world")
    simulateKeyDown("rightCtrlClick")
    sleep 100
    simulateKeyDown("lshift", 100)
    sleep 100
    simulateKeyDown("leftAltClick")
    sleep 100
    simulateKeyUp("leftAltClick")
    sleep % timerTimeoutStickyKeys + 2 * timerTimeoutStickyKeys
    actual := getSelectedText()
    simulateKeyUp("rightCtrlClick")
    sleep 100
    simulateKeyUp("lshift", 100)
    expected := "world"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightCtrlClick_doubled_as_d_pressed_shift_pressed_leftAltClick_pressed_rightCtrlClick_release_shift_release_leftAltClick_release_THEN_b_letter_is_sent_#3602()
{
    modifierDoubledAsClick["rightCtrlClick"] := "d"
    modifierDoubledAsClick["leftAltClick"] := "b"
    simulateTyping("hello world")
    simulateKeyDown("rightCtrlClick")
    sleep 100
    simulateKeyDown("lshift", 100)
    sleep 100
    simulateKeyDown("leftAltClick")
    sleep 100
    simulateKeyUp("rightCtrlClick")
    sleep 100
    simulateKeyUp("leftAltClick")
    sleep 100
    simulateKeyUp("lshift", 100)
    expected := "hello worldb"

    validateTestOutput(A_ThisFunc , expected)
}
