When_leftCtrlClick_pressed_shift_pressed_rightWinClick_THEN_word_is_selected_before_rightWinClickRelease_#6001()
{
    modifierDoubledAsClick["rightWinClick"] := "left"
    simulateTyping("hello world")
    processKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyDown("lshift", 100)
    sleep 100
    processKeyDown("rightWinClick")
    sleep 100
    sleep %timerTimeoutStickyKeys%
    actual := getSelectedText()
    processKeyUp("leftCtrlClick")
    sleep 100
    processKeyUp("rightWinClick")
    sleep 100
    simulateKeyUp("lshift", 100)
    expected := "world"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftCtrlClick_doubled_as_d_pressed_shift_pressed_rightWinClick_leftCtrlClick_release_shift_rightWinClick_release_THEN_text_not_modified_#6002()
{
    modifierDoubledAsClick["rightWinClick"] := "left"
    modifierDoubledAsClick["leftCtrlClick"] := "d"
    simulateTyping("hello world")
    processKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyDown("lshift", 100)
    sleep 100
    modifierDoubledAsClick["rightWinClick"] := "b"
    processKeyDown("rightWinClick")
    sleep 100
    processKeyUp("leftCtrlClick")
    sleep 100
    processKeyUp("rightWinClick")
    sleep 100
    simulateKeyUp("lshift", 100)
    expected := "hello world"

    validateTestOutput(A_ThisFunc , expected)
}
