When_rightCtrlClick_pressed_shift_pressed_leftAltClick_THEN_word_is_selected_before_leftAltClickRelease_#3601()
{
    modifierDoubledAsClick["leftAltClick"] := "left"
    simulateTyping("hello world")
    processKeyDown("rightCtrlClick")
    sleep 100
    simulateKeyDown("lshift", 100)
    sleep 100
    processKeyDown("leftAltClick")
    sleep 100
    sleep %timerTimeoutStickyKeys%
    actual := getSelectedText()
    processKeyUp("rightCtrlClick")
    sleep 100
    processKeyUp("leftAltClick")
    sleep 100
    simulateKeyUp("lshift", 100)
    expected := "world"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightCtrlClick_doubled_as_d_pressed_shift_pressed_leftAltClick_rightCtrlClick_release_shift_leftAltClick_release_THEN_text_not_modified_#3602()
{
    modifierDoubledAsClick["leftAltClick"] := "left"
    modifierDoubledAsClick["rightCtrlClick"] := "d"
    simulateTyping("hello world")
    processKeyDown("rightCtrlClick")
    sleep 100
    simulateKeyDown("lshift", 100)
    sleep 100
    modifierDoubledAsClick["leftAltClick"] := "b"
    processKeyDown("leftAltClick")
    sleep 100
    processKeyUp("rightCtrlClick")
    sleep 100
    processKeyUp("leftAltClick")
    sleep 100
    simulateKeyUp("lshift", 100)
    expected := "hello world"

    validateTestOutput(A_ThisFunc , expected)
}
