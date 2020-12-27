When_leftCtrlClick_pressed_shift_pressed_rightAltClick_THEN_word_is_selected_before_rightAltClickRelease_#4401()
{
    modifierDoubledAsClick["rightAltClick"] := "left"
    simulateTyping("hello world")
    processKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyDown("lshift", 100)
    sleep 100
    processKeyDown("rightAltClick")
    sleep 100
    sleep %timerTimeoutStickyKeys%
    actual := getSelectedText()
    processKeyUp("leftCtrlClick")
    sleep 100
    processKeyUp("rightAltClick")
    sleep 100
    simulateKeyUp("lshift", 100)
    expected := "world"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftCtrlClick_doubled_as_d_pressed_shift_pressed_rightAltClick_leftCtrlClick_release_shift_rightAltClick_release_THEN_text_not_modified_#4402()
{
    modifierDoubledAsClick["rightAltClick"] := "left"
    modifierDoubledAsClick["leftCtrlClick"] := "d"
    simulateTyping("hello world")
    processKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyDown("lshift", 100)
    sleep 100
    modifierDoubledAsClick["rightAltClick"] := "b"
    processKeyDown("rightAltClick")
    sleep 100
    processKeyUp("leftCtrlClick")
    sleep 100
    processKeyUp("rightAltClick")
    sleep 100
    simulateKeyUp("lshift", 100)
    expected := "hello world"

    validateTestOutput(A_ThisFunc , expected)
}
