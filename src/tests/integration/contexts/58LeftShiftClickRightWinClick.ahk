When_leftShiftClick_pressed_rightWinClick_doubled_as_left_pressed_THEN_letter_is_selected_after_rightWinClickRelease_#5801()
{
    modifierDoubledAsClick["rightWinClick"] := "left"
    simulateTyping("hello")
    processKeyDown("leftShiftClick")
    sleep 100
    processKeyDown("rightWinClick")
    sleep 100
    processKeyUp("rightWinClick")
    sleep %timerTimeoutStickyKeys%
    actual := getSelectedText()
    processKeyUp("leftShiftClick")
    sleep 100
    expected := "o"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftShiftClick_doubles_as_b_pressed_rightWinClick_doubled_as_c_pressed_leftShiftClick_released_rightWinClick_released_THEN_c_letter_is_sent_#5802()
{
    modifierDoubledAsClick["leftShiftClick"] := "b"
    modifierDoubledAsClick["rightWinClick"] := "c"
    simulateTyping("hello")
    processKeyDown("leftShiftClick")
    sleep 100
    processKeyDown("rightWinClick")
    sleep 100
    processKeyUp("leftShiftClick")
    sleep 100
    processKeyUp("rightWinClick")
    sleep 100
    expected := "helloc"

    validateTestOutput(A_ThisFunc , expected)
}

When_leftShiftClick_pressed_rightWinClick_THEN_word_is_selected_after_rightWinClickRelease_#5803()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    processKeyDown("leftShiftClick")
    sleep 100
    processKeyDown("rightWinClick")
    sleep 100
    processKeyUp("rightWinClick")
    sleep %timerTimeoutStickyKeys%
    actual := getSelectedText()
    processKeyUp("leftShiftClick")
    sleep 100
    expected := "hello "

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftShiftClick_pressed_rightWinClick_pressed_mouse_moved_until_second_word_THEN_only_second_word_is_selected_#5804()
{
    setMousePositionToCaret()
    simulateTyping("hello")
    destination := getCurrentCaretPosition()
    simulateTyping(" world")
    processKeyDown("leftShiftClick")
    sleep 100
    processKeyDown("rightWinClick")
    sleep 100
    MouseMove destination.x, destination.y
    processKeyUp("rightShiftClick")
    sleep 100
    processKeyUp("rightWinClick")
    sleep 100
    actual := getSelectedText()

    expected := "world"
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}
