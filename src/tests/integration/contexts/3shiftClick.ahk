When_shiftClick_is_pressed_at_release_left_click_is_sent_#301()
{
    simulateTyping("he")
    expected := setMousePositionToCaret()
    simulateTyping("llo")
    processKeyDown("shiftClick")
    sleep 100
    processKeyUp("shiftClick")
    sleep 100
    
    validateCaretOutput(A_ThisFunc, expected)    
}

When_shiftClick_is_continously_pressed_and_layout_key_is_pressed_but_not_release_space_is_not_sent_#302()
{
    simulateTyping("hello")
    processKeyDown("shiftClick")
    sleep 100
    simulateKeyDown("space", 1000)
    simulateKeyUp("space", 50)
    processKeyUp("shiftClick")
    sleep 100
        
    expected := "hello"
    validateTestOutput(A_ThisFunc , expected)
}

When_shiftClick_is_continously_pressed_and_letter_key_is_pressed_capitalized_letter_is_sent_#303()
{
    simulateTyping("hello ")
    processKeyDown("shiftClick")
    sleep 100
    simulateTyping("world")
    processKeyUp("shiftClick")
    sleep 100
        
    expected := "hello WORLD"
    validateTestOutput(A_ThisFunc , expected)
}

When_shiftClick_is_continously_pressed_and_letter_key_is_pressed_left_click_is_not_sent_on_shiftClick_release_#304()
{
    simulateTyping("he")
    setMousePositionToCaret()
    processKeyDown("shiftClick")
    sleep 100
    simulateTyping("llo")
    expected := getCurrentCaretPosition()
    processKeyUp("shiftClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)    
}

When_shiftClick_is_continously_pressed_and_layout_key_is_pressed_and_key_remapped_as_left_is_sent_on_shiftClick_release_click_is_not_sent_#305()
{
    simulateTyping("hello ")
    setMousePositionToCaret()
    processKeyDown("shiftClick")
    sleep 100
    simulateKeyDown("space", 50)
    simulateKeyDown("a", 50)
    expected := getCurrentCaretPosition()
    processKeyUp("shiftClick")
    sleep 100
    simulateKeyUp("space", 50)
    simulateKeyUp("a", 50)

    validateCaretOutput(A_ThisFunc, expected)
}

When_shiftClick_is_pressed_and_ctrl_key_is_pressed_click_is_not_sent_on_shiftClick_release_#306()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo")
    expected := getCurrentCaretPosition()
    processKeyDown("shiftClick")
    sleep 100
    simulateKeyDown("lctrl", 50)
    processKeyUp("shiftClick")
    sleep 100
    simulateKeyUp("lctrl", 50)

    validateCaretOutput(A_ThisFunc, expected)
}

When_shiftClick_is_pressed_and_alt_key_is_pressed_click_is_not_sent_on_shiftClick_release_#307()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo")
    expected := getCurrentCaretPosition()
    processKeyDown("shiftClick")
    sleep 100
    simulateKeyDown("ralt", 50)
    simulateKeyUp("ralt", 50)
    simulateKeyDown("ralt", 50)
    simulateKeyUp("ralt", 50)
    processKeyUp("shiftClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_shiftClick_is_pressed_and_shift_key_is_pressed_click_is_not_sent_on_shiftClick_release_#308()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo")
    expected := getCurrentCaretPosition()
    processKeyDown("shiftClick")
    sleep 100
    simulateKeyDown("lshift", 50)
    simulateKeyUp("lshift", 50)
    processKeyUp("shiftClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_shiftClick_is_pressed_and_win_key_is_pressed_click_is_not_sent_on_shiftClick_release_#309()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo")
    expected := getCurrentCaretPosition()
    processKeyDown("shiftClick")
    sleep 100
    processKeyDown("lwin")
    sleep 100
    processKeyUp("lwin")
    sleep 100
    processKeyDown("lwin")
    sleep 200
    processKeyUp("lwin")
    sleep 400
    processKeyUp("shiftClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_shiftClick_is_pressed_and_ctrl_key_is_pressed_and_layout_key_continous_pressed_and_key_remapped_as_left_key_a_word_is_selected_#310()
{
    simulateTyping("hello")
    setMousePositionToCaret()
    simulateTyping(" world")
    processKeyDown("shiftClick")
    sleep 100
    simulateKeyDown("lctrl", 50)
    simulateKeyDown("space", 50)
    simulateKeyDown("a", 50)
    simulateKeyUp("space", 50)
    simulateKeyUp("a", 50)
    simulateKeyUp("lctrl", 50)
    processKeyUp("shiftClick")
    sleep 100
    actual := getSelectedText()
    expected := "world"
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment()
}    

When_shiftClick_is_continously_pressed_and_layout_key_is_pressed_after_release_left_click_is_not_sent_#311()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo")
    processKeyDown("shiftClick")
    sleep 100
    simulateKeyDown("space", 50)
    simulateKeyUp("space", 50)
    expected := getCurrentCaretPosition()
    processKeyUp("shiftClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}    

When_shiftClick_is_continously_pressed_and_mouse_is_moved_the_text_is_selected_#312()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    processKeyDown("shiftClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    processKeyUp("shiftClick")
    sleep 100
    
    actual := getSelectedText()
    expected := "hello "
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment()
}

When_shiftClick_is_continously_pressed_and_mouse_is_moved_and_a_letter_is_typed_a_letter_is_sent_#313()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello")
    setMousePositionToCaret()
    processKeyDown("shiftClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateTyping("a")
    processKeyUp("shiftClick")
    sleep 100

    expected := "a"
    validateTestOutput(A_ThisFunc , expected)
}

When_shiftClick_is_continously_pressed_and_mouse_is_moved_and_layout_key_is_pressed_space_is_sent_on_layout_key_release_#314()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello")
    setMousePositionToCaret()
    processKeyDown("shiftClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateTyping(" ")
    processKeyUp("shiftClick")
    sleep 100

    actual := clearText()
    expected := " "

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment()
}    

When_shiftClick_is_continously_pressed_and_mouse_is_moved_and_layout_key_is_pressed_longer_then_timeoutStillSendLayoutKey_space_is_not_sent_on_layout_key_release_#315()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    processKeyDown("shiftClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyDown("space", timeoutStillSendLayoutKey + 100)
    simulateKeyUp("space", 100)
    processKeyUp("shiftClick")
    sleep 100

    actual := clearText()
    expected := "hello "

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment()
}    

