When_rightCtrlClick_pressed_shift_pressed_leftWinClick_THEN_word_is_selected_after_leftWinClickRelease_#6101()
{
    modifierDoubledAsClick["leftWinClick"] := "left"
    simulateTyping("hello world")
    simulateKeyDown("rightCtrlClick")
    sleep 100
    simulateKeyDown("lshift", 100)
    sleep 100
    simulateKeyDown("leftWinClick")
    sleep 100
    simulateKeyUp("leftWinClick")
    sleep %timerTimeoutStickyKeys%
    actual := getSelectedText()
    simulateKeyUp("rightCtrlClick")
    sleep 100
    simulateKeyUp("lshift", 100)
    expected := "world"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightCtrlClick_doubled_as_d_pressed_shift_pressed_leftWinClick_pressed_rightCtrlClick_release_leftWinClick_release_THEN_B_is_sent_#6102()
{
    modifierDoubledAsClick["rightCtrlClick"] := "d"
    modifierDoubledAsClick["leftWinClick"] := "b"
    simulateTyping("hello world")
    simulateKeyDown("rightCtrlClick")
    sleep 100
    simulateKeyDown("lshift", 100)
    sleep 100
    simulateKeyDown("leftWinClick")
    sleep 100
    simulateKeyUp("rightCtrlClick")
    sleep 100
    simulateKeyUp("leftWinClick")
    sleep 100
    simulateKeyUp("lshift", 100)
    expected := "hello worldB"

    validateTestOutput(A_ThisFunc , expected)
}
