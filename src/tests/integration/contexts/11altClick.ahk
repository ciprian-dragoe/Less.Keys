When_altClick_is_pressed_at_release_left_click_is_sent_#1101()
{
    simulateTyping("he")
    expected := setMousePositionToCaret()
    simulateTyping("llo")
    processKeyDown("altClick")
    sleep 100
    processKeyUp("altClick")
    sleep 100
    
    validateCaretOutput(A_ThisFunc, expected)    
}

When_altClick_is_continuously_pressed_and_layout_key_is_pressed_but_not_release_space_is_not_sent_#1102()
{
    simulateTyping("hello")
    processKeyDown("altClick")
    sleep 100
    simulateKeyDown("space", 1000)
    simulateKeyUp("space", 50)
    processKeyUp("altClick")
    sleep 100
    send {escape}
        
    expected := "hello"
    validateTestOutput(A_ThisFunc , expected)
}

When_altClick_is_continuously_pressed_and_caret_key_is_pressed_keyboard_shortcut_is_sent_#1103()
{
    simulateTyping("hello ")
    processKeyDown("altClick")
    sleep 100
    processKeyDown("``")
    processKeyUp("``")
    processKeyUp("altClick")
    sleep 100
        
    expected := "hello INTEGRATION_TEST"
    validateTestOutput(A_ThisFunc , expected)
}

When_altClick_is_continuously_pressed_and_letter_key_is_pressed_left_click_is_not_sent_on_altClick_release_#1104()
{
    simulateTyping("he")
    setMousePositionToCaret()
    processKeyDown("altClick")
    sleep 100
    simulateTyping("ll")
    expected := getCurrentCaretPosition()
    processKeyUp("altClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)    
}

When_altClick_is_continuously_pressed_and_layout_key_is_pressed_and_key_remapped_as_left_is_sent_on_altClick_release_click_is_not_sent_#1105()
{
    simulateTyping("hello ")
    setMousePositionToCaret()
    processKeyDown("altClick")
    sleep 100
    simulateKeyDown("space", 50)
    simulateKeyDown("a", 50)
    expected := getCurrentCaretPosition()
    processKeyUp("altClick")
    sleep 100
    simulateKeyUp("space", 50)
    simulateKeyUp("a", 50)

    validateCaretOutput(A_ThisFunc, expected)
    winMaximize
}

When_altClick_is_pressed_and_ctrl_key_is_pressed_click_is_not_sent_on_altClick_release_#1106()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo")
    expected := getCurrentCaretPosition()
    processKeyDown("altClick")
    sleep 100
    simulateKeyDown("lctrl", 50)
    processKeyUp("altClick")
    sleep 100
    simulateKeyUp("lctrl", 50)

    validateCaretOutput(A_ThisFunc, expected)
}

When_altClick_is_pressed_and_shift_key_is_pressed_click_is_not_sent_on_altClick_release_#1107()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo")
    expected := getCurrentCaretPosition()
    processKeyDown("altClick")
    sleep 100
    simulateKeyDown("lshift", 50)
    simulateKeyUp("lshift", 50)
    processKeyUp("altClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_altClick_is_pressed_and_win_key_is_pressed_click_is_not_sent_on_altClick_release_#1108()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo")
    expected := getCurrentCaretPosition()
    processKeyDown("altClick")
    sleep 100
    processKeyDown("lwin")
    sleep 100
    processKeyUp("lwin")
    sleep 300
    processKeyDown("lwin")
    sleep 100
    processKeyUp("lwin")
    sleep 1000
    processKeyUp("altClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_altClick_is_continuously_pressed_and_layout_key_is_pressed_after_release_left_click_is_not_sent_#1109()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo")
    processKeyDown("altClick")
    sleep 100
    simulateKeyDown("space", 50)
    simulateKeyUp("space", 50)
    expected := getCurrentCaretPosition()
    processKeyUp("altClick")
    sleep 100
    send {escape}
    sleep 500

    validateCaretOutput(A_ThisFunc, expected)
}    

