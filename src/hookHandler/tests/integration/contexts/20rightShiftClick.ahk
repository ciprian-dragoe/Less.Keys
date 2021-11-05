When_rightShiftClick_is_pressed_at_release_right_click_is_sent_#2001()
{
    simulateTyping("he")
    expected := setMousePositionToCaret()
    simulateTyping("llo")
    simulateKeyDown("rightShiftClick")
    sleep 100
    simulateKeyUp("rightShiftClick")
    sleep 100
    
    validateCaretOutput(A_ThisFunc, expected)    
}

When_rightShiftClick_is_continuously_pressed_and_layout_key_is_pressed_and_released_space_is_sent_#2002()
{
    simulateTyping("hello")
    simulateKeyDown("rightShiftClick")
    sleep 100
    simulateKeyDown("space", 200)
    simulateKeyUp("space", 200)
    simulateKeyUp("rightShiftClick")
    sleep 100

    expected := "hello "
    validateTestOutput(A_ThisFunc , expected)
}

When_rightShiftClick_is_continuously_pressed_and_backtick_is_pressed_keyboard_shortcut_is_sent_#2003()
{
    simulateTyping("hello ")
    simulateKeyDown("rightShiftClick")
    sleep 100
    simulateKeyDown("``", 100)
    simulateKeyUp("``", 100)
    simulateKeyUp("rightShiftClick")
    sleep 100
        
    actual := clearText()
    expected := "hello INTEGRATION_TEST"
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightShiftClick_is_continuously_pressed_and_backtick_is_pressed_right_click_is_not_sent_on_rightShiftClick_release_#2004()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo")
    simulateKeyDown("rightShiftClick")
    sleep 100
    simulateTyping("z")
    expected := getCurrentCaretPosition()
    simulateKeyUp("rightShiftClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)    
}

When_rightShiftClick_is_continuously_pressed_and_layout_key_is_pressed_and_backtick_is_sent_on_rightShiftClick_release_click_is_not_sent_#2005()
{
    simulateTyping("he")
    simulateTyping("llo ")
    simulateKeyDown("rightShiftClick")
    sleep 100
    simulateKeyDown("space", 50)
    simulateKeyDown("``", 50)
    simulateKeyUp("rightShiftClick")
    sleep 100
    simulateKeyUp("space", 50)
    simulateKeyUp("``", 50)
    expected := setMousePositionToCaret()

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightShiftClick_is_pressed_and_shift_key_is_pressed_and_released_click_is_sent_on_rightShiftClick_release_#2006()
{
    simulateTyping("he")
    expected := setMousePositionToCaret()
    simulateTyping("llo")
    simulateKeyDown("rightShiftClick")
    sleep 100
    simulateKeyDown("lshift")
    sleep 50
    simulateKeyUp("lshift")
    sleep 100
    simulateKeyUp("rightShiftClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightShiftClick_is_pressed_and_alt_key_is_pressed_click_is_sent_on_rightShiftClick_release_#2007()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    simulateKeyDown("rightShiftClick")
    sleep 100
    simulateKeyDown("lalt", 50)
    simulateKeyUp("rightShiftClick")
    sleep 100
    simulateKeyUp("lalt", 50)
    send {escape 2}

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightShiftClick_is_pressed_and_ctrl_key_is_pressed_and_released_click_is_sent_on_rightShiftClick_release_#2008()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    simulateKeyDown("rightShiftClick")
    sleep 100
    simulateKeyDown("lctrl", 100)
    simulateKeyUp("lctrl", 100)
    simulateKeyUp("rightShiftClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightShiftClick_is_pressed_and_ctrl_key_is_pressed_click_is_sent_on_rightShiftClick_release_#2009()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    simulateKeyDown("rightShiftClick")
    sleep 100
    simulateKeyDown("lctrl", 100)
    simulateKeyUp("rightShiftClick")
    sleep 100
    simulateKeyUp("lctrl", 100)

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightShiftClick_is_pressed_and_shift_key_is_pressed_and_released_click_is_sent_on_rightShiftClick_release_#2010()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    simulateKeyDown("rightShiftClick")
    sleep 100
    simulateKeyDown("lshift")
    sleep 50
    simulateKeyUp("lshift")
    sleep 100
    simulateKeyUp("rightShiftClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightShiftClick_is_pressed_and_shift_key_is_pressed_click_is_sent_on_rightShiftClick_release_#2011()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    simulateKeyDown("rightShiftClick")
    sleep 100
    simulateKeyDown("lshift", 50)
    sleep 50
    simulateKeyUp("rightShiftClick")
    sleep 100
    simulateKeyUp("lshift", 50)

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightShiftClick_is_pressed_and_shift_is_pressed_and_released_click_is_sent_on_rightShiftClick_release_#2012()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    simulateKeyDown("rightShiftClick")
    sleep 100
    simulateKeyDown("lshift", 100)
    simulateKeyUp("lshift", 100)
    simulateKeyUp("rightShiftClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightShiftClick_is_pressed_and_shift_is_pressed_click_is_sent_on_rightShiftClick_release_#2013()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    simulateKeyDown("rightShiftClick")
    sleep 100
    simulateKeyDown("lshift", 100)
    simulateKeyUp("rightShiftClick")
    sleep 100
    simulateKeyUp("lshift", 100)

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightShiftClick_is_pressed_and_shift_key_is_pressed_and_layout_key_pressed_and_backtick_pressed_keyboard_shortcut_is_sent_#2014()
{
    simulateTyping("hello")
    setMousePositionToCaret()
    simulateTyping(" world")
    simulateKeyDown("rightShiftClick")
    sleep 100
    simulateKeyDown("lshift", 50)
    simulateKeyDown("space", 50)
    simulateKeyDown("``", 50)
    simulateKeyUp("space", 50)
    simulateKeyUp("``", 50)
    simulateKeyUp("lshift", 50)
    simulateKeyUp("rightShiftClick")
    sleep 100
    actual := clearText()
    expected := "hello world INTEGRATION_TEST"
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}    

When_rightShiftClick_is_continuously_pressed_and_layout_key_is_pressed_after_release_right_click_is_not_sent_#2015()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo")
    simulateKeyDown("rightShiftClick")
    sleep 100
    simulateKeyDown("space", 50)
    simulateKeyUp("space", 50)
    expected := getCurrentCaretPosition()
    simulateKeyUp("rightShiftClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}    

When_rightShiftClick_is_continuously_pressed_and_mouse_is_moved_the_text_is_selected_#2016()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    simulateKeyDown("rightShiftClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyUp("rightShiftClick")
    sleep 100
    
    actual := getSelectedText()
    expected := "hello "
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightShiftClick_pressed_and_mouse_is_moved_and_layout_key_is_pressed_longer_then_timeoutStillSendLayoutKey_space_is_not_sent_on_layout_key_release_#2019()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    simulateKeyDown("rightShiftClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyDown("space", timeoutStillSendLayoutKey + 100)
    simulateKeyUp("space", 100)
    simulateKeyUp("rightShiftClick")
    sleep 100

    actual := clearText()
    expected := "hello "

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}    

When_non_modifier_letter_is_released_and_layout_key_continuous_press_in_less_then_timeoutProcessLayoutOnRelease_and_rightShiftClick_pressed_and_backtick_pressed_and_released_click_is_not_sent_#2020()
{
    simulateTyping("hello ")
    setMousePositionToCaret()
    simulateTyping("world")
    simulateKeyDown("space", 50)
    simulateKeyDown("rightShiftClick")
    sleep 50
    simulateKeyDown("``", 100)
    simulateKeyUp("``", 100)
    expected := getCurrentCaretPosition()
    simulateKeyUp("space", 100)
    simulateKeyUp("rightShiftClick")
    
    sleep 100
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_non_modifier_letter_is_released_and_layout_key_continuous_press_in_less_then_timeoutProcessLayoutOnRelease_and_rightShiftClick_continuous_press_and_backtick_pressed_and_rightShiftClick_released_right_click_is_not_sent_#2021()
{
    simulateTyping("hello ")
    setMousePositionToCaret()
    simulateTyping("world")
    simulateKeyDown("space", 50)
    simulateKeyDown("rightShiftClick")
    sleep 50
    simulateKeyDown("``", 100)
    simulateKeyUp("``", 100)
    simulateKeyUp("space", 100)
    simulateKeyUp("rightShiftClick")
    expected := getCurrentCaretPosition()
    
    sleep 100
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_rightShiftClick_is_pressed_more_then_timeoutStillSendLayoutKey_right_click_is_not_sent_on_rightShiftClick_release_#2022()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    simulateKeyDown("rightShiftClick")
    sleep timeoutStillSendLayoutKey
    sleep 100
    simulateKeyUp("rightShiftClick")
    sleep 100
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_rightShiftClick_action_is_not_lbutton_and_mouse_is_moved_on_release_action_is_sent_instead_of_mouse_click_#2025()
{
    modifierDoubledAsClick["rightShiftClick"] := "c"
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    simulateKeyDown("rightShiftClick")
    sleep 50
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyUp("rightShiftClick")
    sleep 100
    
    expected := "hello c"
    validateTestOutput(A_ThisFunc , expected)
    modifierDoubledAsClick["rightShiftClick"] := "lbutton"
}

When_shift_is_pressed_and_rightShiftClick_is_continuously_pressed_and_mouse_is_moved_the_text_is_selected_#2026()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    simulateKeyDown("lshift", 100)
    setMousePositionToCaret()
    simulateKeyDown("rightShiftClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyUp("rightShiftClick")
    sleep 100
    simulateKeyUp("lshift", 100)
    sleep 300
    
    actual := getSelectedText()
    expected := "hello "
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightShiftClick_is_continuously_pressed_and_mouse_is_moved_and_ctrl_is_pressed_the_text_remains_selected_#2027()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    simulateKeyDown("rightShiftClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyDown("lctrl", 100)
    simulateKeyUp("rightShiftClick")
    sleep 100
    simulateKeyUp("lctrl", 100)
    
    actual := getSelectedText()
    expected := "hello "
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightShiftClick_is_continuously_pressed_and_mouse_is_moved_and_shift_is_pressed_and_released_the_text_remains_selected_#2028()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    simulateKeyDown("rightShiftClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyDown("lshift", 100)
    simulateKeyUp("lshift", 300)
    simulateKeyDown("lshift", 100)
    simulateKeyUp("lshift", 300)
    simulateKeyUp("rightShiftClick")
    sleep 100

    actual := getSelectedText()
    expected := "hello "

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightShiftClick_is_pressed_and_a_letter_pressed_and_released_and_shift_pressed_and_rightShiftClick_released_and_a_letter_pressed_then_caps_a_letter_is_sent_#2029()
{
    simulateKeyDown("rightShiftClick")
    sleep 100
    simulateTyping("a")
    simulateKeyDown("lshift", 100)
    simulateKeyUp("rightShiftClick")
    sleep 100
    simulateTyping("a")
    simulateKeyUp("lshift", 100)
    expected := "AA"
    validateTestOutput(A_ThisFunc , expected)
}

