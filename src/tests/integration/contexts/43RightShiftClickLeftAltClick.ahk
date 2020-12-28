When_rightShiftClick_doubles_as_b_pressed_leftAltClick_doubled_as_c_pressed_rightShiftClick_released_leftAltClick_released_THEN_no_letter_is_sent_#4301()
{
    modifierDoubledAsClick["leftAltClick"] := "left"
    modifierDoubledAsClick["rightShiftClick"] := "b"
    simulateTyping("hello")
    processKeyDown("rightShiftClick")
    sleep 100
    processKeyDown("leftAltClick")
    sleep 100
    processKeyUp("rightShiftClick")
    sleep 100
    modifierDoubledAsClick["leftAltClick"] := "c"
    processKeyUp("leftAltClick")
    sleep 100
    expected := "hello"

    validateTestOutput(A_ThisFunc , expected)
}

When_rightShiftClick_pressed_leftAltClick_THEN_word_is_selected_before_leftAltClickRelease_#4302()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    processKeyDown("rightShiftClick")
    sleep 100
    processKeyDown("leftAltClick")
    sleep 100
    sleep %timerTimeoutStickyKeys%
    actual := getSelectedText()
    processKeyUp("rightShiftClick")
    sleep 100
    processKeyUp("leftAltClick")
    sleep 100
    expected := "hello "

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightShiftClick_pressed_leftAltClick_doubled_as_left_pressed_THEN_letter_is_selected_before_leftAltClick_release_#4303()
{
    modifierDoubledAsClick["leftAltClick"] := "left"
    simulateTyping("hello")
    processKeyDown("rightShiftClick")
    sleep 100
    processKeyDown("leftAltClick")
    sleep 300
    sleep %timerTimeoutStickyKeys%
    actual := getSelectedText()
    processKeyUp("rightShiftClick")
    sleep 100
    processKeyUp("leftAltClick")
    sleep 100
    expected := "o"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}