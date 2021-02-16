When_leftCtrlClick_is_pressed_rightCtrlClick_doubled_as_a_is_pressed_all_text_is_selected_after_rightCtrlClick_release_#1901()
{
    modifierDoubledAsClick["rightCtrlClick"] := "a"
    simulateTyping("hello ")
    processKeyDown("leftCtrlClick")
    sleep 100
    processKeyDown("rightCtrlClick")
    sleep 100
    processKeyUp("rightCtrlClick")
    sleep %timerTimeoutStickyKeys%
    sleep 100
    processKeyUp("leftCtrlClick")
    actual := getSelectedText()
    sleep 100
    expected := "hello "

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftCtrlClick_doubled_as_b_pressed_rightCtrlClick_doubled_as_a_pressed_leftCtrlClick_released_rightCtrlClick_released_THEN_no_letter_is_sent_1902()
{
    modifierDoubledAsClick["rightCtrlClick"] := "a"
    modifierDoubledAsClick["leftCtrlClick"] := "b"
    simulateTyping("hello ")
    processKeyDown("leftCtrlClick")
    sleep 100
    processKeyDown("rightCtrlClick")
    sleep 100
    processKeyUp("leftCtrlClick")
    sleep 100
    processKeyUp("rightCtrlClick")
    sleep 100
    actual := getSelectedText()

    expected := "hello "
    validateTestOutput(A_ThisFunc , expected)
}

When_leftCtrlClick_pressed_rightCtrlClick_pressed_mouse_moved_until_second_word_THEN_only_first_word_is_selected_#1903()
{
    setMousePositionToCaret()
    simulateTyping("hello")
    destination := getCurrentCaretPosition()
    simulateTyping(" world")
    processKeyDown("leftCtrlClick")
    sleep 100
    processKeyDown("rightCtrlClick")
    sleep 100
    MouseMove destination.x, destination.y
    processKeyUp("leftCtrlClick")
    sleep 100
    processKeyUp("rightCtrlClick")
    sleep 100
    actual := getSelectedText()

    expected := "hello "
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftCtrlClick_doubled_as_b_pressed_rightCtrlClick_doubled_as_a_pressed_leftCtrlClick_released_rightCtrlClick_released_after_timeout_THEN_a_not_sent_1904()
{
    modifierDoubledAsClick["rightCtrlClick"] := "a"
    modifierDoubledAsClick["leftCtrlClick"] := "b"
    simulateTyping("hello")
    processKeyDown("leftCtrlClick")
    sleep 100
    processKeyDown("rightCtrlClick")
    sleep 100
    processKeyUp("leftCtrlClick")
    sleep %timeoutStillSendLayoutKey%
    processKeyUp("rightCtrlClick")
    sleep 100
    actual := getSelectedText()

    expected := "hello"
    validateTestOutput(A_ThisFunc , expected)
}
