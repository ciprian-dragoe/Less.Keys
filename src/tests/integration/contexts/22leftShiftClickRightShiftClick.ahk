When_leftShiftClick_is_pressed_rightShiftClick_doubled_as_d_is_pressed_THEN_D_is_sent_before_a_rightShiftClickRelease_#2201()
{
    modifierDoubledAsClick["rightShiftClick"] := "d"
    simulateTyping("hello worl")
    processKeyDown("leftShiftClick")
    sleep 100
    processKeyDown("rightShiftClick")
    sleep 100
    actual := clearText()
    processKeyUp("leftShiftClick")
    sleep 100
    processKeyUp("rightShiftClick")
    sleep 100
    expected := "hello worlD"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftShiftClick_pressed_rightShiftClick_pressed_THEN_whole_text_is_selected_before_leftShiftClick_release_#2202()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    processKeyDown("leftShiftClick")
    sleep 100
    processKeyDown("rightShiftClick")
    sleep %timerTimeoutStickyKeys%
    actual := getSelectedText()
    processKeyUp("leftShiftClick")
    sleep 100
    processKeyUp("rightShiftClick")
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

When_leftShiftClick_pressed_in_less_then_timeoutProcessLayoutOnRelease_after_letter_release_rightShiftClick_pressed_mouse_moved_until_second_word_THEN_only_second_word_is_selected_#2205()
{
    timeoutProcessLayoutOnRelease := 1000
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

When_leftShiftClick_pressed_in_less_then_timeoutProcessLayoutOnRelease_after_letter_release_rightShiftClick_pressed_mouse_moved_until_second_word_leftShiftClick_release_THEN_only_second_word_is_selected_#2206()
{
    timeoutProcessLayoutOnRelease := 1000
    setMousePositionToCaret()
    simulateTyping("hello")
    destination := getCurrentCaretPosition()
    simulateTyping(" world")
    processKeyDown("leftShiftClick")
    sleep 100
    processKeyDown("rightShiftClick")
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

When_leftShiftClick_pressed_in_less_then_timeoutProcessLayoutOnRelease_after_letter_release_rightShiftClick_pressed_leftShiftClick_release_mouse_moved_until_second_word_THEN_only_second_word_is_selected_#2207()
{
    timeoutProcessLayoutOnRelease := 1000
    setMousePositionToCaret()
    simulateTyping("hello")
    destination := getCurrentCaretPosition()
    simulateTyping(" world")
    processKeyDown("leftShiftClick")
    sleep 100
    processKeyDown("rightShiftClick")
    sleep 100
    processKeyUp("leftShiftClick")
    sleep 100
    MouseMove destination.x, destination.y
    processKeyUp("rightShiftClick")
    sleep 100
    actual := getSelectedText()

    expected := "world"
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftShiftClick_pressed_in_less_then_timeoutProcessLayoutOnRelease_after_letter_release_rightShiftClick_doubled_as_w_pressed_leftShiftClick_release_THEN_w_is_typed_#2208()
{
    modifierDoubledAsClick["rightShiftClick"] := "w"
    setMousePositionToCaret()
    timeoutProcessLayoutOnRelease := 1000
    simulateTyping("hello")
    processKeyDown("leftShiftClick")
    sleep 100
    processKeyDown("rightShiftClick")
    sleep 100
    processKeyUp("leftShiftClick")
    sleep 100
    processKeyUp("rightShiftClick")
    sleep 100
    actual := clearText()

    expected := "hellow"
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftShiftClick_pressed_in_less_then_timeoutProcessLayoutOnRelease_after_letter_release_rightShiftClick_doubled_as_w_pressed_THEN_W_is_typed_#2209()
{
    modifierDoubledAsClick["rightShiftClick"] := "w"
    setMousePositionToCaret()
    timeoutProcessLayoutOnRelease := 1000
    simulateTyping("hello")
    processKeyDown("leftShiftClick")
    sleep 100
    processKeyDown("rightShiftClick")
    sleep 100
    processKeyUp("rightShiftClick")
    sleep 100
    processKeyUp("leftShiftClick")
    sleep 100
    actual := clearText()

    expected := "helloW"
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftShiftClick_pressed_before_typing_rightShiftClick_doubled_as_w_pressed_in_less_then_timeoutProcessLayoutOnRelease_rightShiftClick_release_THEN_W_is_typed_#2210()
{
    modifierDoubledAsClick["rightShiftClick"] := "w"
    timerTimeoutStickyKeys := 4000
    timeoutProcessLayoutOnRelease := 1000
    setMousePositionToCaret()
    processKeyDown("leftShiftClick")
    simulateTyping("hello")
    sleep 100
    processKeyDown("rightShiftClick")
    sleep 100
    processKeyUp("rightShiftClick")
    sleep 100
    processKeyUp("leftShiftClick")
    sleep 100
    actual := clearText()

    expected := "HELLOW"
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}
