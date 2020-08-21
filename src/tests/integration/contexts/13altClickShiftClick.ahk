When_altClick_is_pressed_and_shiftClick_is_pressed_left_click_is_sent_on_altClick_release_#1301()
{
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("hello ")
    processKeyDown("altClick")
    sleep 100
    processKeyDown("shiftClick")
    sleep 100
    processKeyUp("altClick")
    sleep 100
    processKeyUp("shiftClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_shiftClick_is_pressed_and_altClick_is_pressed_click_is_sent_on_shiftClick_release_#1302()
{
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("hello ")
    processKeyDown("shiftClick")
    sleep 100
    processKeyDown("altClick")
    sleep 100
    processKeyUp("shiftClick")
    sleep 100
    processKeyUp("altClick")
    sleep 300
    send {escape}
    sleep 300

    validateCaretOutput(A_ThisFunc, expected)
}

When_altClick_is_continously_pressed_and_shiftClick_is_continously_pressed_and_backtick_pressed_keyboard_shortcut_is_sent_#1303()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    processKeyDown("altClick")
    sleep 100
    processKeyDown("shiftClick")
    sleep 100
    processKeyDown("``")
    sleep 100
    processKeyUp("altClick")
    processKeyUp("shiftClick")
    processKeyUp("``")
    
    expected := "hello INTEGRATION_TEST"
    actual := clearText()
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment()
}

When_altClick_is_continously_pressed_and_shiftClick_is_continously_pressed_and_backtick_pressed_click_is_not_sent_altClick_release_#1304()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    processKeyDown("altClick")
    sleep 100
    processKeyDown("shiftClick")
    sleep 100
    processKeyDown("``")
    sleep 100
    processKeyUp("``")
    processKeyUp("altClick")
    processKeyUp("shiftClick")
    expected := getCurrentCaretPosition()
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_altClick_is_continously_pressed_and_shiftClick_is_continously_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_shiftClick_release_#1305()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    processKeyDown("altClick")
    sleep 100
    processKeyDown("shiftClick")
    sleep timeoutStillSendLayoutKey
    sleep 100
    processKeyUp("altClick")
    sleep 100
    processKeyUp("shiftClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_altClick_is_pressed_and_shiftClick_is_pressed_and_released_left_click_is_sent_on_altClick_release_#1306()
{
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("hello ")
    processKeyDown("altClick")
    sleep 100
    processKeyDown("shiftClick")
    sleep 100
    processKeyUp("shiftClick")
    sleep 100
    processKeyUp("altClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_shiftClick_is_pressed_and_altClick_is_pressed_and_released_left_click_is_sent_on_shiftClick_release_#1307()
{
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("hello ")
    processKeyDown("shiftClick")
    sleep 100
    processKeyDown("altClick")
    sleep 100
    processKeyUp("altClick")
    sleep 300
    processKeyDown("altClick")
    sleep 100
    processKeyUp("altClick")
    sleep 300
    processKeyUp("shiftClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}