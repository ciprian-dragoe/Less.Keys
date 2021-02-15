When_rightShiftClick_pressed_rightCtrlClick_pressed_leftCtrlClick_doubled_as_left_THEN_word_is_selected_after_leftCtrlClickRelease_#3001()
{
    modifierDoubledAsClick["leftCtrlClick"] := "left"
    simulateTyping("hello world")
    processKeyDown("rightShiftClick")
    sleep 100
    processKeyDown("rightCtrlClick")
    sleep 100
    processKeyDown("leftCtrlClick")
    sleep 100
    processKeyUp("leftCtrlClick")
    sleep %timerTimeoutStickyKeys%
    actual := getSelectedText()
    processKeyUp("rightShiftClick")
    sleep 100
    processKeyUp("rightCtrlClick")
    sleep 100
    expected := "world"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}
