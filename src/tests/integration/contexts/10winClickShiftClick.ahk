When_winClick_is_pressed_and_shiftClick_is_pressed_left_click_is_not_sent_on_winClick_release_#1001()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    processKeyDown("winClick")
    sleep 100
    processKeyDown("shiftClick")
    sleep 100
    processKeyUp("winClick")
    sleep 100
    processKeyUp("shiftClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_shiftClick_is_pressed_and_winClick_is_pressed_left_click_is_not_sent_on_shiftClick_release_#1002()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    processKeyDown("shiftClick")
    sleep 100
    processKeyDown("winClick")
    sleep 100
    processKeyUp("shiftClick")
    sleep 100
    processKeyUp("winClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_winClick_is_continuously_pressed_and_shiftClick_is_continuously_pressed_and_layout_key_continuously_pressed_and_key_remapped_as_caret_keyboard_shortcut_is_sent_#1003()
{
    simulateTyping("hello ")
    processKeyDown("winClick")
    sleep 100
    processKeyDown("shiftClick")
    sleep 100
    processKeyDown("space")
    sleep 100
    processKeyDown("``")
    processKeyUp("``")
    processKeyUp("winClick")
    processKeyUp("shiftClick")
    processKeyUp("space")

    expected := "hello INTEGRATION_TEST"
    actual := clearText()
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment()
}

When_winClick_pressed_and_shiftClick_pressed_and_layout_key_continuously_pressed_and_key_remapped_as_caret_pressed_left_click_is_not_sent_on_winClick_release_#1004()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    processKeyDown("winClick")
    sleep 100
    processKeyDown("shiftClick")
    sleep 100
    processKeyDown("space")
    sleep 100
    processKeyDown("``")
    processKeyUp("``")
    expected := getCurrentCaretPosition()
    processKeyUp("winClick")
    processKeyUp("shiftClick")
    processKeyUp("space")
    
    validateCaretOutput(A_ThisFunc, expected)
}
