When_leftShiftClick_pressed_rightAltClick_doubled_as_left_pressed_THEN_letter_is_selected_after_rightAltClickRelease_#4201()
{
    modifierDoubledAsClick["rightAltClick"] := "left"
    simulateTyping("hello")
    simulateKeyDown("leftShiftClick")
    sleep 100
    simulateKeyDown("rightAltClick")
    sleep 100
    simulateKeyUp("rightAltClick")
    sleep %timerTimeoutStickyKeys%
    actual := getSelectedText()
    simulateKeyUp("leftShiftClick")
    sleep 100
    expected := "o"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftShiftClick_doubles_as_b_pressed_rightAltClick_doubled_as_c_pressed_leftShiftClick_released_rightAltClick_released_THEN_c_letter_is_sent_#4202()
{
    modifierDoubledAsClick["leftShiftClick"] := "b"
    modifierDoubledAsClick["rightAltClick"] := "c"
    simulateTyping("hello")
    simulateKeyDown("leftShiftClick")
    sleep 100
    simulateKeyDown("rightAltClick")
    sleep 100
    simulateKeyUp("leftShiftClick")
    sleep 100
    simulateKeyUp("rightAltClick")
    sleep 100
    expected := "helloc"

    validateTestOutput(A_ThisFunc , expected)
}

When_leftShiftClick_pressed_rightAltClick_THEN_word_is_selected_after_rightAltClickRelease_#4203()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    simulateKeyDown("leftShiftClick")
    sleep 100
    simulateKeyDown("rightAltClick")
    sleep 100
    simulateKeyUp("rightAltClick")
    sleep %timerTimeoutStickyKeys%
    actual := getSelectedText()
    simulateKeyUp("leftShiftClick")
    sleep 100
    expected := "hello "

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftShiftClick_pressed_rightAltClick_pressed_mouse_moved_until_second_word_THEN_only_second_word_is_selected_#4204()
{
    setMousePositionToCaret()
    simulateTyping("hello")
    destination := getCurrentCaretPosition()
    simulateTyping(" world")
    simulateKeyDown("leftShiftClick")
    sleep 100
    simulateKeyDown("rightAltClick")
    sleep 100
    MouseMove destination.x, destination.y
    simulateKeyUp("rightShiftClick")
    sleep 100
    simulateKeyUp("rightAltClick")
    sleep 100
    actual := getSelectedText()

    expected := "world"
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}
