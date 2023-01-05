When_rightShiftClick_pressed_leftCtrlClick_doubled_as_left_pressed_THEN_letter_is_selected_after_leftCtrlClick_release_#2301()
{
    modifierDoubledAsClick["leftCtrlClick"] := "left"
    simulateTyping("hello")
    simulateKeyDown("rightShiftClick")
    sleep 100
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyUp("leftCtrlClick")
    sleep % timerTimeoutStickyKeys + 2 * timerTimeoutStickyKeys
    actual := getSelectedText()
    simulateKeyUp("rightShiftClick")
    sleep 100
    expected := "o"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightShiftClick_doubles_as_b_pressed_leftCtrlClick_doubled_as_c_pressed_rightShiftClick_released_leftCtrlClick_released_THEN_letter_is_sent_#2302()
{
    modifierDoubledAsClick["leftCtrlClick"] := "c"
    modifierDoubledAsClick["rightShiftClick"] := "b"
    simulateTyping("hello")
    simulateKeyDown("rightShiftClick")
    sleep 100
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyUp("rightShiftClick")
    sleep 100
    simulateKeyUp("leftCtrlClick")
    sleep 100
    expected := "helloc"

    validateTestOutput(A_ThisFunc , expected)
}

When_rightShiftClick_pressed_leftCtrlClick_THEN_word_is_selected_after_leftCtrlClickRelease_#2303()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    simulateKeyDown("rightShiftClick")
    sleep 100
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyUp("leftCtrlClick")
    sleep % timerTimeoutStickyKeys + 2 * timerTimeoutStickyKeys
    actual := getSelectedText()
    simulateKeyUp("rightShiftClick")
    sleep 100
    expected := "hello "

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightShiftClick_pressed_leftCtrlClick_pressed_and_mouse_moved_until_second_word_THEN_only_second_word_is_selected_#2304()
{
    setMousePositionToCaret()
    simulateTyping("hello")
    destination := getCurrentCaretPosition()
    simulateTyping(" world")
    simulateKeyDown("rightShiftClick")
    sleep 100
    simulateKeyDown("leftCtrlClick")
    sleep 100
    MouseMove destination.x, destination.y
    simulateKeyUp("rightShiftClick")
    sleep 100
    simulateKeyUp("leftCtrlClick")
    sleep 100
    actual := getSelectedText()

    expected := " world"
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightShiftClick_pressed_layoutKey_pressed_leftCtrlClick_pressed_THEN_ctrlActive_is_reset_on_leftCtrlClick_release_#2305()
{
    setMousePositionToCaret()
    simulateTyping("hello")
    simulateKeyDown("rightShiftClick")
    sleep 100
    simulateKeyDown("space")
    sleep 100
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyUp("rightShiftClick")
    sleep 100
    simulateKeyUp("leftCtrlClick")
    sleep 100
    simulateKeyUp("space")
    sleep 100

    actual := "" . ctrlActive
    addTestResult(A_ThisFunc, "0", actual, evaluateResult(actual, "0"))
    setDefaultTestEnvironment(A_ThisFunc)
}

