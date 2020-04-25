When_shiftClick_is_pressed_at_release_left_click_is_sent_#301()
{
    simulateTyping("he")
    expected := setMousePositionToCaret()
    simulateTyping("llo")
    simulateModifierClick("shiftClick", 1)
    simulateModifierClick("shiftClick", 0)
    
    validateCaretOutput(A_ThisFunc, expected)    
}

When_shiftClick_is_continously_pressed_and_layout_key_is_pressed_but_not_release_space_is_not_sent_#302()
{
    simulateTyping("hello")
    simulateModifierClick("shiftClick", 1)
    simulateKeyDown("space", 1000)
    simulateKeyUp("space", 50)
    simulateModifierClick("shiftClick", 0)
        
    expected := "hello"
    validateTestOutput(A_ThisFunc , expected)
}

When_shiftClick_is_continously_pressed_and_letter_key_is_pressed_capitalized_letter_is_sent_#303()
{
    simulateTyping("hello ")
    simulateModifierClick("shiftClick", 1)
    simulateTyping("world")
    simulateModifierClick("shiftClick", 0)
        
    expected := "hello WORLD"
    validateTestOutput(A_ThisFunc , expected)
}

When_shiftClick_is_continously_pressed_and_letter_key_is_pressed_left_click_is_not_sent_on_shiftClick_release_#304()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateModifierClick("shiftClick", 1)
    simulateTyping("llo")
    expected := getCurrentCaretPosition()
    simulateModifierClick("shiftClick", 0)

    validateCaretOutput(A_ThisFunc, expected)    
}

When_shiftClick_is_continously_pressed_and_layout_key_is_pressed_and_key_remapped_as_left_is_sent_on_shiftClick_release_click_is_not_sent_#305()
{
    simulateTyping("hello ")
    setMousePositionToCaret()
    simulateModifierClick("shiftClick", 1)
    simulateKeyDown("space", 50)
    simulateKeyDown("a", 50)
    expected := getCurrentCaretPosition()
    simulateModifierClick("shiftClick", 0)
    simulateKeyUp("space", 50)
    simulateKeyUp("a", 50)

    validateCaretOutput(A_ThisFunc, expected)
}

When_shiftClick_is_pressed_and_ctrl_key_is_pressed_click_is_not_sent_on_shiftClick_release_#306()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo")
    simulateModifierClick("shiftClick", 1)
    simulateKeyDown("lctrl", 50)
    expected := getCurrentCaretPosition()
    simulateModifierClick("shiftClick", 0)
    simulateKeyUp("lctrl", 50)

    validateCaretOutput(A_ThisFunc, expected)
}

When_shiftClick_is_pressed_and_alt_key_is_pressed_click_is_not_sent_on_shiftClick_release_#307()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo")
    expected := getCurrentCaretPosition()
    simulateModifierClick("shiftClick", 1)
    simulateKeyDown("ralt", 50)
    simulateKeyUp("ralt", 50)
    simulateKeyDown("ralt", 50)
    simulateKeyUp("ralt", 50)
    simulateModifierClick("shiftClick", 0)

    validateCaretOutput(A_ThisFunc, expected)
}

When_shiftClick_is_pressed_and_shift_key_is_pressed_click_is_not_sent_on_shiftClick_release_#308()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo")
    expected := getCurrentCaretPosition()
    simulateModifierClick("shiftClick", 1)
    simulateKeyDown("lshift", 50)
    simulateKeyUp("lshift", 50)
    simulateModifierClick("shiftClick", 0)

    validateCaretOutput(A_ThisFunc, expected)
}

When_shiftClick_is_pressed_and_win_key_is_pressed_click_is_not_sent_on_shiftClick_release_#309()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo")
    expected := getCurrentCaretPosition()
    simulateModifierClick("shiftClick", 1)
    processKeyDown("lwin")
    sleep 50
    processKeyUp("lwin")
    sleep 50
    processKeyDown("lwin")
    sleep 50
    processKeyUp("lwin")
    sleep 50
    simulateModifierClick("shiftClick", 0)

    validateCaretOutput(A_ThisFunc, expected)
}

