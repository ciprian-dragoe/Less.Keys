When_rightCtrlClick_pressed_rightWinClick_pressed_THEN_right_click_is_not_sent_on_rightWinClick_release_#4901()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    simulateKeyDown("rightCtrlClick")
    sleep 100
    simulateKeyDown("rightWinClick")
    sleep 100
    simulateKeyUp("rightWinClick")
    sleep 300
    simulateKeyUp("rightCtrlClick")
    sleep 300
    send {escape}
    sleep 500

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightWinClick_pressed_rightCtrlClick_pressed_THEN_right_click_is_not_sent_on_rightCtrlClick_release_#4902()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    simulateKeyDown("rightWinClick")
    sleep 100
    simulateKeyDown("rightCtrlClick")
    sleep 100
    simulateKeyUp("rightCtrlClick")
    sleep 300
    simulateKeyUp("rightWinClick")
    sleep 300
    send {escape}
    sleep 500

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightWinClick_is_continuously_pressed_and_rightCtrlClick_is_continuously_pressed_and_backtick_pressed_keyboard_shortcut_is_sent_#4903()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    simulateKeyDown("rightWinClick")
    sleep 100
    simulateKeyDown("rightCtrlClick")
    sleep 100
    simulateKeyDown("``")
    sleep 100
    actual := getSelectedText()
    simulateKeyUp("rightWinClick")
    simulateKeyUp("rightCtrlClick")
    simulateKeyUp("``")
    
    expected := "hello INTEGRATION_TEST"
    actual := clearText()
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightWinClick_is_continuously_pressed_and_rightCtrlClick_is_continuously_pressed_and_backtick_pressed_click_is_not_sent_rightWinClick_release_#4904()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    simulateKeyDown("rightWinClick")
    sleep 100
    simulateKeyDown("rightCtrlClick")
    sleep 100
    simulateKeyDown("``")
    sleep 100
    simulateKeyUp("``")
    simulateKeyUp("rightWinClick")
    simulateKeyUp("rightCtrlClick")
    expected := getCurrentCaretPosition()
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_rightWinClick_is_continuously_pressed_and_rightCtrlClick_is_continuously_pressed_more_then_timeoutStillSendLayoutKey_right_click_is_not_sent_on_rightCtrlClick_release_#4905()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    simulateKeyDown("rightWinClick")
    sleep 100
    simulateKeyDown("rightCtrlClick")
    sleep timeoutStillSendLayoutKey
    sleep 100
    simulateKeyUp("rightWinClick")
    sleep 100
    simulateKeyUp("rightCtrlClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}
