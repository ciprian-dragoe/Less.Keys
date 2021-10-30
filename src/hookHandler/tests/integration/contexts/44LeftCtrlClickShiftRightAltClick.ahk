When_leftCtrlClick_pressed_shift_pressed_rightAltClick_THEN_word_is_selected_after_rightAltClickRelease_#4401()
{
    modifierDoubledAsClick["rightAltClick"] := "left"
    simulateTyping("hello world")
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyDown("lshift", 100)
    sleep 100
    simulateKeyDown("rightAltClick")
    sleep 100
    simulateKeyUp("rightAltClick")
    sleep %timerTimeoutStickyKeys%
    actual := getSelectedText()
    simulateKeyUp("leftCtrlClick")
    sleep 100
    simulateKeyUp("lshift", 100)
    expected := "world"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftCtrlClick_doubled_as_d_pressed_shift_pressed_rightAltClick_pressed_leftCtrlClick_released_shift_released_rightAltClick_released_THEN_b_letter_sent_#4402()
{
    modifierDoubledAsClick["leftCtrlClick"] := "d"
    modifierDoubledAsClick["rightAltClick"] := "b"
    simulateTyping("hello world")
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyDown("lshift", 100)
    sleep 100
    simulateKeyDown("rightAltClick")
    sleep 100
    simulateKeyUp("leftCtrlClick")
    sleep 100
    simulateKeyUp("rightAltClick")
    sleep 100
    simulateKeyUp("lshift", 100)
    expected := "hello worldb"

    validateTestOutput(A_ThisFunc , expected)
}