When_shiftClick_is_pressed_and_ctrl_key_is_pressed_and_layout_key_continous_pressed_and_key_remapped_as_left_key_a_word_is_selected_#310()
{
    simulateTyping("hello")
    setMousePositionToCaret()
    simulateTyping(" world")
    simulateModifierClick("shiftClick", 1)
    simulateKeyDown("lctrl", 50)
    simulateKeyDown("space", 50)
    simulateKeyDown("a", 50)
    simulateKeyUp("space", 50)
    simulateKeyUp("a", 50)
    simulateKeyUp("lctrl", 50)
    simulateModifierClick("shiftClick", 0)
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
    simulateModifierClick("shiftClick", 1)
    simulateKeyDown("space", 50)
    simulateKeyUp("space", 50)
    expected := getCurrentCaretPosition()
    simulateModifierClick("shiftClick", 0)

    validateCaretOutput(A_ThisFunc, expected)
}    

When_shiftClick_is_continously_pressed_and_mouse_is_moved_the_text_is_selected_#312()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    simulateModifierClick("shiftClick", 1)
    MouseMove startingPosition.x, startingPosition.y
    simulateModifierClick("shiftClick", 0)
    
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
    simulateModifierClick("shiftClick", 1)
    MouseMove startingPosition.x, startingPosition.y
    simulateTyping("a")
    simulateModifierClick("shiftClick", 0)

    expected := "a"
    validateTestOutput(A_ThisFunc , expected)
}

When_shiftClick_is_continously_pressed_and_mouse_is_moved_and_layout_key_is_pressed_space_is_sent_on_layout_key_release_#314()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello")
    setMousePositionToCaret()
    simulateModifierClick("shiftClick", 1)
    MouseMove startingPosition.x, startingPosition.y
    simulateTyping(" ")
    simulateModifierClick("shiftClick", 0)

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
    simulateModifierClick("shiftClick", 1)
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyDown("space", timeoutStillSendLayoutKey + 100)
    simulateKeyUp("space", 100)
    simulateModifierClick("shiftClick", 0)

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
    simulateModifierClick("shiftClick", 1)
    simulateTyping("y")
    simulateKeyUp("space", 100)
    simulateModifierClick("shiftClick", 0)
    
    expected := "a Y"
    validateTestOutput(A_ThisFunc , expected)
}

When_non_modifier_letter_is_released_and_layout_key_continous_press_in_less_then_timeoutProcessLayoutOnRelease_and_shiftClick_continous_press_and_letter_key_alternative_mapped_as_left_key_pressed_and_released_text_is_selected_#317()
{
    simulateKeyDown("b", 20)
    simulateKeyUp("b", 20)
    simulateKeyDown("space", 100)
    simulateModifierClick("shiftClick", 1)
    simulateTyping("a")
    simulateKeyUp("space", 100)
    simulateModifierClick("shiftClick", 0)
    
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
    simulateModifierClick("shiftClick", 1)
    simulateTyping("y")
    simulateKeyUp("space", 100)
    simulateModifierClick("shiftClick", 0)
    
    expected := setMousePositionToCaret()
    validateCaretOutput(A_ThisFunc, expected)
}

When_shift_key_is_pressed_followed_by_shiftClick_is_press_and_release_text_is_selected_#319()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    simulateKeyDown("lshift", 100)
    simulateModifierClick("shiftClick", 1)
    simulateModifierClick("shiftClick", 0)
    simulateKeyUp("lshift", 100)
    
    actual := getSelectedText()
    expected := "hello "
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment()
}

When_shiftClick_is_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_shiftClick_release_#320()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    processKeyDown("shiftClick")
    sleep 1000
    processKeyUp("shiftClick")
    sleep 100
    
    expected := getCurrentCaretPosition()
    validateCaretOutput(A_ThisFunc, expected)
}

When_layout_key_is_pressed_followed_by_shiftClick_left_click_is_not_sent_on_shiftClick_release_#321()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    processKeyDown("space")
    processKeyDown("shiftClick")
    sleep 100
    processKeyUp("shiftClick")
    sleep 100
    processKeyUp("space")
    
    expected := getCurrentCaretPosition()
    validateCaretOutput(A_ThisFunc, expected)
}

When_non_modifier_key_is_pressed_followed_by_shiftClick_left_click_is_not_sent_on_shiftClick_release_#322()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    simulateKeyDown("a", 100)
    processKeyDown("shiftClick")
    sleep 100
    processKeyUp("shiftClick")
    simulateKeyUp("a", 100)
    
    expected := getCurrentCaretPosition()
    validateCaretOutput(A_ThisFunc, expected)
}
