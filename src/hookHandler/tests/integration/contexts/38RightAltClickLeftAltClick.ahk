When_rightAltClick_pressed_leftAltClick_pressed_mouse_moved_until_second_word_THEN_only_first_word_is_selected_#3802()
{
    setMousePositionToCaret()
    simulateTyping("hello")
    destination := getCurrentCaretPosition()
    simulateTyping(" world")
    simulateKeyDown("rightAltClick")
    sleep 100
    simulateKeyDown("leftAltClick")
    sleep 100
    MouseMove destination.x, destination.y
    simulateKeyUp("rightAltClick")
    sleep 100
    simulateKeyUp("leftAltClick")
    sleep 100
    actual := getSelectedText()

    expected := "hello"
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}
