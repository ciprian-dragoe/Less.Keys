When_rightShiftClick_doubles_as_b_pressed_leftAltClick_doubled_as_c_pressed_rightShiftClick_released_leftAltClick_released_THEN_c_letter_is_sent_#4301()
{
    modifierDoubledAsClick["leftAltClick"] := "c"
    modifierDoubledAsClick["rightShiftClick"] := "b"
    simulateTyping("hello")
    simulateKeyDown("rightShiftClick", 100)
    simulateKeyDown("leftAltClick", 100)
    simulateKeyUp("rightShiftClick", 100)
    simulateKeyUp("leftAltClick", 100)
    sleep 100
    expected := "helloc"

    validateTestOutput(A_ThisFunc , expected)
}

When_rightShiftClick_pressed_leftAltClick_pressed_THEN_word_is_selected_on_leftAltClick_release_#4302()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    simulateKeyDown("rightShiftClick")
    sleep 100
    simulateKeyDown("leftAltClick")
    sleep 100
    simulateKeyUp("leftAltClick")
    sleep 100
    simulateKeyUp("rightShiftClick")
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
    simulateKeyDown("rightShiftClick")
    sleep 100
    simulateKeyDown("leftAltClick")
    sleep % timerTimeoutStickyKeys + 2 * timerTimeoutStickyKeys
    simulateKeyUp("leftAltClick")
    sleep 100
    simulateKeyUp("rightShiftClick")
    actual := getSelectedText()
    actual := clearText()
    sleep 100
    expected := "hello"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}
