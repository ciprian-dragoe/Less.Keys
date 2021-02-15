When_rightShiftClick_pressed_rightCtrlClick_pressed_leftShiftClick_doubled_as_left_THEN_word_is_selected_after_leftShiftClickRelease_#2801()
{
    modifierDoubledAsClick["leftShiftClick"] := "left"
    simulateTyping("hello world")
    processKeyDown("rightShiftClick")
    sleep 100
    processKeyDown("rightCtrlClick")
    sleep 100
    processKeyDown("leftShiftClick")
    sleep 100
    processKeyUp("leftShiftClick")
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
