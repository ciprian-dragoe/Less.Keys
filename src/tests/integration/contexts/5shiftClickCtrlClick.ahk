When_shiftClick_is_pressed_and_ctrlClick_is_pressed_left_click_is_sent_on_shiftClick_release_#501()
{
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("hello ")
    processKeyDown("shiftClick")
    sleep 100
    processKeyDown("ctrlClick")
    sleep 100
    processKeyUp("shiftClick")
    sleep 100
    processKeyUp("ctrlClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_ctrlClick_is_pressed_and_shiftClick_is_pressed_click_is_sent_on_ctrlClick_release_#502()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    processKeyDown("ctrlClick")
    sleep 100
    processKeyDown("shiftClick")
    sleep 100
    processKeyUp("ctrlClick")
    sleep 100
    processKeyUp("shiftClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_shiftClick_is_continously_pressed_and_ctrlClick_is_continously_pressed_and_layout_key_continously_pressed_and_key_remapped_as_left_key_a_word_is_selected_#503()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    processKeyDown("shiftClick")
    sleep 100
    processKeyDown("ctrlClick")
    sleep 100
    processKeyDown("space")
    sleep 100
    simulateTyping("a")
    actual := getSelectedText()
    processKeyUp("shiftClick")
    processKeyUp("ctrlClick")
    processKeyUp("space")
    
    expected := "hello "
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment()
}

When_shiftClick_is_continously_pressed_and_ctrlClick_is_continously_pressed_and_layout_key_continously_pressed_and_key_remapped_as_left_key_left_click_is_not_sent_on_shiftClick_release_#504()
{
    expected := getCurrentCaretPosition()
    simulateTyping("hello ")
    setMousePositionToCaret()
    processKeyDown("shiftClick")
    sleep 100
    processKeyDown("ctrlClick")
    sleep 100
    processKeyDown("space")
    sleep 100
    simulateTyping("a")
    processKeyUp("shiftClick")
    processKeyUp("ctrlClick")
    processKeyUp("space")
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_shiftClick_is_continously_pressed_and_ctrlClick_is_continously_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_ctrlClick_release_#505()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    processKeyDown("shiftClick")
    sleep 100
    processKeyDown("ctrlClick")
    sleep 1000
    processKeyUp("shiftClick")
    sleep 100
    processKeyUp("ctrlClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_shiftClick_is_pressed_and_ctrlClick_is_pressed_and_released_left_click_is_sent_on_shiftClick_release_#506()
{
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("hello ")
    processKeyDown("shiftClick")
    sleep 100
    processKeyDown("ctrlClick")
    sleep 100
    processKeyUp("ctrlClick")
    sleep 100
    processKeyUp("shiftClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_ctrlClick_is_pressed_and_shiftClick_is_pressed_and_released_left_click_is_sent_on_ctrlClick_release_#507()
{
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("hello ")
    processKeyDown("ctrlClick")
    sleep 100
    processKeyDown("shiftClick")
    sleep 100
    processKeyUp("shiftClick")
    sleep 100
    processKeyUp("ctrlClick")
    
    validateCaretOutput(A_ThisFunc, expected)
}