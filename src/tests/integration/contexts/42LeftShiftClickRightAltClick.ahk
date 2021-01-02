When_leftShiftClick_pressed_rightAltClick_doubled_as_left_pressed_THEN_letter_is_selected_before_rightAltClickRelease_#4201()
{
    modifierDoubledAsClick["rightAltClick"] := "left"
    simulateTyping("hello")
    processKeyDown("leftShiftClick")
    sleep 100
    processKeyDown("rightAltClick")
    sleep 100
    sleep %timerTimeoutStickyKeys%
    actual := getSelectedText()
    processKeyUp("leftShiftClick")
    sleep 100
    processKeyUp("rightAltClick")
    sleep 100
    expected := "o"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftShiftClick_doubles_as_b_pressed_rightAltClick_doubled_as_c_pressed_leftShiftClick_released_rightAltClick_released_THEN_no_letter_is_sent_#4202()
{
    modifierDoubledAsClick["rightAltClick"] := "left"
    modifierDoubledAsClick["leftShiftClick"] := "b"
    simulateTyping("hello")
    processKeyDown("leftShiftClick")
    sleep 100
    processKeyDown("rightAltClick")
    sleep 100
    processKeyUp("leftShiftClick")
    sleep 100
    modifierDoubledAsClick["rightAltClick"] := "c"
    processKeyUp("rightAltClick")
    sleep 100
    expected := "hello"

    validateTestOutput(A_ThisFunc , expected)
}

When_leftShiftClick_pressed_rightAltClick_THEN_word_is_selected_before_rightAltClickRelease_#4203()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    processKeyDown("leftShiftClick")
    sleep 100
    processKeyDown("rightAltClick")
    sleep 100
    sleep %timerTimeoutStickyKeys%
    actual := getSelectedText()
    processKeyUp("leftShiftClick")
    sleep 100
    processKeyUp("rightAltClick")
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
    processKeyDown("leftShiftClick")
    sleep 100
    processKeyDown("rightAltClick")
    sleep 100
    MouseMove destination.x, destination.y
    processKeyUp("rightShiftClick")
    sleep 100
    processKeyUp("rightAltClick")
    sleep 100
    actual := getSelectedText()

    expected := "world"
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}