When_ctrlClick_is_pressed_at_release_left_click_is_sent_#401()
{
    simulateTyping("he")
    expected := setMousePositionToCaret()
    simulateTyping("llo")
    processKeyDown("ctrlClick")
    sleep 100
    processKeyUp("ctrlClick")
    sleep 100
    
    validateCaretOutput(A_ThisFunc, expected)    
}

When_ctrlClick_is_continously_pressed_and_layout_key_is_pressed_but_not_release_space_is_not_sent_#402()
{
    simulateTyping("hello")
    processKeyDown("ctrlClick")
    sleep 100
    simulateKeyDown("space", 1000)
    simulateKeyUp("space", 50)
    processKeyUp("ctrlClick")
    sleep 100
        
    expected := "hello"
    validateTestOutput(A_ThisFunc , expected)
}

When_ctrlClick_is_continously_pressed_and_a_letter_is_pressed_all_text_is_selected_#403()
{
    simulateTyping("hello ")
    processKeyDown("ctrlClick")
    sleep 100
    simulateTyping("a")
    processKeyUp("ctrlClick")
    sleep 100
        
    actual := getSelectedText()
    expected := "hello "
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment()
}

When_ctrlClick_is_continously_pressed_and_a_key_is_pressed_left_click_is_not_sent_on_ctrlClick_release_#404()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo")
    expected := getCurrentCaretPosition()
    processKeyDown("ctrlClick")
    sleep 100
    simulateTyping("a")
    processKeyUp("ctrlClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)    
}

When_ctrlClick_is_continously_pressed_and_layout_key_is_pressed_and_key_remapped_as_left_is_sent_on_ctrlClick_release_click_is_not_sent_#405()
{
    expected := setMousePositionToCaret()
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo ")
    processKeyDown("ctrlClick")
    sleep 100
    simulateKeyDown("space", 50)
    simulateKeyDown("a", 50)
    processKeyUp("ctrlClick")
    sleep 100
    simulateKeyUp("space", 50)
    simulateKeyUp("a", 50)

    validateCaretOutput(A_ThisFunc, expected)
}

When_ctrlClick_is_pressed_and_ctrl_key_is_pressed_click_is_not_sent_on_ctrlClick_release_#406()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo")
    expected := getCurrentCaretPosition()
    processKeyDown("ctrlClick")
    sleep 100
    simulateKeyDown("lctrl", 50)
    processKeyUp("ctrlClick")
    sleep 100
    simulateKeyUp("lctrl", 50)

    validateCaretOutput(A_ThisFunc, expected)
}