When_non_modifier_letter_is_released_and_layout_key_continous_press_in_less_then_timeoutProcessLayoutOnRelease_and_shiftClick_continous_press_and_letter_key_without_alternative_mapping_pressed_and_release_capitalized_letter_is_sent_#316()
{
    simulateKeyDown("a", 20)
    simulateKeyUp("a", 20)
    simulateKeyDown("space", 100)
    processKeyDown("shiftClick")
    sleep 100
    simulateTyping("y")
    simulateKeyUp("space", 100)
    processKeyUp("shiftClick")
    sleep 100
    
    expected := "a Y"
    validateTestOutput(A_ThisFunc , expected)
}

When_non_modifier_letter_is_released_and_layout_key_continous_press_in_less_then_timeoutProcessLayoutOnRelease_and_shiftClick_continous_press_and_letter_key_alternative_mapped_as_left_key_pressed_and_released_text_is_selected_#317()
{
    simulateKeyDown("b", 20)
    simulateKeyUp("b", 20)
    simulateKeyDown("space", 100)
    processKeyDown("shiftClick")
    sleep 100
    simulateTyping("a")
    simulateKeyUp("space", 100)
    processKeyUp("shiftClick")
    sleep 100
    
    actual := getSelectedText()
    expected := "b"
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment()
}

When_non_modifier_letter_is_released_and_layout_key_continous_press_in_less_then_timeoutProcessLayoutOnRelease_and_shiftClick_continous_press_and_letter_key_pressed_and_released_and_shiftClick_released_left_click_is_not_sent_#318()
{
    setMousePositionToCaret()
    simulateKeyDown("a", 20)
    simulateKeyUp("a", 20)
    simulateKeyDown("space", 100)
    processKeyDown("shiftClick")
    sleep 100
    simulateTyping("y")
    simulateKeyUp("space", 100)
    processKeyUp("shiftClick")
    sleep 100
    
    expected := setMousePositionToCaret()
    validateCaretOutput(A_ThisFunc, expected)
}

When_shift_key_is_pressed_followed_by_shiftClick_is_press_and_release_text_is_selected_#319()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    simulateKeyDown("lshift", 100)
    processKeyDown("shiftClick")
    sleep 100
    processKeyUp("shiftClick")
    sleep 100
    simulateKeyUp("lshift", 100)
    
    actual := getSelectedText()
    expected := "hello "
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment()
}

When_shiftClick_is_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_shiftClick_release_#320()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    processKeyDown("shiftClick")
    sleep 1000
    processKeyUp("shiftClick")
    sleep 100
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_layout_key_is_pressed_followed_by_shiftClick_left_click_is_not_sent_on_shiftClick_release_#321()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    processKeyDown("space")
    sleep 1000
    processKeyDown("shiftClick")
    processKeyUp("shiftClick")
    sleep 100
    processKeyUp("space")
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_non_modifier_key_is_pressed_followed_by_shiftClick_left_click_is_not_sent_on_shiftClick_release_#322()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    simulateKeyDown("a", 100)
    expected := getCurrentCaretPosition()
    processKeyDown("shiftClick")
    sleep 100
    processKeyUp("shiftClick")
    simulateKeyUp("a", 100)
    
    validateCaretOutput(A_ThisFunc, expected)
}
