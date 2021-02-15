When_leftShiftClick_pressed_leftCtrlClick_pressed_rightShiftClick_doubled_as_left_THEN_word_is_selected_after_rightShiftClickRelease_#2701()
{
    modifierDoubledAsClick["rightShiftClick"] := "left"
    simulateTyping("hello world")
    processKeyDown("leftShiftClick")
    sleep 100
    processKeyDown("leftCtrlClick")
    sleep 100
    processKeyDown("rightShiftClick")
    sleep 100
    processKeyUp("rightShiftClick")
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
