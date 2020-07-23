When_winClick_is_pressed_and_ctrlClick_is_pressed_left_click_is_sent_on_winClick_release_#901()
{
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("hello ")
    processKeyDown("winClick")
    sleep 100
    processKeyDown("ctrlClick")
    sleep 100
    processKeyUp("winClick")
    sleep 100
    processKeyUp("ctrlClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_ctrlClick_is_pressed_and_winClick_is_pressed_click_is_sent_on_ctrlClick_release_#902()
{
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("hello ")
    processKeyDown("ctrlClick")
    sleep 100
    processKeyDown("winClick")
    sleep 100
    processKeyUp("ctrlClick")
    sleep 100
    processKeyUp("winClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_winClick_is_continously_pressed_and_ctrlClick_is_continously_pressed_and_backtick_pressed_keyboard_shortcut_is_sent#903()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    processKeyDown("winClick")
    sleep 100
    processKeyDown("ctrlClick")
    sleep 100
    processKeyDown("``")
    sleep 100
    actual := getSelectedText()
    processKeyUp("winClick")
    processKeyUp("ctrlClick")
    processKeyUp("``")
    
    expected := "hello INTEGRATION_TEST"
    actual := clearText()
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment()
}

When_winClick_is_continously_pressed_and_ctrlClick_is_continously_pressed_and_backtick_pressed_click_is_not_sent_winClick_release#904()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    processKeyDown("winClick")
    sleep 100
    processKeyDown("ctrlClick")
    sleep 100
    processKeyDown("``")
    sleep 100
    processKeyUp("``")
    processKeyUp("winClick")
    processKeyUp("ctrlClick")
    expected := getCurrentCaretPosition()
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_winClick_is_continously_pressed_and_ctrlClick_is_continously_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_ctrlClick_release_#905()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    processKeyDown("winClick")
    sleep 100
    processKeyDown("ctrlClick")
    sleep timeoutStillSendLayoutKey
    sleep 100
    processKeyUp("winClick")
    sleep 100
    processKeyUp("ctrlClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_winClick_is_pressed_and_ctrlClick_is_pressed_and_released_left_click_is_sent_on_winClick_release_#906()
{
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("hello ")
    processKeyDown("winClick")
    sleep 100
    processKeyDown("ctrlClick")
    sleep 100
    processKeyUp("ctrlClick")
    sleep 100
    processKeyUp("winClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_ctrlClick_is_pressed_and_winClick_is_pressed_and_released_left_click_is_sent_on_ctrlClick_release_#907()
{
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("hello ")
    processKeyDown("ctrlClick")
    sleep 100
    processKeyDown("winClick")
    sleep 100
    processKeyUp("winClick")
    sleep 300
    processKeyDown("winClick")
    sleep 100
    processKeyUp("winClick")
    sleep 300
    processKeyUp("ctrlClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}