When_rightCtrlClick_doubled_as_b_pressed_leftShiftClick_doubled_as_a_pressed_timeout_pass_leftShiftClick_released_THEN_letter_is_not_sent_#3301()
{
    modifierDoubledAsClick["leftShiftClick"] := "a"
    modifierDoubledAsClick["rightCtrlClick"] := "b"
    simulateTyping("hello")
    processKeyDown("rightCtrlClick")
    sleep 100
    processKeyDown("leftShiftClick")
    sleep 100
    sleep %timeoutStillSendLayoutKey%
    processKeyUp("rightCtrlClick")
    sleep 100
    processKeyUp("leftShiftClick")
    sleep 100
    expected := "hello"

    validateTestOutput(A_ThisFunc , expected)
}

When_rightCtrlClick_doubles_as_b_pressed_leftShiftClick_doubled_as_c_pressed_rightCtrlClick_released_leftShiftClick_released_THEN_c_letter_is_sent_#3302()
{
    modifierDoubledAsClick["leftShiftClick"] := "c"
    modifierDoubledAsClick["rightCtrlClick"] := "b"
    simulateTyping("hello")
    processKeyDown("rightCtrlClick")
    sleep 100
    processKeyDown("leftShiftClick")
    sleep 100
    processKeyUp("rightCtrlClick")
    sleep 100
    processKeyUp("leftShiftClick")
    sleep 100
    expected := "helloc"

    validateTestOutput(A_ThisFunc , expected)
}

When_rightCtrlClick_pressed_leftShiftClick_press_and_released_THEN_word_is_typed_at_beginning_#3303()
{
    setMousePositionToCaret()
    simulateTyping("hello")
    processKeyDown("rightCtrlClick")
    sleep 100
    processKeyDown("leftShiftClick")
    sleep 100
    processKeyUp("rightCtrlClick")
    sleep 100
    processKeyUp("leftShiftClick")
    sleep 100
    simulateTyping("w")
    expected := "whello"

    validateTestOutput(A_ThisFunc , expected)
}

When_rightCtrlClick_pressed_leftShiftClick_pressed_mouse_moved_until_second_word_THEN_only_first_word_is_selected_#3304()
{
    setMousePositionToCaret()
    simulateTyping("hello")
    destination := getCurrentCaretPosition()
    simulateTyping(" world")
    processKeyDown("rightCtrlClick")
    sleep 100
    processKeyDown("leftShiftClick")
    sleep 100
    MouseMove destination.x, destination.y
    processKeyUp("rightCtrlClick")
    sleep 100
    processKeyUp("leftShiftClick")
    sleep 100
    actual := getSelectedText()

    expected := "hello "
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}
