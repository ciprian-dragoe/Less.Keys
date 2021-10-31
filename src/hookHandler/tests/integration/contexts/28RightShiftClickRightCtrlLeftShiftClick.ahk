When_rightShiftClick_pressed_rightCtrlClick_pressed_leftShiftClick_doubled_as_left_THEN_word_is_selected_after_leftShiftClickRelease_#2801()
{
    modifierDoubledAsClick["leftShiftClick"] := "left"
    simulateTyping("hello world")
    simulateKeyDown("rightShiftClick")
    sleep 100
    simulateKeyDown("rightCtrlClick")
    sleep 100
    simulateKeyDown("leftShiftClick")
    sleep 100
    simulateKeyUp("leftShiftClick")
    sleep % timerTimeoutStickyKeys + 2 * timerTimeoutStickyKeys
    actual := getSelectedText()
    simulateKeyUp("rightShiftClick")
    sleep 100
    simulateKeyUp("rightCtrlClick")
    sleep 100
    expected := "world"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}
