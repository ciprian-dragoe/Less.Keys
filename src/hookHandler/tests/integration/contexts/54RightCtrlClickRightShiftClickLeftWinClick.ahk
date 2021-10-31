When_rightCtrlClick_pressed_rightShiftClick_pressed_leftWinClick_THEN_word_is_selected_after_leftWinClickRelease_#5401()
{
    modifierDoubledAsClick["leftWinClick"] := "left"
    simulateTyping("hello world")
    simulateKeyDown("rightCtrlClick")
    sleep 100
    simulateKeyDown("rightShiftClick")
    sleep 100
    simulateKeyDown("leftWinClick")
    sleep 100
    simulateKeyUp("leftWinClick")
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

When_rightCtrlClick_doubled_as_d_pressed_rightShiftClick_pressed_leftWinClick_pressed_rightCtrlClick_release_rightShiftClick_release_leftWinClick_release_THEN_B_is_sent_#5402()
{
    modifierDoubledAsClick["leftWinClick"] := "b"
    modifierDoubledAsClick["rightCtrlClick"] := "d"
    simulateTyping("hello world")
    simulateKeyDown("rightCtrlClick")
    sleep 100
    simulateKeyDown("rightShiftClick")
    sleep 100
    simulateKeyDown("leftWinClick")
    sleep 100
    simulateKeyUp("rightCtrlClick")
    sleep 100
    simulateKeyUp("leftWinClick")
    sleep 100
    simulateKeyUp("rightShiftClick")
    sleep 100
    expected := "hello worldB"

    validateTestOutput(A_ThisFunc , expected)
}
