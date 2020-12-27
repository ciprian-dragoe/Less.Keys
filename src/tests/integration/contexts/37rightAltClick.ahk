When_rightAltClick_is_pressed_at_release_left_click_is_sent_#3701()
{
    simulateTyping("he")
    expected := setMousePositionToCaret()
    simulateTyping("llo")
    processKeyDown("rightAltClick")
    sleep 100
    processKeyUp("rightAltClick")
    sleep 100
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_rightAltClick_is_continuously_pressed_and_layout_key_is_pressed_and_released_space_is_sent_#3702()
{
    simulateTyping("hello")
    processKeyDown("rightAltClick")
    sleep 100
    simulateKeyDown("space", 200)
    simulateKeyUp("space", 200)
    processKeyUp("rightAltClick")
    sleep 100
    send {escape 2}

    expected := "hello"
    validateTestOutput(A_ThisFunc , expected)
}

When_rightAltClick_is_continuously_pressed_and_backtick_is_pressed_keyboard_shortcut_is_sent_#3703()
{
    simulateTyping("hello ")
    processKeyDown("rightAltClick")
    sleep 100
    simulateKeyDown("``", 100)
    simulateKeyUp("``", 100)
    processKeyUp("rightAltClick")
    sleep 100
        
    actual := clearText()
    expected := "hello INTEGRATION_TEST"
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightAltClick_is_continuously_pressed_and_backtick_is_pressed_left_click_is_not_sent_on_rightAltClick_release_#3704()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo")
    expected := getCurrentCaretPosition()
    processKeyDown("rightAltClick")
    sleep 100
    simulateTyping("a")
    processKeyUp("rightAltClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)    
}

When_rightAltClick_is_continuously_pressed_and_layout_key_is_pressed_and_backtick_is_sent_on_rightAltClick_release_click_is_not_sent_#3705()
{
    simulateTyping("he")
    simulateTyping("llo ")
    processKeyDown("rightAltClick")
    sleep 100
    simulateKeyDown("space", 50)
    simulateKeyDown("``", 50)
    processKeyUp("rightAltClick")
    sleep 100
    simulateKeyUp("space", 50)
    simulateKeyUp("``", 50)
    expected := setMousePositionToCaret()

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightAltClick_is_pressed_and_alt_key_is_pressed_and_released_click_is_sent_on_rightAltClick_release_#3706()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    processKeyDown("rightAltClick")
    sleep 100
    simulateKeyDown("lalt", 100)
    simulateKeyUp("lalt", 100)
    processKeyUp("rightAltClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightAltClick_is_pressed_and_alt_key_is_pressed_click_is_sent_on_rightAltClick_release_#3707()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    processKeyDown("rightAltClick")
    sleep 100
    simulateKeyDown("lalt", 50)
    processKeyUp("rightAltClick")
    sleep 100
    simulateKeyUp("lalt", 50)

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightAltClick_is_pressed_and_ctrl_key_is_pressed_and_released_click_is_sent_on_rightAltClick_release_#3708()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    processKeyDown("rightAltClick")
    sleep 100
    simulateKeyDown("lctrl", 100)
    simulateKeyUp("lctrl", 100)
    processKeyUp("rightAltClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightAltClick_is_pressed_and_ctrl_key_is_pressed_click_is_sent_on_rightAltClick_release_#3709()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    processKeyDown("rightAltClick")
    sleep 100
    simulateKeyDown("lctrl", 100)
    processKeyUp("rightAltClick")
    sleep 100
    simulateKeyUp("lctrl", 100)

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightAltClick_is_pressed_and_win_key_is_pressed_and_released_click_is_sent_on_rightAltClick_release_#3710()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    processKeyDown("rightAltClick")
    sleep 100
    processKeyDown("lwin")
    sleep 50
    processKeyUp("lwin")
    sleep 400
    processKeyDown("lwin")
    sleep 100
    processKeyUp("lwin")
    sleep 400
    processKeyUp("rightAltClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightAltClick_is_pressed_and_win_key_is_pressed_click_is_sent_on_rightAltClick_release_#3711()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    processKeyDown("rightAltClick")
    sleep 100
    processKeyDown("lwin")
    sleep 50
    
    processKeyUp("rightAltClick")
    sleep 100
    processKeyUp("lwin")
    sleep 200
    processKeyDown("lwin")
    sleep 100
    processKeyUp("lwin")
    sleep 500

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightAltClick_is_pressed_and_shift_is_pressed_and_released_click_is_sent_on_rightAltClick_release_#3712()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    processKeyDown("rightAltClick")
    sleep 100
    simulateKeyDown("lshift", 100)
    simulateKeyUp("lshift", 100)
    processKeyUp("rightAltClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightAltClick_is_pressed_and_shift_is_pressed_click_is_sent_on_rightAltClick_release_#3713()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    processKeyDown("rightAltClick")
    sleep 100
    simulateKeyDown("lshift", 100)
    processKeyUp("rightAltClick")
    sleep 100
    simulateKeyUp("lshift", 100)

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightAltClick_is_pressed_and_shift_key_is_pressed_and_layout_key_pressed_and_backtick_pressed_keyboard_shortcut_is_sent_#3714()
{
    simulateTyping("hello")
    setMousePositionToCaret()
    simulateTyping(" world")
    processKeyDown("rightAltClick")
    sleep 100
    simulateKeyDown("lshift", 50)
    simulateKeyDown("space", 50)
    simulateKeyDown("``", 50)
    simulateKeyUp("space", 50)
    simulateKeyUp("``", 50)
    simulateKeyUp("lshift", 50)
    processKeyUp("rightAltClick")
    sleep 100
    actual := clearText()
    expected := "hello worldINTEGRATION_TEST"
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}    

When_rightAltClick_is_continuously_pressed_and_layout_key_is_pressed_after_release_left_click_is_not_sent_#3715()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo")
    processKeyDown("rightAltClick")
    sleep 100
    simulateKeyDown("space", 50)
    simulateKeyUp("space", 50)
    expected := getCurrentCaretPosition()
    processKeyUp("rightAltClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}    

When_rightAltClick_is_continuously_pressed_and_mouse_is_moved_the_text_is_selected_#3716()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    processKeyDown("rightAltClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    processKeyUp("rightAltClick")
    sleep 100
    
    actual := getSelectedText()
    expected := "hello "
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightAltClick_is_continuously_pressed_and_mouse_is_moved_and_a_letter_is_typed_a_letter_is_not_sent_#3717()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello")
    setMousePositionToCaret()
    processKeyDown("rightAltClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateTyping("z")
    processKeyUp("rightAltClick")
    sleep 100

    expected := "hello"
    validateTestOutput(A_ThisFunc , expected)
}

When_rightAltClick_is_continuously_pressed_and_mouse_is_moved_and_layout_key_is_pressed_space_is_not_sent_on_layout_key_release_#3718()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello")
    setMousePositionToCaret()
    processKeyDown("rightAltClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateTyping(" ")
    processKeyUp("rightAltClick")
    sleep 100
    send {escape 2}
    sleep 100

    actual := clearText()
    expected := "hello"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}    

When_rightAltClick_pressed_and_mouse_is_moved_and_layout_key_is_pressed_longer_then_timeoutStillSendLayoutKey_space_is_not_sent_on_layout_key_release_#3719()
{
    default := timerTimeoutStickyKeys
    timerTimeoutStickyKeys := 2000
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    processKeyDown("rightAltClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyDown("space", timeoutStillSendLayoutKey + 100)
    simulateKeyUp("space", 100)
    processKeyUp("rightAltClick")

    sleep 100

    actual := clearText()
    expected := "hello "

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
    timerTimeoutStickyKeys := default
}    

When_non_modifier_letter_is_released_and_layout_key_continuous_press_in_less_then_timeoutProcessLayoutOnRelease_and_rightAltClick_pressed_and_backtick_pressed_and_released_click_is_not_sent_#3720()
{
    simulateTyping("hello ")
    setMousePositionToCaret()
    simulateTyping("world")
    simulateKeyDown("space", 50)
    processKeyDown("rightAltClick")
    sleep 50
    simulateKeyDown("``", 100)
    simulateKeyUp("``", 100)
    expected := getCurrentCaretPosition()
    simulateKeyUp("space", 100)
    processKeyUp("rightAltClick")
    
    sleep 100
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_non_modifier_letter_is_released_and_layout_key_continuous_press_in_less_then_timeoutProcessLayoutOnRelease_and_rightAltClick_continuous_press_and_backtick_pressed_and_rightAltClick_released_left_click_is_not_sent_#3721()
{
    simulateTyping("hello ")
    setMousePositionToCaret()
    simulateTyping("world")
    simulateKeyDown("space", 50)
    processKeyDown("rightAltClick")
    sleep 50
    simulateKeyDown("``", 100)
    simulateKeyUp("``", 100)
    simulateKeyUp("space", 100)
    processKeyUp("rightAltClick")
    expected := getCurrentCaretPosition()
    
    sleep 100
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_rightAltClick_is_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_rightAltClick_release_#3722()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    processKeyDown("rightAltClick")
    sleep timeoutStillSendLayoutKey
    sleep 100
    processKeyUp("rightAltClick")
    sleep 100
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_layout_key_is_pressed_followed_by_rightAltClick_left_click_is_not_sent_on_rightAltClick_release_#3723()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    processKeyDown("left")
    sleep 100
    processKeyUp("left")
    sleep 100
    processKeyDown("space")
    sleep 100
    processKeyDown("rightAltClick")
    sleep 100
    processKeyUp("rightAltClick")
    sleep 100
    processKeyUp("space")
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_non_modifier_key_is_pressed_followed_by_rightAltClick_left_click_is_not_sent_on_rightAltClick_release_#3724()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    simulateKeyDown("a", 100)
    expected := getCurrentCaretPosition()
    processKeyDown("rightAltClick")
    sleep 100
    processKeyUp("rightAltClick")
    simulateKeyUp("a", 100)
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_rightAltClick_action_is_not_lbutton_and_mouse_is_moved_on_release_action_is_sent_instead_of_mouse_click_#3725()
{
	modifierDoubledAsClick["rightAltClick"] := "c"
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
	setMousePositionToCaret()
    processKeyDown("rightAltClick")
	sleep 50
    MouseMove startingPosition.x, startingPosition.y
    processKeyUp("rightAltClick")
    sleep 100
    
    expected := "hello c"
    validateTestOutput(A_ThisFunc , expected)
	modifierDoubledAsClick["rightAltClick"] := "lbutton"
}

When_alt_is_pressed_and_rightAltClick_is_continuously_pressed_and_mouse_is_moved_the_text_is_selected_#3726()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    simulateKeyDown("lalt", 100)
    setMousePositionToCaret()
    processKeyDown("rightAltClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    processKeyUp("rightAltClick")
    sleep 100
    simulateKeyUp("lalt", 100)
    
    actual := getSelectedText()
    expected := "hello "
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightAltClick_is_continuously_pressed_and_mouse_is_moved_and_ctrl_is_pressed_the_text_remains_selected_#3727()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    processKeyDown("rightAltClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyDown("lctrl", 100)
    processKeyUp("rightAltClick")
    sleep 100
    simulateKeyUp("lctrl", 100)
    
    actual := getSelectedText()
    expected := "hello "
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightAltClick_is_continuously_pressed_and_mouse_is_moved_and_alt_is_pressed_and_released_the_text_remains_selected_#3728()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    processKeyDown("rightAltClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyDown("lalt", 100)
    simulateKeyUp("lalt", 100)
    processKeyUp("rightAltClick")
    sleep 100
    
    actual := getSelectedText()
    expected := "hello "
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}