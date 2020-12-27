When_leftCtrlClick_pressed_leftWinClick_pressed_THEN_left_click_is_not_sent_on_leftWinClick_release_#901()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    processKeyDown("leftCtrlClick")
    sleep 100
    processKeyDown("leftWinClick")
    sleep 100
    processKeyUp("leftWinClick")
    sleep 300
    processKeyUp("leftCtrlClick")
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
    processKeyDown("leftWinClick")
    sleep 100
    processKeyDown("leftCtrlClick")
    sleep 100
    processKeyUp("leftCtrlClick")
    sleep 300
    processKeyUp("leftWinClick")
    sleep 300
    send {escape}
    sleep 500

    validateCaretOutput(A_ThisFunc, expected)
}

When_leftWinClick_is_continuously_pressed_and_leftCtrlClick_is_continuously_pressed_and_backtick_pressed_keyboard_shortcut_is_sent_#903()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    processKeyDown("leftWinClick")
    sleep 100
    processKeyDown("leftCtrlClick")
    sleep 100
    processKeyDown("``")
    sleep 100
    actual := getSelectedText()
    processKeyUp("leftWinClick")
    processKeyUp("leftCtrlClick")
    processKeyUp("``")
    
    expected := "hello INTEGRATION_TEST"
    actual := clearText()
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftWinClick_is_continuously_pressed_and_leftCtrlClick_is_continuously_pressed_and_backtick_pressed_click_is_not_sent_leftWinClick_release#904()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    processKeyDown("leftWinClick")
    sleep 100
    processKeyDown("leftCtrlClick")
    sleep 100
    processKeyDown("``")
    sleep 100
    processKeyUp("``")
    processKeyUp("leftWinClick")
    processKeyUp("leftCtrlClick")
    expected := getCurrentCaretPosition()
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_leftWinClick_is_continuously_pressed_and_leftCtrlClick_is_continuously_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_leftCtrlClick_release_#905()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    processKeyDown("leftWinClick")
    sleep 100
    processKeyDown("leftCtrlClick")
    sleep timeoutStillSendLayoutKey
    sleep 100
    processKeyUp("leftWinClick")
    sleep 100
    processKeyUp("leftCtrlClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}
