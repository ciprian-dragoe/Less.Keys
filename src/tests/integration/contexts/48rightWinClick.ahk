When_rightWinClick_is_pressed_at_release_left_click_is_sent_#4801()
{
    simulateTyping("he")
    `expected := setMousePositionToCaret()`
    simulateTyping("llo")
    processKeyDown("rightWinClick")
    sleep 100
    processKeyUp("rightWinClick")
    sleep 100
    
    validateCaretOutput(A_ThisFunc, expected)    
}

When_rightWinClick_is_continuously_pressed_and_layout_key_is_pressed_and_released_space_is_sent_#4802()
{
    simulateTyping("hello")
    processKeyDown("rightWinClick")
    sleep 100
    simulateKeyDown("space", 200)
    simulateKeyUp("space", 200)
    processKeyUp("rightWinClick")
    sleep 100
    send {escape 2}

    expected := "hello"
    validateTestOutput(A_ThisFunc , expected)
}

When_rightWinClick_is_continuously_pressed_and_backtick_is_pressed_keyboard_shortcut_is_sent_#4803()
{
    simulateTyping("hello ")
    processKeyDown("rightWinClick")
    sleep 100
    simulateKeyDown("``", 100)
    simulateKeyUp("``", 100)
    processKeyUp("rightWinClick")
    sleep 100
        
    actual := clearText()
    expected := "hello INTEGRATION_TEST"
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightWinClick_is_continuously_pressed_and_backtick_is_pressed_left_click_is_not_sent_on_rightWinClick_release_#4804()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo")
    expected := getCurrentCaretPosition()
    processKeyDown("rightWinClick")
    sleep 100
    simulateTyping("z")
    processKeyUp("rightWinClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)    
}

When_rightWinClick_is_continuously_pressed_and_layout_key_is_pressed_and_backtick_is_sent_on_rightWinClick_release_click_is_not_sent_#4805()
{
    simulateTyping("he")
    simulateTyping("llo ")
    processKeyDown("rightWinClick")
    sleep 100
    simulateKeyDown("space", 50)
    simulateKeyDown("``", 50)
    processKeyUp("rightWinClick")
    sleep 100
    simulateKeyUp("space", 50)
    simulateKeyUp("``", 50)
    expected := setMousePositionToCaret()

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightWinClick_is_pressed_and_win_key_is_pressed_and_released_click_is_sent_on_rightWinClick_release_#4806()
{
    timerTimeoutStickyKeys := 3000
    simulateTyping("he")
    expected := setMousePositionToCaret()
    simulateTyping("llo")
    processKeyDown("rightWinClick")
    sleep 100
    processKeyDown("lwin")
    sleep 50
    processKeyUp("lwin")
    sleep 700
    processKeyDown("lwin")
    sleep 100
    processKeyUp("lwin")
    sleep 700
    processKeyUp("rightWinClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightWinClick_is_pressed_and_alt_key_is_pressed_click_is_sent_on_rightWinClick_release_#4807()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    processKeyDown("rightWinClick")
    sleep 100
    simulateKeyDown("lalt", 50)
    processKeyUp("rightWinClick")
    sleep 100
    simulateKeyUp("lalt", 50)
    send {escape 2}

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightWinClick_is_pressed_and_ctrl_key_is_pressed_and_released_click_is_sent_on_rightWinClick_release_#4808()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    processKeyDown("rightWinClick")
    sleep 100
    simulateKeyDown("lctrl", 100)
    simulateKeyUp("lctrl", 100)
    processKeyUp("rightWinClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightWinClick_is_pressed_and_ctrl_key_is_pressed_click_is_sent_on_rightWinClick_release_#4809()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    processKeyDown("rightWinClick")
    sleep 100
    simulateKeyDown("lctrl", 100)
    processKeyUp("rightWinClick")
    sleep 100
    simulateKeyUp("lctrl", 100)

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightWinClick_is_pressed_and_win_key_is_pressed_and_released_click_is_sent_on_rightWinClick_release_#4810()
{
    timerTimeoutStickyKeys := 3000
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    processKeyDown("rightWinClick")
    sleep 100
    processKeyDown("lwin")
    sleep 50
    processKeyUp("lwin")
    sleep 700
    processKeyDown("lwin")
    sleep 100
    processKeyUp("lwin")
    sleep 700
    processKeyUp("rightWinClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightWinClick_is_pressed_and_win_key_is_pressed_click_is_sent_on_rightWinClick_release_#4811()
{
    timerTimeoutStickyKeys := 3000
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    processKeyDown("rightWinClick")
    sleep 100
    processKeyDown("lwin")
    sleep 50
    
    processKeyUp("rightWinClick")
    sleep 100
    processKeyUp("lwin")
    sleep 700
    processKeyDown("lwin")
    sleep 100
    processKeyUp("lwin")
    sleep 700

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightWinClick_is_pressed_and_shift_is_pressed_and_released_click_is_sent_on_rightWinClick_release_#4812()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    processKeyDown("rightWinClick")
    sleep 100
    simulateKeyDown("lshift", 100)
    simulateKeyUp("lshift", 100)
    processKeyUp("rightWinClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightWinClick_is_pressed_and_shift_is_pressed_click_is_sent_on_rightWinClick_release_#4813()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    processKeyDown("rightWinClick")
    sleep 100
    simulateKeyDown("lshift", 100)
    processKeyUp("rightWinClick")
    sleep 100
    simulateKeyUp("lshift", 100)

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightWinClick_is_pressed_and_shift_key_is_pressed_and_layout_key_pressed_and_backtick_pressed_keyboard_shortcut_is_sent_#4814()
{
    simulateTyping("hello")
    setMousePositionToCaret()
    simulateTyping(" world")
    processKeyDown("rightWinClick")
    sleep 100
    simulateKeyDown("lshift", 50)
    simulateKeyDown("space", 50)
    simulateKeyDown("``", 50)
    simulateKeyUp("space", 50)
    simulateKeyUp("``", 50)
    simulateKeyUp("lshift", 50)
    processKeyUp("rightWinClick")
    sleep 100
    actual := clearText()
    expected := "hello worldINTEGRATION_TEST"
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}    

When_rightWinClick_is_continuously_pressed_and_layout_key_is_pressed_after_release_left_click_is_not_sent_#4815()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo")
    processKeyDown("rightWinClick")
    sleep 100
    simulateKeyDown("space", 50)
    simulateKeyUp("space", 50)
    expected := getCurrentCaretPosition()
    processKeyUp("rightWinClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}    

When_rightWinClick_is_continuously_pressed_and_mouse_is_moved_the_text_is_selected_#4816()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    processKeyDown("rightWinClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    processKeyUp("rightWinClick")
    sleep 100
    
    actual := getSelectedText()
    expected := "hello "
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_non_modifier_letter_is_released_and_layout_key_continuous_press_in_less_then_timeoutProcessLayoutOnRelease_and_rightWinClick_pressed_and_backtick_pressed_and_released_click_is_not_sent_#4820()
{
    simulateTyping("hello ")
    setMousePositionToCaret()
    simulateTyping("world")
    simulateKeyDown("space", 50)
    processKeyDown("rightWinClick")
    sleep 50
    simulateKeyDown("``", 100)
    simulateKeyUp("``", 100)
    expected := getCurrentCaretPosition()
    simulateKeyUp("space", 100)
    processKeyUp("rightWinClick")
    
    sleep 100
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_non_modifier_letter_is_released_and_layout_key_continuous_press_in_less_then_timeoutProcessLayoutOnRelease_and_rightWinClick_continous_press_and_backtick_pressed_and_rightWinClick_released_left_click_is_not_sent_#4821()
{
    simulateTyping("hello ")
    setMousePositionToCaret()
    simulateTyping("world")
    simulateKeyDown("space", 50)
    processKeyDown("rightWinClick")
    sleep 50
    simulateKeyDown("``", 100)
    simulateKeyUp("``", 100)
    simulateKeyUp("space", 100)
    processKeyUp("rightWinClick")
    expected := getCurrentCaretPosition()
    
    sleep 100
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_rightWinClick_is_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_rightWinClick_release_#4822()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    processKeyDown("rightWinClick")
    sleep timeoutStillSendLayoutKey
    sleep 100
    processKeyUp("rightWinClick")
    sleep 100
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_rightWinClick_action_is_not_lbutton_and_mouse_is_moved_on_release_action_is_sent_instead_of_mouse_click_#4825()
{
    modifierDoubledAsClick["rightWinClick"] := "c"
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    processKeyDown("rightWinClick")
    sleep 50
    MouseMove startingPosition.x, startingPosition.y
    processKeyUp("rightWinClick")
    sleep 100
    
    expected := "hello c"
    validateTestOutput(A_ThisFunc , expected)
    modifierDoubledAsClick["rightWinClick"] := "lbutton"
}

When_win_is_pressed_and_rightWinClick_is_continuously_pressed_and_mouse_is_moved_the_text_is_selected_#4826()
{
    timerTimeoutStickyKeys := 3000
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    simulateKeyDown("lwin", 100)
    setMousePositionToCaret()
    processKeyDown("rightWinClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    processKeyUp("rightWinClick")
    sleep 100
    simulateKeyUp("lwin", 700)
    send {escape 2}
    sleep 300
    
    actual := getSelectedText()
    expected := "hello "
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightWinClick_is_continuously_pressed_and_mouse_is_moved_and_ctrl_is_pressed_the_text_remains_selected_#4827()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    processKeyDown("rightWinClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyDown("lctrl", 100)
    processKeyUp("rightWinClick")
    sleep 100
    simulateKeyUp("lctrl", 100)
    
    actual := getSelectedText()
    expected := "hello "
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}