When_altClick_is_continuously_pressed_and_mouse_is_moved_the_text_is_selected_#1110()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    processKeyDown("altClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    processKeyUp("altClick")
    sleep 100
    
    actual := getSelectedText()
    expected := "hello "
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment()
}

When_altClick_is_continuously_pressed_and_mouse_is_moved_and_layout_key_is_pressed_space_is_sent_on_layout_key_release_#1111()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello")
    setMousePositionToCaret()
    processKeyDown("altClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateTyping(" ")
    processKeyUp("altClick")
    sleep 100

    actual := clearText()
    expected := " "

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment()
}    

When_altClick_is_continuously_pressed_and_mouse_is_moved_and_layout_key_is_pressed_longer_then_timeoutStillSendLayoutKey_space_is_not_sent_on_layout_key_release_#1112()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    processKeyDown("altClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyDown("space", timeoutStillSendLayoutKey + 100)
    simulateKeyUp("space", 100)
    processKeyUp("altClick")
    sleep 100

    actual := clearText()
    expected := "hello "

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment()
}    

When_non_modifier_letter_is_released_and_layout_key_continuous_press_in_less_then_timeoutProcessLayoutOnRelease_and_altClick_continuous_press_and_caret_key_pressed_and_release_keyboard_shortcut_is_sent_#1113()
{
    simulateKeyDown("a", 20)
    simulateKeyUp("a", 20)
    simulateKeyDown("space", 100)
    processKeyDown("altClick")
    sleep 100
    processKeyDown("``")
    processKeyUp("``")
    simulateKeyUp("space", 100)
    processKeyUp("altClick")
    sleep 100
    
    expected := "a INTEGRATION_TEST"
    validateTestOutput(A_ThisFunc , expected)
}

When_non_modifier_letter_is_released_and_layout_key_continuous_press_in_less_then_timeoutProcessLayoutOnRelease_and_altClick_continuous_press_and_caret_pressed_and_released_and_altClick_released_left_click_is_not_sent_#1114()
{
    setMousePositionToCaret()
    simulateKeyDown("a", 20)
    simulateKeyUp("a", 20)
    simulateKeyDown("space", 100)
    processKeyDown("altClick")
    sleep 100
    processKeyDown("``")
    processKeyUp("``")
    simulateKeyUp("space", 100)
    processKeyUp("altClick")
    sleep 100
    
    expected := setMousePositionToCaret()
    validateCaretOutput(A_ThisFunc, expected)
}

When_altClick_is_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_altClick_release_#1115()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    processKeyDown("altClick")
    sleep 1000
    processKeyUp("altClick")
    sleep 100
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_layout_key_is_pressed_followed_by_altClick_left_click_is_not_sent_on_altClick_release_#1116()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    processKeyDown("space")
    sleep 1000
    processKeyDown("altClick")
    processKeyUp("altClick")
    sleep 100
    processKeyUp("space")
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_non_modifier_key_is_pressed_followed_by_altClick_left_click_is_not_sent_on_altClick_release_#1117()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    simulateKeyDown("a", 100)
    expected := getCurrentCaretPosition()
    processKeyDown("altClick")
    sleep 100
    processKeyUp("altClick")
    simulateKeyUp("a", 100)
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_altClick_action_is_not_lbutton_and_mouse_is_moved_on_release_action_is_sent_instead_of_mouse_click_#1118()
{
	modifierDoubledAsClick["altClick"] := "c"
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
	setMousePositionToCaret()
    processKeyDown("altClick")
	sleep 50
    MouseMove startingPosition.x, startingPosition.y
    processKeyUp("altClick")
    sleep 100
    
    expected := "hello c"
    validateTestOutput(A_ThisFunc , expected)
	modifierDoubledAsClick["altClick"] := "lbutton"
}
