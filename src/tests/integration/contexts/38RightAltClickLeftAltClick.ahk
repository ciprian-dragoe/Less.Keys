When_rightAltClick_pressed_leftAltClick_pressed_THEN_w_is_sent_at_the_beginning_#3801()
{
    timerTimeoutStickyKeys := 9000
    setMousePositionToCaret()
    simulateTyping("hello ")
    processKeyDown("rightAltClick")
    sleep 100
    processKeyDown("leftAltClick")
    sleep 100
    processKeyUp("rightAltClick")
    sleep 100
    processKeyUp("leftAltClick")
    sleep 100
    simulateTyping("w")
    actual := clearText()

    expected := "whello "
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightAltClick_pressed_leftAltClick_pressed_mouse_moved_until_second_word_THEN_only_first_word_is_selected_#3802()
{
    setMousePositionToCaret()
    simulateTyping("hello")
    destination := getCurrentCaretPosition()
    simulateTyping(" world")
    processKeyDown("rightAltClick")
    sleep 100
    processKeyDown("leftAltClick")
    sleep 100
    MouseMove destination.x, destination.y
    processKeyUp("rightAltClick")
    sleep 100
    processKeyUp("leftAltClick")
    sleep 100
    actual := getSelectedText()

    expected := "hello "
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}
