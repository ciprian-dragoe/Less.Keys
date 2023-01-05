When_leftShiftClick_is_pressed_and_leftCtrlClick_is_pressed_left_click_is_not_sent_on_leftShiftClick_release_#501()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    simulateKeyDown("leftShiftClick")
    sleep 100
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyUp("leftShiftClick")
    sleep 100
    simulateKeyUp("leftCtrlClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_leftCtrlClick_is_pressed_and_leftShiftClick_is_pressed_click_is_not_sent_on_leftCtrlClick_release_#502()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyDown("leftShiftClick")
    sleep 100
    simulateKeyUp("leftCtrlClick")
    sleep 100
    simulateKeyUp("leftShiftClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_leftShiftClick_is_continuously_pressed_and_leftCtrlClick_is_continuously_pressed_and_layout_key_continuously_pressed_and_key_remapped_as_left_key_a_word_is_selected_#503()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    simulateKeyDown("leftShiftClick")
    sleep 100
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyDown("space")
    sleep 100
    simulateTyping("a")
    simulateKeyUp("leftShiftClick")
    simulateKeyUp("leftCtrlClick")
    simulateKeyUp("space")
    actual := getSelectedText()
    
    expected := "hello "
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftShiftClick_is_continuously_pressed_and_leftCtrlClick_is_continuously_pressed_and_layout_key_continuously_pressed_and_key_remapped_as_left_key_left_click_is_not_sent_on_leftShiftClick_release_#504()
{
    expected := getCurrentCaretPosition()
    simulateTyping("hello ")
    setMousePositionToCaret()
    simulateKeyDown("leftShiftClick")
    sleep 100
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyDown("space")
    sleep 100
    simulateTyping("a")
    simulateKeyUp("leftShiftClick")
    simulateKeyUp("leftCtrlClick")
    simulateKeyUp("space")
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_leftShiftClick_is_continuously_pressed_and_leftCtrlClick_is_continuously_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_leftCtrlClick_release_#505()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    simulateKeyDown("leftShiftClick")
    sleep 100
    simulateKeyDown("leftCtrlClick")
    sleep timeoutStillSendLayoutKey
    sleep 100
    simulateKeyUp("leftShiftClick")
    sleep 100
    simulateKeyUp("leftCtrlClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}
