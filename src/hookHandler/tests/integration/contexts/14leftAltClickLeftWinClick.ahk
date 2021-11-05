When_leftAltClick_is_pressed_and_leftCtrlClick_is_pressed_left_click_is_not_sent_on_leftAltClick_release_#1401()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    simulateKeyDown("leftAltClick")
    sleep 100
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyUp("leftAltClick")
    sleep 100
    simulateKeyUp("leftCtrlClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_leftCtrlClick_is_pressed_and_leftAltClick_is_pressed_click_is_not_sent_on_leftCtrlClick_release_#1402()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyDown("leftAltClick")
    sleep 100
    simulateKeyUp("leftCtrlClick")
    sleep 100
    simulateKeyUp("leftAltClick")
    sleep 300
    send {escape}
    sleep 300

    validateCaretOutput(A_ThisFunc, expected)
}

When_leftAltClick_is_continuously_pressed_and_leftCtrlClick_is_continuously_pressed_and_backtick_pressed_keyboard_shortcut_is_sent_#1403()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    simulateKeyDown("leftAltClick")
    sleep 100
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyDown("``")
    sleep 100
    simulateKeyUp("leftAltClick")
    simulateKeyUp("leftCtrlClick")
    simulateKeyUp("``")
    
    expected := "hello INTEGRATION_TEST"
    actual := clearText()
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftAltClick_is_continuously_pressed_and_leftCtrlClick_is_continuously_pressed_and_backtick_pressed_click_is_not_sent_leftAltClick_release_#1404()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    simulateKeyDown("leftAltClick")
    sleep 100
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyDown("``")
    sleep 100
    simulateKeyUp("``")
    simulateKeyUp("leftAltClick")
    simulateKeyUp("leftCtrlClick")
    expected := getCurrentCaretPosition()
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_leftAltClick_is_continuously_pressed_and_leftCtrlClick_is_continuously_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_leftCtrlClick_release_#1405()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    simulateKeyDown("leftAltClick")
    sleep 100
    simulateKeyDown("leftCtrlClick")
    sleep timeoutStillSendLayoutKey
    sleep 100
    simulateKeyUp("leftAltClick")
    sleep 100
    simulateKeyUp("leftCtrlClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}
