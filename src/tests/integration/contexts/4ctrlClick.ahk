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

When_ctrlClick_is_pressed_and_ctrl_key_is_pressed_and_released_click_is_sent_on_ctrlClick_release_#406()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    processKeyDown("ctrlClick")
    sleep 100
    simulateKeyDown("lctrl", 100)
    simulateKeyUp("lctrl", 100)
    processKeyUp("ctrlClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_ctrlClick_is_pressed_and_ctrl_key_is_pressed_click_is_sent_on_ctrlClick_release_#407()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    processKeyDown("ctrlClick")
    sleep 100
    simulateKeyDown("lctrl", 50)
    processKeyUp("ctrlClick")
    sleep 100
    simulateKeyUp("lctrl", 50)

    validateCaretOutput(A_ThisFunc, expected)
}

When_ctrlClick_is_pressed_and_alt_key_is_pressed_and_released_click_is_sent_on_ctrlClick_release_#408()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    processKeyDown("ctrlClick")
    sleep 100
    simulateKeyDown("lalt", 100)
    simulateKeyUp("lalt", 100)
    simulateKeyDown("lalt", 100)
    simulateKeyUp("lalt", 100)
    processKeyUp("ctrlClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_ctrlClick_is_pressed_and_alt_key_is_pressed_click_is_sent_on_ctrlClick_release_#409()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    processKeyDown("ctrlClick")
    sleep 100
    simulateKeyDown("lalt", 100)
    processKeyUp("ctrlClick")
    sleep 100
    simulateKeyUp("lalt", 100)

    validateCaretOutput(A_ThisFunc, expected)
}

When_ctrlClick_is_pressed_and_win_key_is_pressed_and_released_click_is_sent_on_ctrlClick_release_#410()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    processKeyDown("ctrlClick")
    sleep 100
    processKeyDown("lwin")
    sleep 50
    processKeyUp("lwin")
    sleep 200
    processKeyDown("lwin")
    sleep 100
    processKeyUp("lwin")
    sleep 400
    processKeyUp("ctrlClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_ctrlClick_is_pressed_and_win_key_is_pressed_click_is_sent_on_ctrlClick_release_#411()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    processKeyDown("ctrlClick")
    sleep 100
    processKeyDown("lwin")
    sleep 50
    
    processKeyUp("ctrlClick")
    sleep 100
    processKeyUp("lwin")
    sleep 200
    processKeyDown("lwin")
    sleep 100
    processKeyUp("lwin")
    sleep 500

    validateCaretOutput(A_ThisFunc, expected)
}

When_ctrlClick_is_pressed_and_shift_is_pressed_and_released_click_is_sent_on_ctrlClick_release_#412()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    processKeyDown("ctrlClick")
    sleep 100
    simulateKeyDown("shift", 100)
    simulateKeyUp("shift", 100)
    processKeyUp("ctrlClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_ctrlClick_is_pressed_and_shift_is_pressed_click_is_sent_on_ctrlClick_release_#413()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    processKeyDown("ctrlClick")
    sleep 100
    simulateKeyDown("shift", 100)
    processKeyUp("ctrlClick")
    sleep 100
    simulateKeyUp("shift", 100)

    validateCaretOutput(A_ThisFunc, expected)
}

When_ctrlClick_is_pressed_and_shift_key_is_pressed_and_layout_key_pressed_and_key_remapped_as_left_key_a_word_is_selected_#414()
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

When_ctrlClick_is_continously_pressed_and_layout_key_is_pressed_after_release_left_click_is_not_sent_#415()
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

When_ctrlClick_is_continously_pressed_and_mouse_is_moved_the_text_is_selected_#416()
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

When_ctrlClick_is_continously_pressed_and_mouse_is_moved_and_a_letter_is_typed_a_letter_is_not_sent_#417()
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

    expected := "hello"
    validateTestOutput(A_ThisFunc , expected)
}

When_ctrlClick_is_continously_pressed_and_mouse_is_moved_and_layout_key_is_pressed_space_is_not_sent_on_layout_key_release_#418()
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
    expected := "hello"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment()
}    

When_ctrlClick_pressed_and_mouse_is_moved_and_layout_key_is_pressed_longer_then_timeoutStillSendLayoutKey_space_is_not_sent_on_layout_key_release_#419()
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

When_non_modifier_letter_is_released_and_layout_key_continous_press_in_less_then_timeoutProcessLayoutOnRelease_and_ctrlClick_pressed_and_letter_key_alternative_mapped_as_left_key_pressed_and_released_caret_is_moved_#420()
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

When_non_modifier_letter_is_released_and_layout_key_continous_press_in_less_then_timeoutProcessLayoutOnRelease_and_ctrlClick_continous_press_and_letter_key_pressed_and_released_and_ctrlClick_released_left_click_is_not_sent_#421()
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

When_ctrlClick_is_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_ctrlClick_release_#422()
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

When_layout_key_is_pressed_followed_by_ctrlClick_left_click_is_not_sent_on_ctrlClick_release_#423()
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

When_non_modifier_key_is_pressed_followed_by_ctrlClick_left_click_is_not_sent_on_ctrlClick_release_#424()
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

When_ctrlClick_action_is_not_lbutton_and_mouse_is_moved_on_release_action_is_sent_instead_of_mouse_click_#425()
{
	modifierDoubledAsClick["ctrlClick"] := "c"
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
	setMousePositionToCaret()
    processKeyDown("ctrlClick")
	sleep 50
    MouseMove startingPosition.x, startingPosition.y
    processKeyUp("ctrlClick")
    sleep 100
    
    expected := "hello c"
    validateTestOutput(A_ThisFunc , expected)
	modifierDoubledAsClick["ctrlClick"] := "lbutton"
}

When_ctrl_is_pressed_and_ctrlClick_is_continously_pressed_and_mouse_is_moved_the_text_is_selected_#426()
{
    simulateKeyDown("lctrl", 100)
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    processKeyDown("ctrlClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    processKeyUp("ctrlClick")
    sleep 100
    simulateKeyUp("lctrl", 100)
    
    actual := getSelectedText()
    expected := "hello "
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment()
}

When_ctrlClick_is_continously_pressed_and_mouse_is_moved_and_ctrl_is_pressed_the_text_remains_selected_#427()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    processKeyDown("ctrlClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyDown("lctrl", 100)
    processKeyUp("ctrlClick")
    sleep 100
    simulateKeyUp("lctrl", 100)
    
    actual := getSelectedText()
    expected := "hello "
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment()
}

When_ctrlClick_is_continously_pressed_and_mouse_is_moved_and_ctrl_is_pressed_and_released_the_text_remains_selected_#428()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    processKeyDown("ctrlClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyDown("lctrl", 100)
    simulateKeyUp("lctrl", 100)
    processKeyUp("ctrlClick")
    sleep 100
    
    actual := getSelectedText()
    expected := "hello "
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment()
}