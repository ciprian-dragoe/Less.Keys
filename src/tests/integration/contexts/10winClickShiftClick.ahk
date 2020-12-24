When_winClick_is_pressed_and_shiftClick_is_pressed_left_click_is_sent_on_winClick_release_#1001()
{
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("hello ")
    processKeyDown("winClick")
    sleep 100
    processKeyDown("shiftClick")
    sleep 100
    processKeyUp("winClick")
    sleep 100
    processKeyUp("shiftClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_shiftClick_is_pressed_and_winClick_is_pressed_click_is_sent_on_shiftClick_release_#1002()
{
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("hello ")
    processKeyDown("shiftClick")
    sleep 100
    processKeyDown("winClick")
    sleep 100
    processKeyUp("shiftClick")
    sleep 100
    processKeyUp("winClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_winClick_is_continously_pressed_and_shiftClick_is_continously_pressed_and_backtick_pressed_keyboard_shortcut_is_sent_#1003()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    processKeyDown("winClick")
    sleep 100
    processKeyDown("shiftClick")
    sleep 100
    processKeyDown("``")
    sleep 100
    processKeyUp("winClick")
    processKeyUp("shiftClick")
    processKeyUp("``")
    
    expected := "hello INTEGRATION_TEST"
    actual := clearText()
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_winClick_is_continously_pressed_and_shiftClick_is_continously_pressed_and_backtick_pressed_click_is_not_sent_winClick_release_#1004()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    processKeyDown("winClick")
    sleep 100
    processKeyDown("shiftClick")
    sleep 100
    processKeyDown("``")
    sleep 100
    processKeyUp("``")
    processKeyUp("winClick")
    processKeyUp("shiftClick")
    expected := getCurrentCaretPosition()
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_winClick_is_continously_pressed_and_shiftClick_is_continously_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_shiftClick_release_#1005()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    processKeyDown("winClick")
    sleep 100
    processKeyDown("shiftClick")
    sleep timeoutStillSendLayoutKey
    sleep 100
    processKeyUp("winClick")
    sleep 100
    processKeyUp("shiftClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_winClick_is_pressed_and_shiftClick_is_pressed_and_released_left_click_is_sent_on_winClick_release_#1006()
{
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("hello ")
    processKeyDown("winClick")
    sleep 100
    processKeyDown("shiftClick")
    sleep 100
    processKeyUp("shiftClick")
    sleep 100
    processKeyUp("winClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_shiftClick_is_pressed_and_winClick_is_pressed_and_released_left_click_is_sent_on_shiftClick_release_#1007()
{
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("hello ")
    processKeyDown("shiftClick")
    sleep 100
    processKeyDown("winClick")
    sleep 100
    processKeyUp("winClick")
    sleep 300
    processKeyDown("winClick")
    sleep 100
    processKeyUp("winClick")
    sleep 300
    processKeyUp("shiftClick")

    processKeyDown("lshift")
    sleep 100
    processKeyDown("lwin")
    sleep 100
    processKeyUp("lshift")
    sleep 100
    processKeyUp("lwin")
    sleep 100
    processKeyDown("lwin")
    sleep 100
    processKeyUp("lwin")
    sleep 100
    
    validateCaretOutput(A_ThisFunc, expected)
}