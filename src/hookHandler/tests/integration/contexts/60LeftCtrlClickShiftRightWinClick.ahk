When_leftCtrlClick_pressed_shift_pressed_rightWinClick_THEN_word_is_selected_after_rightWinClickRelease_#6001()
{
    modifierDoubledAsClick["rightWinClick"] := "left"
    simulateTyping("hello world")
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyDown("lshift", 100)
    sleep 100
    simulateKeyDown("rightWinClick")
    sleep 100
    simulateKeyUp("rightWinClick")
    sleep %timerTimeoutStickyKeys%
    actual := getSelectedText()
    simulateKeyUp("leftCtrlClick")
    sleep 100
    simulateKeyUp("lshift", 100)
    expected := "world"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftCtrlClick_doubled_as_d_pressed_shift_pressed_rightWinClick_pressed_leftCtrlClick_release_rightWinClick_release_THEN_b_is_sent_#6002()
{
    modifierDoubledAsClick["leftCtrlClick"] := "d"
    modifierDoubledAsClick["rightWinClick"] := "b"
    simulateTyping("hello world")
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyDown("lshift", 100)
    sleep 100
    simulateKeyDown("rightWinClick")
    sleep 100
    simulateKeyUp("leftCtrlClick")
    sleep 100
    simulateKeyUp("rightWinClick")
    sleep 100
    simulateKeyUp("lshift", 100)
    expected := "hello worldB"

    validateTestOutput(A_ThisFunc , expected)
}
