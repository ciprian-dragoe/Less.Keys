When_leftShiftClick_pressed_rightCtrlClick_doubled_as_left_pressed_THEN_letter_is_selected_after_rightCtrlClickRelease_#2401()
{
    modifierDoubledAsClick["rightCtrlClick"] := "left"
    simulateTyping("hello")
    processKeyDown("leftShiftClick")
    sleep 100
    processKeyDown("rightCtrlClick")
    sleep 100
    processKeyUp("rightCtrlClick")
    sleep %timerTimeoutStickyKeys%
    actual := getSelectedText()
    processKeyUp("leftShiftClick")
    sleep 100
    expected := "o"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftShiftClick_doubles_as_b_pressed_rightCtrlClick_doubled_as_c_pressed_leftShiftClick_released_rightCtrlClick_released_THEN_c_letter_is_sent_#2402()
{
    modifierDoubledAsClick["leftShiftClick"] := "b"
    modifierDoubledAsClick["rightCtrlClick"] := "c"
    simulateTyping("hello")
    processKeyDown("leftShiftClick")
    sleep 100
    processKeyDown("rightCtrlClick")
    sleep 100
    processKeyUp("leftShiftClick")
    sleep 100
    processKeyUp("rightCtrlClick")
    sleep 100
    expected := "helloc"

    validateTestOutput(A_ThisFunc , expected)
}

When_leftShiftClick_pressed_rightCtrlClick_THEN_word_is_selected_after_rightCtrlClickRelease_#2403()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    processKeyDown("leftShiftClick")
    sleep 100
    processKeyDown("rightCtrlClick")
    sleep 100
    processKeyUp("rightCtrlClick")
    sleep %timerTimeoutStickyKeys%
    actual := getSelectedText()
    processKeyUp("leftShiftClick")
    sleep 100
    expected := "hello "

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftShiftClick_pressed_rightCtrlClick_pressed_mouse_moved_until_second_word_THEN_only_first_word_is_selected_#2404()
{
    setMousePositionToCaret()
    simulateTyping("hello")
    destination := getCurrentCaretPosition()
    simulateTyping(" world")
    processKeyDown("leftShiftClick")
    sleep 100
    processKeyDown("rightCtrlClick")
    sleep 100
    MouseMove destination.x, destination.y
    processKeyUp("rightShiftClick")
    sleep 100
    processKeyUp("rightCtrlClick")
    sleep 100
    actual := getSelectedText()

    expected := "hello "
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}