When_ctrlClick_is_pressed_and_alt_key_is_pressed_click_is_not_sent_on_ctrlClick_release_#407()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo")
    expected := getCurrentCaretPosition()
    processKeyDown("ctrlClick")
    sleep 100
    simulateKeyDown("ralt", 50)
    simulateKeyUp("ralt", 50)
    simulateKeyDown("ralt", 50)
    simulateKeyUp("ralt", 50)
    processKeyUp("ctrlClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_ctrlClick_is_pressed_and_ctrl_key_is_pressed_click_is_not_sent_on_ctrlClick_release_#408()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo")
    expected := getCurrentCaretPosition()
    processKeyDown("ctrlClick")
    sleep 100
    simulateKeyDown("lctrl", 50)
    simulateKeyUp("lctrl", 50)
    processKeyUp("ctrlClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_ctrlClick_is_pressed_and_win_key_is_pressed_click_is_not_sent_on_ctrlClick_release_#409()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo")
    expected := getCurrentCaretPosition()
    processKeyDown("ctrlClick")
    sleep 100
    processKeyDown("lwin")
    sleep 50
    processKeyUp("lwin")
    sleep 50
    processKeyDown("lwin")
    sleep 50
    processKeyUp("lwin")
    sleep 50
    processKeyUp("ctrlClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_ctrlClick_is_pressed_and_shift_key_is_pressed_and_layout_key_continous_pressed_and_key_remapped_as_left_key_a_word_is_selected_#410()
{
    simulateTyping("hello")
    setMousePositionToCaret()
    simulateTyping(" world")
    processKeyDown("ctrlClick")
    sleep 100
    simulateKeyDown("lshift", 50)
    simulateKeyDown("space", 50)
    simulateKeyDown("a", 50)
    simulateKeyUp("space", 50)
    simulateKeyUp("a", 50)
    simulateKeyUp("lshift", 50)
    processKeyUp("ctrlClick")
    sleep 100
    actual := getSelectedText()
    expected := "world"
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment()
}    

When_ctrlClick_is_continously_pressed_and_layout_key_is_pressed_after_release_left_click_is_not_sent_#411()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo")
    processKeyDown("ctrlClick")
    sleep 100
    simulateKeyDown("space", 50)
    simulateKeyUp("space", 50)
    expected := getCurrentCaretPosition()
    processKeyUp("ctrlClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}    

When_ctrlClick_is_continously_pressed_and_mouse_is_moved_the_text_is_selected_#412()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    processKeyDown("ctrlClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    processKeyUp("ctrlClick")
    sleep 100
    
    actual := getSelectedText()
    expected := "hello "
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment()
}

When_ctrlClick_is_continously_pressed_and_mouse_is_moved_and_a_letter_is_typed_a_letter_is_sent_#413()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello")
    setMousePositionToCaret()
    processKeyDown("ctrlClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateTyping("a")
    processKeyUp("ctrlClick")
    sleep 100

    expected := "a"
    validateTestOutput(A_ThisFunc , expected)
}

When_ctrlClick_is_continously_pressed_and_mouse_is_moved_and_layout_key_is_pressed_space_is_sent_on_layout_key_release_#414()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello")
    setMousePositionToCaret()
    processKeyDown("ctrlClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateTyping(" ")
    processKeyUp("ctrlClick")
    sleep 100

    actual := clearText()
    expected := " "

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment()
}    

When_ctrlClick_is_continously_pressed_and_mouse_is_moved_and_layout_key_is_pressed_longer_then_timeoutStillSendLayoutKey_space_is_not_sent_on_layout_key_release_#415()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    processKeyDown("ctrlClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyDown("space", timeoutStillSendLayoutKey + 100)
    simulateKeyUp("space", 100)
    processKeyUp("ctrlClick")
    sleep 100

    actual := clearText()
    expected := "hello "

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment()
}    

When_non_modifier_letter_is_released_and_layout_key_continous_press_in_less_then_timeoutProcessLayoutOnRelease_and_ctrlClick_continous_press_and_letter_key_alternative_mapped_as_left_key_pressed_and_released_caret_is_moved_#416()
{
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    simulateTyping("world")
    simulateKeyDown("space", 50)
    processKeyDown("ctrlClick")
    sleep 50
    simulateTyping("a")
    simulateKeyUp("space", 100)
    processKeyUp("ctrlClick")
    sleep 100
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_non_modifier_letter_is_released_and_layout_key_continous_press_in_less_then_timeoutProcessLayoutOnRelease_and_ctrlClick_continous_press_and_letter_key_pressed_and_released_and_ctrlClick_released_left_click_is_not_sent_#417()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    simulateTyping("world")
    simulateKeyDown("space", 50)
    processKeyDown("ctrlClick")
    sleep 50
    simulateTyping("a")
    simulateKeyUp("space", 100)
    processKeyUp("ctrlClick")
    sleep 100
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_ctrlClick_is_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_ctrlClick_release_#418()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    processKeyDown("ctrlClick")
    sleep 1000
    processKeyUp("ctrlClick")
    sleep 100
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_layout_key_is_pressed_followed_by_ctrlClick_left_click_is_not_sent_on_ctrlClick_release_#419()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    processKeyDown("space")
    sleep 1000
    processKeyDown("ctrlClick")
    sleep 100
    processKeyUp("ctrlClick")
    sleep 100
    processKeyUp("space")
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_non_modifier_key_is_pressed_followed_by_ctrlClick_left_click_is_not_sent_on_ctrlClick_release_#420()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    simulateKeyDown("a", 100)
    expected := getCurrentCaretPosition()
    processKeyDown("ctrlClick")
    sleep 100
    processKeyUp("ctrlClick")
    simulateKeyUp("a", 100)
    
    validateCaretOutput(A_ThisFunc, expected)
}
