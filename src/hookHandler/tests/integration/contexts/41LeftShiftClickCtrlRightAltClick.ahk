When_leftShiftClick_pressed_ctrl_pressed_leftAltClick_pressed_THEN_word_is_selected_after_rightAltClick_release_#4101()
{
    modifierDoubledAsClick["rightAltClick"] := "left"
    simulateTyping("hello world")
    simulateKeyDown("leftShiftClick")
    sleep 100
    simulateKeyDown("lctrl", 100)
    sleep 100
    simulateKeyDown("rightAltClick")
    sleep 100
    simulateKeyUp("rightAltClick")
    sleep % timerTimeoutStickyKeys + 2 * timerTimeoutStickyKeys
    actual := getSelectedText()
    simulateKeyUp("leftShiftClick")
    sleep 100
    simulateKeyUp("lctrl", 100)
    expected := "world"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftShiftClick_doubled_as_d_pressed_ctrl_pressed_rightAltClick_pressed_leftShiftClick_release_ctrl_release_rightAltClick_release_THEN_b_letter_is_sent_#4102()
{
    modifierDoubledAsClick["leftShiftClick"] := "d"
    modifierDoubledAsClick["rightAltClick"] := "b"
    simulateTyping("hello world")
    simulateKeyDown("leftShiftClick")
    sleep 100
    simulateKeyDown("lctrl", 100)
    sleep 100
    simulateKeyDown("rightAltClick")
    sleep 100
    simulateKeyUp("leftShiftClick")
    sleep 100
    simulateKeyUp("lctrl", 100)
    sleep 100
    simulateKeyUp("rightAltClick")
    expected := "hello worldb"

    validateTestOutput(A_ThisFunc , expected)
}
