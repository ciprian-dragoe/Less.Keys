When_leftShiftClick_is_pressed_rightShiftClick_doubled_as_d_is_pressed_THEN_D_is_sent_after_rightShiftClick_release_#2201()
{
    modifierDoubledAsClick["rightShiftClick"] := "d"
    simulateTyping("hello worl")
    processKeyDown("leftShiftClick")
    sleep 100
    processKeyDown("rightShiftClick")
    sleep 100
    processKeyUp("rightShiftClick")
    actual := clearText()
    sleep 100
    processKeyUp("leftShiftClick")
    sleep 100
    expected := "hello worlD"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftShiftClick_pressed_rightShiftClick_pressed_THEN_whole_text_is_selected_after_leftShiftClick_release_#2202()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    processKeyDown("leftShiftClick")
    sleep 100
    processKeyDown("rightShiftClick")
    sleep 100
    processKeyUp("rightShiftClick")
    sleep %timerTimeoutStickyKeys%
    actual := getSelectedText()
    processKeyUp("leftShiftClick")
    sleep 100

    expected := "hello "
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftShiftClick_doubled_as_d_pressed_rightShiftClick_pressed_leftShiftClick_release_rightShiftClick_release_THEN_d_is_not_sent_#2203()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    processKeyDown("leftShiftClick")
    sleep 100
    processKeyDown("rightShiftClick")
    sleep 100
    processKeyUp("leftShiftClick")
    sleep 100
    processKeyUp("rightShiftClick")
    sleep 100
    actual := clearText()

    expected := "hello "
    validateTestOutput(A_ThisFunc , expected)
}

When_leftShiftClick_pressed_rightShiftClick_pressed_mouse_moved_until_second_word_THEN_only_second_word_is_selected_#2204()
{
    setMousePositionToCaret()
    simulateTyping("hello")
    destination := getCurrentCaretPosition()
    simulateTyping(" world")
    processKeyDown("leftShiftClick")
    sleep 100
    processKeyDown("rightShiftClick")
    sleep 100
    MouseMove destination.x, destination.y
    processKeyUp("leftShiftClick")
    sleep 100
    processKeyUp("rightShiftClick")
    sleep 100
    actual := getSelectedText()

    expected := "world"
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftShiftClick_pressed_layoutKey_pressed_rightShiftClick_pressed_at_release_capitalized_alternative_value_is_sent_#2205()
{
    simulateTyping("w ")
    processKeyDown("leftShiftClick")
    sleep 100
    processKeyDown("space")
    sleep 100
    processKeyDown("rightShiftClick")
    sleep 100
    processKeyUp("rightShiftClick")
    sleep 100
    processKeyUp("space")
    sleep 100
    processKeyUp("leftShiftClick")

    expected := "w Y"
    validateTestOutput(A_ThisFunc , expected)
}
