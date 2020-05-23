When_winClick_is_pressed_and_ctrlClick_is_pressed_left_click_is_not_sent_on_winClick_release_#901()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    processKeyDown("winClick")
    sleep 100
    processKeyDown("ctrlClick")
    sleep 100
    processKeyUp("winClick")
    sleep 100
    processKeyUp("ctrlClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_ctrlClick_is_pressed_and_winClick_is_pressed_left_click_is_not_sent_on_ctrlClick_release_#902()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    processKeyDown("ctrlClick")
    sleep 100
    processKeyDown("winClick")
    sleep 100
    processKeyUp("ctrlClick")
    sleep 100
    processKeyUp("winClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_winClick_is_continuously_pressed_and_ctrlClick_is_continuously_pressed_and_layout_key_continuously_pressed_and_key_remapped_as_caret_keyboard_shortcut_is_sent_#903()
{
    simulateTyping("hello ")
    processKeyDown("winClick")
    sleep 100
    processKeyDown("ctrlClick")
    sleep 100
    processKeyDown("space")
    sleep 100
    processKeyDown("``")
    processKeyUp("``")
    processKeyUp("winClick")
    processKeyUp("ctrlClick")
    processKeyUp("space")

    expected := "hello INTEGRATION_TEST"
    actual := clearText()
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment()
}

When_winClick_pressed_and_ctrlClick_pressed_and_layout_key_continuously_pressed_and_key_remapped_as_caret_pressed_left_click_is_not_sent_on_winClick_release_#904()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    processKeyDown("winClick")
    sleep 100
    processKeyDown("ctrlClick")
    sleep 100
    processKeyDown("space")
    sleep 100
    processKeyDown("``")
    processKeyUp("``")
    expected := getCurrentCaretPosition()
    processKeyUp("winClick")
    processKeyUp("ctrlClick")
    processKeyUp("space")
    
    validateCaretOutput(A_ThisFunc, expected)
}
