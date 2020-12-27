When_rightShiftClick_is_pressed_leftShiftClick_doubled_as_d_is_pressed_THEN_D_is_sent_before_a_leftShiftClickRelease_#2101()
{
    modifierDoubledAsClick["leftShiftClick"] := "d"
    simulateTyping("hello worl")
    processKeyDown("rightShiftClick")
    sleep 100
    processKeyDown("leftShiftClick")
    sleep 100
    actual := clearText()
    processKeyUp("rightShiftClick")
    sleep 100
    processKeyUp("leftShiftClick")
    sleep 100
    expected := "hello worlD"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightShiftClick_pressed_leftShiftClick_pressed_THEN_whole_text_is_selected_before_rightShiftClick_release_#2102()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    processKeyDown("rightShiftClick")
    sleep 100
    processKeyDown("leftShiftClick")
    sleep %timerTimeoutStickyKeys%
    actual := getSelectedText()
    processKeyUp("rightShiftClick")
    sleep 100
    processKeyUp("leftShiftClick")
    sleep 100

    expected := "hello "
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightShiftClick_doubled_as_d_pressed_leftShiftClick_pressed_rightShiftClick_release_leftShiftClick_release_THEN_d_is_not_sent_#2103()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    processKeyDown("rightShiftClick")
    sleep 100
    processKeyDown("leftShiftClick")
    sleep 100
    processKeyUp("rightShiftClick")
    sleep 100
    processKeyUp("leftShiftClick")
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
    processKeyDown("rightShiftClick")
    sleep 100
    processKeyDown("leftShiftClick")
    sleep 100
    MouseMove destination.x, destination.y
    processKeyUp("rightShiftClick")
    sleep 100
    processKeyUp("leftShiftClick")
    sleep 100
    actual := getSelectedText()

    expected := "world"
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}
