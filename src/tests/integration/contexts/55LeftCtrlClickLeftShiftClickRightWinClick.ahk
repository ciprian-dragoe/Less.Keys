When_leftCtrlClick_pressed_leftShiftClick_pressed_rightWinClick_THEN_word_is_selected_after_rightWinClickRelease_#5501()
{
    modifierDoubledAsClick["rightWinClick"] := "left"
    simulateTyping("hello world")
    processKeyDown("leftCtrlClick")
    sleep 100
    processKeyDown("leftShiftClick")
    sleep 100
    processKeyDown("rightWinClick")
    sleep 100
    processKeyUp("rightWinClick")
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

When_leftCtrlClick_doubled_as_d_pressed_leftShiftClick_pressed_rightWinClick_pressed_leftCtrlClick_release_leftShiftClick_release_rightWinClick_release_THEN_B_is_sent_#5502()
{
    modifierDoubledAsClick["leftCtrlClick"] := "d"
    modifierDoubledAsClick["rightWinClick"] := "b"
    simulateTyping("hello world")
    processKeyDown("leftCtrlClick")
    sleep 100
    processKeyDown("leftShiftClick")
    sleep 100
    processKeyDown("rightWinClick")
    sleep 100
    processKeyUp("leftCtrlClick")
    sleep 100
    processKeyUp("rightWinClick")
    sleep 100
    processKeyUp("leftShiftClick")
    sleep 100
    expected := "hello worldB"

    validateTestOutput(A_ThisFunc , expected)
}
