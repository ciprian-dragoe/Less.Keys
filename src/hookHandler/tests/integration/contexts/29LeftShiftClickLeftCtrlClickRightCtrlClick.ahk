When_leftShiftClick_pressed_leftCtrlClick_pressed_rightCtrlClick_doubled_as_left_THEN_word_is_selected_after_rightCtrlClickRelease_#2901()
{
    modifierDoubledAsClick["rightCtrlClick"] := "left"
    simulateTyping("hello world")
    simulateKeyDown("leftShiftClick")
    sleep 100
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyDown("rightCtrlClick")
    sleep 100
    simulateKeyUp("rightCtrlClick")
    sleep % timerTimeoutStickyKeys + 2 * timerTimeoutStickyKeys
    actual := getSelectedText()
    simulateKeyUp("leftShiftClick")
    sleep 100
    simulateKeyUp("leftCtrlClick")
    sleep 100
    expected := "world"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}
