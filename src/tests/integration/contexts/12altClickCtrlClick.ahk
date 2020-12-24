When_altClick_is_pressed_and_ctrlClick_is_pressed_left_click_is_sent_on_altClick_release_#1201()
{
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("hello ")
    processKeyDown("altClick")
    sleep 100
    processKeyDown("ctrlClick")
    sleep 100
    processKeyUp("altClick")
    sleep 100
    processKeyUp("ctrlClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_ctrlClick_is_pressed_and_altClick_is_pressed_click_is_sent_on_ctrlClick_release_#1202()
{
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("hello ")
    processKeyDown("ctrlClick")
    sleep 100
    processKeyDown("altClick")
    sleep 100
    processKeyUp("ctrlClick")
    sleep 100
    processKeyUp("altClick")
    sleep 300
    send {escape}
    sleep 300

    validateCaretOutput(A_ThisFunc, expected)
}

When_altClick_is_continously_pressed_and_ctrlClick_is_continously_pressed_and_backtick_pressed_keyboard_shortcut_is_sent#1203()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    processKeyDown("altClick")
    sleep 100
    processKeyDown("ctrlClick")
    sleep 100
    processKeyDown("``")
    sleep 100
    processKeyUp("altClick")
    processKeyUp("ctrlClick")
    processKeyUp("``")
    
    expected := "hello INTEGRATION_TEST"
    actual := clearText()
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_altClick_is_continously_pressed_and_ctrlClick_is_continously_pressed_and_backtick_pressed_click_is_not_sent_altClick_release#1204()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    processKeyDown("altClick")
    sleep 100
    processKeyDown("ctrlClick")
    sleep 100
    processKeyDown("``")
    sleep 100
    processKeyUp("``")
    processKeyUp("altClick")
    processKeyUp("ctrlClick")
    expected := getCurrentCaretPosition()
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_altClick_is_continously_pressed_and_ctrlClick_is_continously_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_ctrlClick_release_#1205()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    processKeyDown("altClick")
    sleep 100
    processKeyDown("ctrlClick")
    sleep timeoutStillSendLayoutKey
    sleep 100
    processKeyUp("altClick")
    sleep 100
    processKeyUp("ctrlClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_altClick_is_pressed_and_ctrlClick_is_pressed_and_released_left_click_is_sent_on_altClick_release_#1206()
{
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("hello ")
    processKeyDown("altClick")
    sleep 100
    processKeyDown("ctrlClick")
    sleep 100
    processKeyUp("ctrlClick")
    sleep 100
    processKeyUp("altClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_ctrlClick_is_pressed_and_altClick_is_pressed_and_released_left_click_is_sent_on_ctrlClick_release_#1207()
{
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("hello ")
    processKeyDown("ctrlClick")
    sleep 100
    processKeyDown("altClick")
    sleep 100
    processKeyUp("altClick")
    sleep 300
    processKeyDown("altClick")
    sleep 100
    processKeyUp("altClick")
    sleep 300
    processKeyUp("ctrlClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}