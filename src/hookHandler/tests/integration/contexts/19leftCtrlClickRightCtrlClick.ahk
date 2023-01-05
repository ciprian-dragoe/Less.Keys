When_leftCtrlClick_is_pressed_rightCtrlClick_doubled_as_a_is_pressed_all_text_is_selected_after_rightCtrlClick_release_#1901()
{
    modifierDoubledAsClick["rightCtrlClick"] := "a"
    simulateTyping("hello ")
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyDown("rightCtrlClick")
    sleep 100
    simulateKeyUp("rightCtrlClick")
    sleep % timerTimeoutStickyKeys + 2 * timerTimeoutStickyKeys
    sleep 100
    simulateKeyUp("leftCtrlClick")
    actual := getSelectedText()
    sleep 100
    expected := "hello "

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftCtrlClick_doubled_as_b_pressed_rightCtrlClick_doubled_as_a_pressed_leftCtrlClick_released_rightCtrlClick_released_THEN_a_is_sent_1902()
{
    modifierDoubledAsClick["rightCtrlClick"] := "a"
    modifierDoubledAsClick["leftCtrlClick"] := "b"
    simulateTyping("hello ")
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyDown("rightCtrlClick")
    sleep 100
    simulateKeyUp("leftCtrlClick")
    sleep 100
    simulateKeyUp("rightCtrlClick")
    sleep 100
    actual := getSelectedText()

    expected := "hello a"
    validateTestOutput(A_ThisFunc , expected)
}

When_leftCtrlClick_pressed_rightCtrlClick_pressed_mouse_moved_until_second_word_THEN_only_first_word_is_selected_#1903()
{
    setMousePositionToCaret()
    simulateTyping("hello")
    destination := getCurrentCaretPosition()
    simulateTyping(" world")
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyDown("rightCtrlClick")
    sleep 100
    MouseMove destination.x, destination.y
    simulateKeyUp("leftCtrlClick")
    sleep 100
    simulateKeyUp("rightCtrlClick")
    sleep 100
    actual := getSelectedText()

    expected := "hello"
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftCtrlClick_doubled_as_b_pressed_rightCtrlClick_doubled_as_a_pressed_leftCtrlClick_released_rightCtrlClick_released_after_timeout_THEN_a_not_sent_1904()
{
    modifierDoubledAsClick["rightCtrlClick"] := "a"
    modifierDoubledAsClick["leftCtrlClick"] := "b"
    simulateTyping("hello")
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyDown("rightCtrlClick")
    sleep 100
    simulateKeyUp("leftCtrlClick")
    sleep %timeoutStillSendLayoutKey%
    simulateKeyUp("rightCtrlClick")
    sleep 100
    actual := getSelectedText()

    expected := "hello"
    validateTestOutput(A_ThisFunc , expected)
}
