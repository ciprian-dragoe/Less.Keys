When_rightShiftClick_doubles_as_b_pressed_leftAltClick_doubled_as_c_pressed_rightShiftClick_released_leftAltClick_released_THEN_c_letter_is_sent_#4301()
{
    modifierDoubledAsClick["leftAltClick"] := "c"
    modifierDoubledAsClick["rightShiftClick"] := "b"
    simulateTyping("hello")
    processKeyDown("rightShiftClick")
    sleep 100
    processKeyDown("leftAltClick")
    sleep 100
    processKeyUp("rightShiftClick")
    sleep 100
    processKeyUp("leftAltClick")
    sleep 100
    expected := "helloc"

    validateTestOutput(A_ThisFunc , expected)
}

When_rightShiftClick_pressed_leftAltClick_pressed_THEN_word_is_selected_on_leftAltClick_release_#4302()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    processKeyDown("rightShiftClick")
    sleep 100
    processKeyDown("leftAltClick")
    sleep 100
    processKeyUp("leftAltClick")
    sleep 100
    processKeyUp("rightShiftClick")
    sleep 100
    actual := getSelectedText()
    expected := "hello "

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightShiftClick_pressed_leftAltClick_doubled_as_b_pressed_THEN_letter_is_not_sent_before_leftAltClick_release_#4303()
{
    modifierDoubledAsClick["leftAltClick"] := "b"
    modifierDoubledAsClick["rightShiftClick"] := "c"
    simulateTyping("hello")
    processKeyDown("rightShiftClick")
    sleep 100
    processKeyDown("leftAltClick")
    sleep % timerTimeoutStickyKeys + 100
    processKeyUp("leftAltClick")
    sleep 100
    processKeyUp("rightShiftClick")
    actual := getSelectedText()
    actual := clearText()
    sleep 100
    expected := "hello"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}