When_leftCtrlClick_pressed_leftShiftClick_pressed_rightAltClick_THEN_word_is_selected_after_rightAltClickRelease_#4701()
{
    modifierDoubledAsClick["rightAltClick"] := "left"
    simulateTyping("hello world")
    processKeyDown("leftCtrlClick")
    sleep 100
    processKeyDown("leftShiftClick")
    sleep 100
    processKeyDown("rightAltClick")
    sleep 100
    processKeyUp("rightAltClick")
    sleep %timerTimeoutStickyKeys%
    actual := getSelectedText()
    processKeyUp("leftCtrlClick")
    sleep 100
    processKeyUp("leftShiftClick")
    sleep 100
    expected := "world"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftCtrlClick_doubled_as_d_pressed_leftShiftClick_pressed_rightAltClick_pressed_leftCtrlClick_release_release_rightAltClick_release_THEN_capital_b_sent_#4702()
{
    modifierDoubledAsClick["leftCtrlClick"] := "d"
    modifierDoubledAsClick["rightAltClick"] := "b"
    simulateTyping("hello world")
    processKeyDown("leftCtrlClick")
    sleep 100
    processKeyDown("leftShiftClick")
    sleep 100
    processKeyDown("rightAltClick")
    sleep 100
    processKeyUp("leftCtrlClick")
    sleep 100
    processKeyUp("rightAltClick")
    sleep 100
    processKeyUp("leftShiftClick")
    sleep 100
    expected := "hello worldB"

    validateTestOutput(A_ThisFunc , expected)
}
