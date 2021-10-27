When_rightCtrlClick_pressed_shift_pressed_leftCtrlClick_doubled_as_left_pressed_a_word_is_selected_after_a_leftCtrlClick_released_#1701()
{
    modifierDoubledAsClick["leftCtrlClick"] := "left"
    simulateTyping("hello world")
    simulateKeyDown("rightCtrlClick")
    sleep 100
    simulateKeyDown("shift")
    sleep 100
    simulateKeyDown("leftCtrlClick")
    sleep 50
    simulateKeyUp("leftCtrlClick")
    sleep %timerTimeoutStickyKeys%
    sleep 100
    simulateKeyUp("rightCtrlClick")
    actual := getSelectedText()
    sleep 100
    simulateKeyUp("shift")
    expected := "world"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}
