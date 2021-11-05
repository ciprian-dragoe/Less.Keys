When_leftCtrlClick_pressed_leftWinClick_pressed_THEN_left_click_is_not_sent_on_leftWinClick_release_#901()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyDown("leftWinClick")
    sleep 100
    simulateKeyUp("leftWinClick")
    sleep 300
    simulateKeyUp("leftCtrlClick")
    sleep 300
    send {escape}
    sleep 500

    validateCaretOutput(A_ThisFunc, expected)
}

When_leftWinClick_pressed_leftCtrlClick_pressed_THEN_left_click_is_not_sent_on_leftCtrlClick_release_#902()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    simulateKeyDown("leftWinClick")
    sleep 100
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyUp("leftCtrlClick")
    sleep 300
    simulateKeyUp("leftWinClick")
    sleep 300
    send {escape}
    sleep 500

    validateCaretOutput(A_ThisFunc, expected)
}

When_leftWinClick_is_continuously_pressed_and_leftCtrlClick_is_continuously_pressed_and_backtick_pressed_keyboard_shortcut_is_sent_#903()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    simulateKeyDown("leftWinClick")
    sleep 100
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyDown("``")
    sleep 100
    actual := getSelectedText()
    simulateKeyUp("leftWinClick")
    simulateKeyUp("leftCtrlClick")
    simulateKeyUp("``")
    
    expected := "hello INTEGRATION_TEST"
    actual := clearText()
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftWinClick_is_continuously_pressed_and_leftCtrlClick_is_continuously_pressed_and_backtick_pressed_click_is_not_sent_leftWinClick_release#904()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    simulateKeyDown("leftWinClick")
    sleep 100
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyDown("``")
    sleep 100
    simulateKeyUp("``")
    simulateKeyUp("leftWinClick")
    simulateKeyUp("leftCtrlClick")
    expected := getCurrentCaretPosition()
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_leftWinClick_is_continuously_pressed_and_leftCtrlClick_is_continuously_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_leftCtrlClick_release_#905()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    simulateKeyDown("leftWinClick")
    sleep 100
    simulateKeyDown("leftCtrlClick")
    sleep timeoutStillSendLayoutKey
    sleep 100
    simulateKeyUp("leftWinClick")
    sleep 100
    simulateKeyUp("leftCtrlClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}
