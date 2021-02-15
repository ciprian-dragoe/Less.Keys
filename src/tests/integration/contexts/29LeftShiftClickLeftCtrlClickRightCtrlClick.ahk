When_leftShiftClick_pressed_leftCtrlClick_pressed_rightCtrlClick_doubled_as_left_THEN_word_is_selected_after_rightCtrlClickRelease_#2901()
{
    modifierDoubledAsClick["rightCtrlClick"] := "left"
    simulateTyping("hello world")
    processKeyDown("leftShiftClick")
    sleep 100
    processKeyDown("leftCtrlClick")
    sleep 100
    processKeyDown("rightCtrlClick")
    sleep 100
    processKeyUp("rightCtrlClick")
    sleep %timerTimeoutStickyKeys%
    actual := getSelectedText()
    processKeyUp("leftShiftClick")
    sleep 100
    processKeyUp("leftCtrlClick")
    sleep 100
    expected := "world"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}
