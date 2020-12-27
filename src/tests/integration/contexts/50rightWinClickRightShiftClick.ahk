When_rightWinClick_is_pressed_and_rightShiftClick_is_pressed_left_click_is_not_sent_on_rightWinClick_release_#5001()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    processKeyDown("rightWinClick")
    sleep 100
    processKeyDown("rightShiftClick")
    sleep 100
    processKeyUp("rightWinClick")
    sleep 100
    processKeyUp("rightShiftClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_rightShiftClick_is_pressed_and_rightWinClick_is_pressed_click_is_not_sent_on_rightShiftClick_release_#5002()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    processKeyDown("rightShiftClick")
    sleep 100
    processKeyDown("rightWinClick")
    sleep 100
    processKeyUp("rightShiftClick")
    sleep 100
    processKeyUp("rightWinClick")
    sleep 300
    send {escape}
    sleep 500
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_rightWinClick_is_continuously_pressed_and_rightShiftClick_is_continuously_pressed_and_backtick_pressed_keyboard_shortcut_is_sent_#5003()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    processKeyDown("rightWinClick")
    sleep 100
    processKeyDown("rightShiftClick")
    sleep 100
    processKeyDown("``")
    sleep 100
    processKeyUp("rightWinClick")
    processKeyUp("rightShiftClick")
    processKeyUp("``")
    
    expected := "hello INTEGRATION_TEST"
    actual := clearText()
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightWinClick_is_continuously_pressed_and_rightShiftClick_is_continuously_pressed_and_backtick_pressed_click_is_not_sent_rightWinClick_release_#5004()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    processKeyDown("rightWinClick")
    sleep 100
    processKeyDown("rightShiftClick")
    sleep 100
    processKeyDown("``")
    sleep 100
    processKeyUp("``")
    processKeyUp("rightWinClick")
    processKeyUp("rightShiftClick")
    expected := getCurrentCaretPosition()
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_rightWinClick_is_continuously_pressed_and_rightShiftClick_is_continuously_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_rightShiftClick_release_#5005()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    processKeyDown("rightWinClick")
    sleep 100
    processKeyDown("rightShiftClick")
    sleep timeoutStillSendLayoutKey
    sleep 100
    processKeyUp("rightWinClick")
    sleep 100
    processKeyUp("rightShiftClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}
