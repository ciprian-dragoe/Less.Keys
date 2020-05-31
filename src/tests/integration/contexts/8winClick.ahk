When_winClick_is_pressed_at_release_left_click_is_sent_#801()
{
    simulateTyping("he")
    expected := setMousePositionToCaret()
    simulateTyping("llo")
    processKeyDown("winClick")
    sleep 100
    processKeyUp("winClick")
    sleep 100
    
    validateCaretOutput(A_ThisFunc, expected)    
}

When_winClick_is_continuously_pressed_and_layout_key_is_pressed_but_not_release_space_is_not_sent_#802()
{
    simulateTyping("hello")
    processKeyDown("winClick")
    sleep 100
    simulateKeyDown("space", 1000)
    simulateKeyUp("space", 50)
    processKeyUp("winClick")
    sleep 100
        
    expected := "hello"
    validateTestOutput(A_ThisFunc , expected)
}

When_winClick_is_continuously_pressed_and_caret_key_is_pressed_keyboard_shortcut_is_sent_#803()
{
    simulateTyping("hello ")
    processKeyDown("winClick")
    sleep 100
    processKeyDown("``")
    processKeyUp("``")
    processKeyUp("winClick")
    sleep 100
        
    expected := "hello INTEGRATION_TEST"
    validateTestOutput(A_ThisFunc , expected)
}

When_winClick_is_continuously_pressed_and_letter_key_is_pressed_left_click_is_not_sent_on_winClick_release_#804()
{
    simulateTyping("he")
    setMousePositionToCaret()
    processKeyDown("winClick")
    sleep 100
    simulateTyping("llo")
    expected := getCurrentCaretPosition()
    processKeyUp("winClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)    
}

When_winClick_is_continuously_pressed_and_layout_key_is_pressed_and_key_remapped_as_left_is_sent_on_winClick_release_click_is_not_sent_#805()
{
    simulateTyping("hello ")
    setMousePositionToCaret()
    processKeyDown("winClick")
    sleep 100
    simulateKeyDown("space", 50)
    simulateKeyDown("a", 50)
    expected := getCurrentCaretPosition()
    processKeyUp("winClick")
    sleep 100
    simulateKeyUp("space", 50)
    simulateKeyUp("a", 50)

    validateCaretOutput(A_ThisFunc, expected)
    winMaximize
}

When_winClick_is_pressed_and_ctrl_key_is_pressed_click_is_not_sent_on_winClick_release_#806()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo")
    expected := getCurrentCaretPosition()
    processKeyDown("winClick")
    sleep 100
    simulateKeyDown("lctrl", 50)
    processKeyUp("winClick")
    sleep 100
    simulateKeyUp("lctrl", 50)

    validateCaretOutput(A_ThisFunc, expected)
}

When_winClick_is_pressed_and_alt_key_is_pressed_click_is_not_sent_on_winClick_release_#807()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo")
    expected := getCurrentCaretPosition()
    processKeyDown("winClick")
    sleep 100
    simulateKeyDown("ralt", 50)
    simulateKeyUp("ralt", 50)
    simulateKeyDown("ralt", 50)
    simulateKeyUp("ralt", 50)
    processKeyUp("winClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_winClick_is_pressed_and_win_key_is_pressed_click_is_not_sent_on_winClick_release_#808()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo")
    expected := getCurrentCaretPosition()
    processKeyDown("winClick")
    sleep 100
    processKeyDown("lwin")
    sleep 100
    processKeyUp("lwin")
    sleep 200
    processKeyDown("lwin")
    sleep 100
    processKeyUp("lwin")
    sleep 400
    processKeyUp("winClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_winClick_is_continuously_pressed_and_layout_key_is_pressed_after_release_left_click_is_not_sent_#809()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo")
    processKeyDown("winClick")
    sleep 100
    simulateKeyDown("space", 50)
    simulateKeyUp("space", 50)
    expected := getCurrentCaretPosition()
    processKeyUp("winClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}    

When_winClick_is_continuously_pressed_and_mouse_is_moved_the_text_is_selected_#810()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    processKeyDown("winClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    processKeyUp("winClick")
    sleep 100
    
    actual := getSelectedText()
    expected := "hello "
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment()
}

