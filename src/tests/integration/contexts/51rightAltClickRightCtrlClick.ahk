When_rightAltClick_is_pressed_and_rightCtrlClick_is_pressed_left_click_is_not_sent_on_rightAltClick_release_#5101()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    processKeyDown("rightAltClick")
    sleep 100
    processKeyDown("rightCtrlClick")
    sleep 100
    processKeyUp("rightAltClick")
    sleep 100
    processKeyUp("rightCtrlClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_rightCtrlClick_is_pressed_and_rightAltClick_is_pressed_click_is_not_sent_on_rightCtrlClick_release_#5102()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    processKeyDown("rightCtrlClick")
    sleep 100
    processKeyDown("rightAltClick")
    sleep 100
    processKeyUp("rightCtrlClick")
    sleep 100
    processKeyUp("rightAltClick")
    sleep 300
    send {escape}
    sleep 300

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightAltClick_is_continuously_pressed_and_rightCtrlClick_is_continuously_pressed_and_backtick_pressed_keyboard_shortcut_is_sent_#5103()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    processKeyDown("rightAltClick")
    sleep 100
    processKeyDown("rightCtrlClick")
    sleep 100
    processKeyDown("``")
    sleep 100
    processKeyUp("rightAltClick")
    processKeyUp("rightCtrlClick")
    processKeyUp("``")
    
    expected := "hello INTEGRATION_TEST"
    actual := clearText()
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightAltClick_is_continuously_pressed_and_rightCtrlClick_is_continuously_pressed_and_backtick_pressed_click_is_not_sent_rightAltClick_release_#5104()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    processKeyDown("rightAltClick")
    sleep 100
    processKeyDown("rightCtrlClick")
    sleep 100
    processKeyDown("``")
    sleep 100
    processKeyUp("``")
    processKeyUp("rightAltClick")
    processKeyUp("rightCtrlClick")
    expected := getCurrentCaretPosition()
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_rightAltClick_is_continuously_pressed_and_rightCtrlClick_is_continuously_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_rightCtrlClick_release_#5105()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    processKeyDown("rightAltClick")
    sleep 100
    processKeyDown("rightCtrlClick")
    sleep timeoutStillSendLayoutKey
    sleep 100
    processKeyUp("rightAltClick")
    sleep 100
    processKeyUp("rightCtrlClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}
