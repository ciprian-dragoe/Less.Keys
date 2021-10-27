When_rightShiftClick_pressed_leftShiftClick_doubled_as_d_is_pressed_THEN_D_is_sent_after_leftShiftClick_release_#2101()
{
    modifierDoubledAsClick["leftShiftClick"] := "d"
    simulateTyping("hello worl")
    simulateKeyDown("rightShiftClick")
    sleep 100
    simulateKeyDown("leftShiftClick")
    sleep 100
    simulateKeyUp("leftShiftClick")
    sleep 100
    actual := clearText()
    simulateKeyUp("rightShiftClick")
    sleep 100
    expected := "hello worlD"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightShiftClick_pressed_leftShiftClick_pressed_THEN_whole_text_is_selected_after_rightShiftClick_release_#2102()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    simulateKeyDown("rightShiftClick")
    sleep 100
    simulateKeyDown("leftShiftClick")
    sleep 100
    simulateKeyUp("leftShiftClick")
    sleep %timerTimeoutStickyKeys%
    actual := getSelectedText()
    simulateKeyUp("rightShiftClick")
    sleep 100

    expected := "hello "
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightShiftClick_doubled_as_d_pressed_leftShiftClick_pressed_rightShiftClick_release_leftShiftClick_release_THEN_d_is_not_sent_#2103()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    simulateKeyDown("rightShiftClick")
    sleep 100
    simulateKeyDown("leftShiftClick")
    sleep 100
    simulateKeyUp("rightShiftClick")
    sleep 100
    simulateKeyUp("leftShiftClick")
    sleep 100
    actual := clearText()

    expected := "hello "
    validateTestOutput(A_ThisFunc , expected)
}

When_rightShiftClick_pressed_leftShiftClick_pressed_mouse_moved_until_second_word_THEN_only_second_word_is_selected_#2104()
{
    setMousePositionToCaret()
    simulateTyping("hello")
    destination := getCurrentCaretPosition()
    simulateTyping(" world")
    simulateKeyDown("rightShiftClick")
    sleep 100
    simulateKeyDown("leftShiftClick")
    sleep 100
    MouseMove destination.x, destination.y
    simulateKeyUp("rightShiftClick")
    sleep 100
    simulateKeyUp("leftShiftClick")
    sleep 100
    actual := getSelectedText()

    expected := "world"
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightShiftClick_pressed_leftShiftClick_pressed_timeout_passed_leftShiftClick_released_THEN_text_is_not_selected_on_mouse_move_#2105()
{
    timeoutStillSendLayoutKey := 300
    setMousePositionToCaret()
    simulateTyping("he")
    destination := getCurrentCaretPosition()
    simulateTyping("llo")
    simulateKeyDown("rightShiftClick")
    sleep 30
    simulateKeyDown("leftShiftClick")
    sleep 30
    sleep %timeoutStillSendLayoutKey%
    MouseMove destination.x, destination.y
    simulateKeyUp("leftShiftClick")
    sleep 30
    simulateKeyUp("rightShiftClick")
    sleep 100
    actual := getSelectedText()

    expected := ""
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}
