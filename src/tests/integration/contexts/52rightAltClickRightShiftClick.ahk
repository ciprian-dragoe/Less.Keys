When_rightAltClick_is_pressed_and_rightShiftClick_is_pressed_left_click_is_not_sent_on_rightAltClick_release_#5201()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    processKeyDown("rightAltClick")
    sleep 100
    processKeyDown("rightShiftClick")
    sleep 100
    processKeyUp("rightAltClick")
    sleep 100
    processKeyUp("rightShiftClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_rightShiftClick_is_pressed_and_rightAltClick_is_pressed_click_is_not_sent_on_rightShiftClick_release_#5202()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    processKeyDown("rightShiftClick")
    sleep 100
    processKeyDown("rightAltClick")
    sleep 100
    processKeyUp("rightShiftClick")
    sleep 100
    processKeyUp("rightAltClick")
    sleep 300
    send {escape}
    sleep 300

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightAltClick_is_continuously_pressed_and_rightShiftClick_is_continuously_pressed_and_backtick_pressed_keyboard_shortcut_is_sent_#5203()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    processKeyDown("rightAltClick")
    sleep 100
    processKeyDown("rightShiftClick")
    sleep 100
    processKeyDown("``")
    sleep 100
    processKeyUp("rightAltClick")
    processKeyUp("rightShiftClick")
    processKeyUp("``")
    
    expected := "hello INTEGRATION_TEST"
    actual := clearText()
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightAltClick_is_continuously_pressed_and_rightShiftClick_is_continuously_pressed_and_backtick_pressed_click_is_not_sent_rightAltClick_release_#5204()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    processKeyDown("rightAltClick")
    sleep 100
    processKeyDown("rightShiftClick")
    sleep 100
    processKeyDown("``")
    sleep 100
    processKeyUp("``")
    processKeyUp("rightAltClick")
    processKeyUp("rightShiftClick")
    expected := getCurrentCaretPosition()
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_rightAltClick_is_continuously_pressed_and_rightShiftClick_is_continuously_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_rightShiftClick_release_#5205()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    processKeyDown("rightAltClick")
    sleep 100
    processKeyDown("rightShiftClick")
    sleep timeoutStillSendLayoutKey
    sleep 100
    processKeyUp("rightAltClick")
    sleep 100
    processKeyUp("rightShiftClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}
