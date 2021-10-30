When_rightAltClick_is_pressed_and_rightCtrlClick_is_pressed_left_click_is_not_sent_on_rightAltClick_release_#5101()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    simulateKeyDown("rightAltClick")
    sleep 100
    simulateKeyDown("rightCtrlClick")
    sleep 100
    simulateKeyUp("rightAltClick")
    sleep 100
    simulateKeyUp("rightCtrlClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_rightCtrlClick_is_pressed_and_rightAltClick_is_pressed_click_is_not_sent_on_rightCtrlClick_release_#5102()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    simulateKeyDown("rightCtrlClick")
    sleep 100
    simulateKeyDown("rightAltClick")
    sleep 100
    simulateKeyUp("rightCtrlClick")
    sleep 100
    simulateKeyUp("rightAltClick")
    sleep 300
    send {escape}
    sleep 300

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightAltClick_is_continuously_pressed_and_rightCtrlClick_is_continuously_pressed_and_backtick_pressed_keyboard_shortcut_is_sent_#5103()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    simulateKeyDown("rightAltClick")
    sleep 100
    simulateKeyDown("rightCtrlClick")
    sleep 100
    simulateKeyDown("``")
    sleep 100
    simulateKeyUp("rightAltClick")
    simulateKeyUp("rightCtrlClick")
    simulateKeyUp("``")
    
    expected := "hello INTEGRATION_TEST"
    actual := clearText()
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightAltClick_is_continuously_pressed_and_rightCtrlClick_is_continuously_pressed_and_backtick_pressed_click_is_not_sent_rightAltClick_release_#5104()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    simulateKeyDown("rightAltClick")
    sleep 100
    simulateKeyDown("rightCtrlClick")
    sleep 100
    simulateKeyDown("``")
    sleep 100
    simulateKeyUp("``")
    simulateKeyUp("rightAltClick")
    simulateKeyUp("rightCtrlClick")
    expected := getCurrentCaretPosition()
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_rightAltClick_is_continuously_pressed_and_rightCtrlClick_is_continuously_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_rightCtrlClick_release_#5105()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    simulateKeyDown("rightAltClick")
    sleep 100
    simulateKeyDown("rightCtrlClick")
    sleep timeoutStillSendLayoutKey
    sleep 100
    simulateKeyUp("rightAltClick")
    sleep 100
    simulateKeyUp("rightCtrlClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}
