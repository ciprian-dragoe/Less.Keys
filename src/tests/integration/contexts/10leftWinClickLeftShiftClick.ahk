When_leftWinClick_is_pressed_and_leftShiftClick_is_pressed_left_click_is_not_sent_on_leftWinClick_release_#1001()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    processKeyDown("leftWinClick")
    sleep 100
    processKeyDown("leftShiftClick")
    sleep 100
    processKeyUp("leftWinClick")
    sleep 100
    processKeyUp("leftShiftClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_leftShiftClick_is_pressed_and_leftWinClick_is_pressed_click_is_not_sent_on_leftShiftClick_release_#1002()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    processKeyDown("leftShiftClick")
    sleep 100
    processKeyDown("leftWinClick")
    sleep 100
    processKeyUp("leftShiftClick")
    sleep 100
    processKeyUp("leftWinClick")
    sleep 300
    send {escape}
    sleep 500
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_leftWinClick_is_continuously_pressed_and_leftShiftClick_is_continuously_pressed_and_backtick_pressed_keyboard_shortcut_is_sent_#1003()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    processKeyDown("leftWinClick")
    sleep 100
    processKeyDown("leftShiftClick")
    sleep 100
    processKeyDown("``")
    sleep 100
    processKeyUp("leftWinClick")
    processKeyUp("leftShiftClick")
    processKeyUp("``")
    
    expected := "hello INTEGRATION_TEST"
    actual := clearText()
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftWinClick_is_continuously_pressed_and_leftShiftClick_is_continuously_pressed_and_backtick_pressed_click_is_not_sent_leftWinClick_release_#1004()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    processKeyDown("leftWinClick")
    sleep 100
    processKeyDown("leftShiftClick")
    sleep 100
    processKeyDown("``")
    sleep 100
    processKeyUp("``")
    processKeyUp("leftWinClick")
    processKeyUp("leftShiftClick")
    expected := getCurrentCaretPosition()
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_leftWinClick_is_continuously_pressed_and_leftShiftClick_is_continuously_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_leftShiftClick_release_#1005()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    processKeyDown("leftWinClick")
    sleep 100
    processKeyDown("leftShiftClick")
    sleep timeoutStillSendLayoutKey
    sleep 100
    processKeyUp("leftWinClick")
    sleep 100
    processKeyUp("leftShiftClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}
