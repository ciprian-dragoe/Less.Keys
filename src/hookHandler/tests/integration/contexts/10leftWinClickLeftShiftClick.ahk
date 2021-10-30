When_leftWinClick_is_pressed_and_leftShiftClick_is_pressed_left_click_is_not_sent_on_leftWinClick_release_#1001()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    simulateKeyDown("leftWinClick")
    sleep 100
    simulateKeyDown("leftShiftClick")
    sleep 100
    simulateKeyUp("leftWinClick")
    sleep 100
    simulateKeyUp("leftShiftClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_leftShiftClick_is_pressed_and_leftWinClick_is_pressed_click_is_not_sent_on_leftShiftClick_release_#1002()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    simulateKeyDown("leftShiftClick")
    sleep 100
    simulateKeyDown("leftWinClick")
    sleep 100
    simulateKeyUp("leftShiftClick")
    sleep 100
    simulateKeyUp("leftWinClick")
    sleep 300
    send {escape}
    sleep 500
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_leftWinClick_is_continuously_pressed_and_leftShiftClick_is_continuously_pressed_and_backtick_pressed_keyboard_shortcut_is_sent_#1003()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    simulateKeyDown("leftWinClick")
    sleep 100
    simulateKeyDown("leftShiftClick")
    sleep 100
    simulateKeyDown("``")
    sleep 100
    simulateKeyUp("leftWinClick")
    simulateKeyUp("leftShiftClick")
    simulateKeyUp("``")
    
    expected := "hello INTEGRATION_TEST"
    actual := clearText()
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftWinClick_is_continuously_pressed_and_leftShiftClick_is_continuously_pressed_and_backtick_pressed_click_is_not_sent_leftWinClick_release_#1004()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    simulateKeyDown("leftWinClick")
    sleep 100
    simulateKeyDown("leftShiftClick")
    sleep 100
    simulateKeyDown("``")
    sleep 100
    simulateKeyUp("``")
    simulateKeyUp("leftWinClick")
    simulateKeyUp("leftShiftClick")
    expected := getCurrentCaretPosition()
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_leftWinClick_is_continuously_pressed_and_leftShiftClick_is_continuously_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_leftShiftClick_release_#1005()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    simulateKeyDown("leftWinClick")
    sleep 100
    simulateKeyDown("leftShiftClick")
    sleep timeoutStillSendLayoutKey
    sleep 100
    simulateKeyUp("leftWinClick")
    sleep 100
    simulateKeyUp("leftShiftClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}
