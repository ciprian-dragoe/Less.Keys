When_leftAltClick_pressed_rightAltClick_pressed_THEN_w_is_sent_at_the_beginning_#3901()
{
    timerTimeoutStickyKeys := 9000
    setMousePositionToCaret()
    simulateTyping("hello ")
    processKeyDown("leftAltClick")
    sleep 100
    processKeyDown("rightAltClick")
    sleep 100
    processKeyUp("leftAltClick")
    sleep 100
    processKeyUp("rightAltClick")
    sleep 100
    simulateTyping("w")
    actual := clearText()

    expected := "whello "
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftAltClick_pressed_rightAltClick_pressed_mouse_moved_until_second_word_THEN_only_first_word_is_selected_#3902()
{
    setMousePositionToCaret()
    simulateTyping("hello")
    destination := getCurrentCaretPosition()
    simulateTyping(" world")
    processKeyDown("leftAltClick")
    sleep 100
    processKeyDown("rightAltClick")
    sleep 100
    MouseMove destination.x, destination.y
    processKeyUp("leftAltClick")
    sleep 100
    processKeyUp("rightAltClick")
    sleep 100
    actual := getSelectedText()

    expected := "hello "
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}
