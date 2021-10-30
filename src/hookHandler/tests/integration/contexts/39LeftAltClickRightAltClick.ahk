When_leftAltClick_pressed_rightAltClick_pressed_mouse_moved_until_second_word_THEN_only_first_word_is_selected_#3902()
{
    setMousePositionToCaret()
    simulateTyping("hello")
    destination := getCurrentCaretPosition()
    simulateTyping(" world")
    simulateKeyDown("leftAltClick")
    sleep 100
    simulateKeyDown("rightAltClick")
    sleep 100
    MouseMove destination.x, destination.y
    simulateKeyUp("leftAltClick")
    sleep 100
    simulateKeyUp("rightAltClick")
    sleep 100
    actual := getSelectedText()

    expected := "hello "
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}
