When_rightShiftClick_pressed_leftWinClick_doubled_as_left_pressed_THEN_letter_is_selected_after_leftWinClick_release_#5901()
{
    modifierDoubledAsClick["leftWinClick"] := "left"
    simulateTyping("hello")
    processKeyDown("rightShiftClick")
    sleep 100
    processKeyDown("leftWinClick")
    sleep 100
    processKeyUp("leftWinClick")
    sleep 100
    processKeyUp("rightShiftClick")
    sleep 100
    actual := getSelectedText()
    expected := "o"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightShiftClick_doubles_as_b_pressed_leftWinClick_doubled_as_c_pressed_rightShiftClick_released_leftWinClick_released_THEN_c_letter_is_sent_#5902()
{
    modifierDoubledAsClick["leftWinClick"] := "c"
    modifierDoubledAsClick["rightShiftClick"] := "b"
    simulateTyping("hello")
    processKeyDown("rightShiftClick")
    sleep 100
    processKeyDown("leftWinClick")
    sleep 100
    processKeyUp("rightShiftClick")
    sleep 100
    processKeyUp("leftWinClick")
    sleep 100
    expected := "helloc"

    validateTestOutput(A_ThisFunc , expected)
}

When_rightShiftClick_pressed_leftWinClick_pressed_THEN_word_is_selected_after_leftWinClick_release_#5903()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    processKeyDown("rightShiftClick")
    sleep 100
    processKeyDown("leftWinClick")
    sleep 100
    processKeyUp("leftWinClick")
    sleep 100
    processKeyUp("rightShiftClick")
    actual := getSelectedText()
    sleep 100
    expected := "hello "

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightShiftClick_pressed_leftWinClick_pressed_mouse_moved_until_second_word_THEN_only_second_is_selected_#5904()
{
    setMousePositionToCaret()
    simulateTyping("hello")
    destination := getCurrentCaretPosition()
    simulateTyping(" world")
    processKeyDown("rightShiftClick")
    sleep 100
    processKeyDown("leftWinClick")
    sleep 100
    MouseMove destination.x, destination.y
    processKeyUp("rightShiftClick")
    sleep 100
    processKeyUp("leftWinClick")
    sleep 100
    actual := getSelectedText()

    expected := "world"
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}