When_winClick_is_continuously_pressed_and_mouse_is_moved_text_is_selected_#811()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello")
    setMousePositionToCaret()
    processKeyDown("winClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    processKeyUp("winClick")
    actual := clearText()
    expected := "hello"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment()
}

When_winClick_is_continuously_pressed_and_mouse_is_moved_and_layout_key_is_pressed_space_is_sent_on_layout_key_release_#812()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello")
    setMousePositionToCaret()
    processKeyDown("winClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateTyping(" ")
    processKeyUp("winClick")
    sleep 100

    actual := clearText()
    expected := " "

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment()
}    

When_winClick_is_continuously_pressed_and_mouse_is_moved_and_layout_key_is_pressed_longer_then_timeoutStillSendLayoutKey_space_is_not_sent_on_layout_key_release_#813()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    processKeyDown("winClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyDown("space", timeoutStillSendLayoutKey + 100)
    simulateKeyUp("space", 100)
    processKeyUp("winClick")
    sleep 100

    actual := clearText()
    expected := "hello "

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment()
}    

When_non_modifier_letter_is_released_and_layout_key_continuous_press_in_less_then_timeoutProcessLayoutOnRelease_and_winClick_continuous_press_and_caret_key_pressed_and_release_keyboard_shortcut_is_sent_#814()
{
    simulateKeyDown("a", 20)
    simulateKeyUp("a", 20)
    simulateKeyDown("space", 100)
    processKeyDown("winClick")
    sleep 100
    processKeyDown("``")
    processKeyUp("``")
    simulateKeyUp("space", 100)
    processKeyUp("winClick")
    sleep 100
    
    expected := "a INTEGRATION_TEST"
    validateTestOutput(A_ThisFunc , expected)
}

When_non_modifier_letter_is_released_and_layout_key_continuous_press_in_less_then_timeoutProcessLayoutOnRelease_and_winClick_continuous_press_and_caret_pressed_and_released_and_winClick_released_left_click_is_not_sent_#815()
{
    setMousePositionToCaret()
    simulateKeyDown("a", 20)
    simulateKeyUp("a", 20)
    simulateKeyDown("space", 100)
    processKeyDown("winClick")
    sleep 100
    processKeyDown("``")
    processKeyUp("``")
    simulateKeyUp("space", 100)
    processKeyUp("winClick")
    sleep 100
    
    expected := setMousePositionToCaret()
    validateCaretOutput(A_ThisFunc, expected)
}

When_winClick_is_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_winClick_release_#816()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    processKeyDown("winClick")
    sleep 1000
    processKeyUp("winClick")
    sleep 100
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_layout_key_is_pressed_followed_by_winClick_left_click_is_not_sent_on_winClick_release_#817()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    processKeyDown("space")
    sleep 1000
    processKeyDown("winClick")
    processKeyUp("winClick")
    sleep 100
    processKeyUp("space")
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_non_modifier_key_is_pressed_followed_by_winClick_left_click_is_not_sent_on_winClick_release_#818()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    simulateKeyDown("a", 100)
    expected := getCurrentCaretPosition()
    processKeyDown("winClick")
    sleep 100
    processKeyUp("winClick")
    simulateKeyUp("a", 100)
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_winClick_action_is_not_lbutton_and_mouse_is_moved_on_release_action_is_sent_instead_of_mouse_click_#819()
{
	modifierDoubledAsClick["winClick"] := "c"
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
	setMousePositionToCaret()
    processKeyDown("winClick")
	sleep 50
    MouseMove startingPosition.x, startingPosition.y
    processKeyUp("winClick")
    sleep 100
    
    expected := "hello c"
    validateTestOutput(A_ThisFunc , expected)
	modifierDoubledAsClick["winClick"] := "lbutton"
}
