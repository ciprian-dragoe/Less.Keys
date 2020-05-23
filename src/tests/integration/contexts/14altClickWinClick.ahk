When_altClick_is_pressed_and_winClick_is_pressed_left_click_is_not_sent_on_altClick_release_#1401()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    processKeyDown("altClick")
    sleep 100
    processKeyDown("winClick")
    sleep 100
    processKeyUp("altClick")
    sleep 100
    processKeyUp("winClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_altClick_is_continuously_pressed_and_winClick_is_continuously_pressed_and_layout_key_continuously_pressed_and_key_remapped_as_caret_keyboard_shortcut_is_sent_#1402()
{
    simulateTyping("hello ")
    processKeyDown("altClick")
    sleep 100
    processKeyDown("winClick")
    sleep 100
    processKeyDown("space")
    sleep 100
    processKeyDown("``")
    processKeyUp("``")
    processKeyUp("altClick")
    processKeyUp("winClick")
    processKeyUp("space")

    expected := "hello INTEGRATION_TEST"
    actual := clearText()
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment()
}

When_altClick_pressed_and_winClick_pressed_and_layout_key_continuously_pressed_and_key_remapped_as_caret_pressed_left_click_is_not_sent_on_altClick_release_#1403()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    processKeyDown("altClick")
    sleep 100
    processKeyDown("winClick")
    sleep 100
    processKeyDown("space")
    sleep 100
    processKeyDown("``")
    processKeyUp("``")
    expected := getCurrentCaretPosition()
    processKeyUp("altClick")
    processKeyUp("winClick")
    processKeyUp("space")
    
    validateCaretOutput(A_ThisFunc, expected)
}
