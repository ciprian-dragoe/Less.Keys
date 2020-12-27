When_leftAltClick_is_pressed_and_leftShiftClick_is_pressed_left_click_is_not_sent_on_leftAltClick_release_#1301()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    processKeyDown("leftAltClick")
    sleep 100
    processKeyDown("leftShiftClick")
    sleep 100
    processKeyUp("leftAltClick")
    sleep 100
    processKeyUp("leftShiftClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_leftShiftClick_is_pressed_and_leftAltClick_is_pressed_click_is_not_sent_on_leftShiftClick_release_#1302()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    processKeyDown("leftShiftClick")
    sleep 100
    processKeyDown("leftAltClick")
    sleep 100
    processKeyUp("leftShiftClick")
    sleep 100
    processKeyUp("leftAltClick")
    sleep 300
    send {escape}
    sleep 300

    validateCaretOutput(A_ThisFunc, expected)
}

When_leftAltClick_is_continuously_pressed_and_leftShiftClick_is_continuously_pressed_and_backtick_pressed_keyboard_shortcut_is_sent_#1303()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    processKeyDown("leftAltClick")
    sleep 100
    processKeyDown("leftShiftClick")
    sleep 100
    processKeyDown("``")
    sleep 100
    processKeyUp("leftAltClick")
    processKeyUp("leftShiftClick")
    processKeyUp("``")
    
    expected := "hello INTEGRATION_TEST"
    actual := clearText()
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftAltClick_is_continuously_pressed_and_leftShiftClick_is_continuously_pressed_and_backtick_pressed_click_is_not_sent_leftAltClick_release_#1304()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    processKeyDown("leftAltClick")
    sleep 100
    processKeyDown("leftShiftClick")
    sleep 100
    processKeyDown("``")
    sleep 100
    processKeyUp("``")
    processKeyUp("leftAltClick")
    processKeyUp("leftShiftClick")
    expected := getCurrentCaretPosition()
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_leftAltClick_is_continuously_pressed_and_leftShiftClick_is_continuously_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_leftShiftClick_release_#1305()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    processKeyDown("leftAltClick")
    sleep 100
    processKeyDown("leftShiftClick")
    sleep timeoutStillSendLayoutKey
    sleep 100
    processKeyUp("leftAltClick")
    sleep 100
    processKeyUp("leftShiftClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}
