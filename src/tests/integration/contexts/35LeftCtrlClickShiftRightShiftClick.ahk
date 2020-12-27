When_leftCtrlClick_pressed_shift_pressed_rightShiftClick_THEN_word_is_selected_before_rightShiftClickRelease_#3501()
{
    modifierDoubledAsClick["rightShiftClick"] := "left"
    simulateTyping("hello world")
    processKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyDown("lshift", 100)
    sleep 100
    processKeyDown("rightShiftClick")
    sleep 100
    sleep %timerTimeoutStickyKeys%
    actual := getSelectedText()
    processKeyUp("leftCtrlClick")
    sleep 100
    processKeyUp("rightShiftClick")
    sleep 100
    simulateKeyUp("lshift", 100)
    expected := "world"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftCtrlClick_doubled_as_d_pressed_shift_pressed_rightShiftClick_leftCtrlClick_release_shift_rightShiftClick_release_THEN_text_not_modified_#3502()
{
    modifierDoubledAsClick["rightShiftClick"] := "left"
    modifierDoubledAsClick["leftCtrlClick"] := "d"
    simulateTyping("hello world")
    processKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyDown("lshift", 100)
    sleep 100
    modifierDoubledAsClick["rightShiftClick"] := "b"
    processKeyDown("rightShiftClick")
    sleep 100
    processKeyUp("leftCtrlClick")
    sleep 100
    processKeyUp("rightShiftClick")
    sleep 100
    simulateKeyUp("lshift", 100)
    expected := "hello world"

    validateTestOutput(A_ThisFunc , expected)
}
