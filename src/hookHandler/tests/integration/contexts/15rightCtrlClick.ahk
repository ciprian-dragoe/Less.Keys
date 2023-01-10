When_rightCtrlClick_is_pressed_at_release_left_click_is_sent_#1501()
{
    simulateTyping("he")
    expected := setMousePositionToCaret()
    simulateTyping("llo")
    simulateKeyDown("rightCtrlClick")
    sleep 100
    simulateKeyUp("rightCtrlClick")
    sleep 100
    
    validateCaretOutput(A_ThisFunc, expected)    
}

When_rightCtrlClick_is_continuously_pressed_and_layout_key_is_pressed_and_released_space_is_sent_#1502()
{
    simulateTyping("hello")
    simulateKeyDown("rightCtrlClick")
    sleep 100
    simulateKeyDown("space", 100)
    simulateKeyUp("space", 50)
    simulateKeyUp("rightCtrlClick")
    sleep 100
        
    expected := "hello"
    validateTestOutput(A_ThisFunc , expected)
}

When_rightCtrlClick_is_continuously_pressed_and_a_letter_is_pressed_all_text_is_selected_#1503()
{
    simulateTyping("hello ")
    simulateKeyDown("rightCtrlClick")
    sleep 100
    simulateTyping("a")
    simulateKeyUp("rightCtrlClick")
    sleep 100

    actual := getSelectedText()
    expected := "hello "
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightCtrlClick_is_continuously_pressed_and_a_key_is_pressed_left_click_is_not_sent_on_rightCtrlClick_release_#1504()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo")
    expected := getCurrentCaretPosition()
    simulateKeyDown("rightCtrlClick")
    sleep 100
    simulateTyping("a")
    simulateKeyUp("rightCtrlClick")
    sleep 100

    validateCaretOutputDiffers(A_ThisFunc, expected)    
}

When_rightCtrlClick_is_continuously_pressed_and_layout_key_is_pressed_and_key_remapped_as_right_is_sent_on_rightCtrlClick_release_click_is_not_sent_#1505()
{
    expected := setMousePositionToCaret()
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo ")
    simulateKeyDown("rightCtrlClick")
    sleep 100
    simulateKeyDown("space", 50)
    simulateKeyDown("a", 50)
    simulateKeyUp("rightCtrlClick")
    sleep 100
    simulateKeyUp("space", 50)
    simulateKeyUp("a", 50)

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightCtrlClick_is_pressed_and_ctrl_key_is_pressed_and_released_click_is_sent_on_rightCtrlClick_release_#1506()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    simulateKeyDown("rightCtrlClick")
    sleep 100
    simulateKeyDown("lctrl", 100)
    simulateKeyUp("lctrl", 100)
    simulateKeyUp("rightCtrlClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightCtrlClick_is_pressed_and_ctrl_key_is_pressed_click_is_sent_on_rightCtrlClick_release_#1507()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    simulateKeyDown("rightCtrlClick")
    sleep 100
    simulateKeyDown("lctrl", 50)
    simulateKeyUp("rightCtrlClick")
    sleep 100
    simulateKeyUp("lctrl", 50)

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightCtrlClick_is_pressed_and_alt_key_is_pressed_and_released_click_is_sent_on_rightCtrlClick_release_#1508()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    simulateKeyDown("rightCtrlClick")
    sleep 100
    simulateKeyDown("lalt", 100)
    simulateKeyUp("lalt", 100)
    simulateKeyDown("lalt", 100)
    simulateKeyUp("lalt", 100)
    simulateKeyUp("rightCtrlClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightCtrlClick_is_pressed_and_alt_key_is_pressed_click_is_sent_on_rightCtrlClick_release_#1509()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    simulateKeyDown("rightCtrlClick")
    sleep 100
    simulateKeyDown("lalt", 100)
    simulateKeyUp("rightCtrlClick")
    sleep 100
    simulateKeyUp("lalt", 100)

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightCtrlClick_is_pressed_and_win_key_is_pressed_and_released_click_is_sent_on_rightCtrlClick_release_#1510()
{
    timerTimeoutStickyKeys := 3000
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    simulateKeyDown("rightCtrlClick")
    sleep 100
    simulateKeyDown("lwin")
    sleep 50
    simulateKeyUp("lwin")
    sleep 700
    simulateKeyDown("lwin")
    sleep 100
    simulateKeyUp("lwin")
    sleep 700
    simulateKeyUp("rightCtrlClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightCtrlClick_is_pressed_and_shift_is_pressed_and_released_click_is_sent_on_rightCtrlClick_release_#1512()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    simulateKeyDown("rightCtrlClick")
    sleep 100
    simulateKeyDown("lshift", 100)
    simulateKeyUp("lshift", 100)
    simulateKeyUp("rightCtrlClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightCtrlClick_is_pressed_and_shift_is_pressed_click_is_sent_on_rightCtrlClick_release_#1513()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    simulateKeyDown("rightCtrlClick")
    sleep 100
    simulateKeyDown("lshift", 100)
    simulateKeyUp("rightCtrlClick")
    sleep 100
    simulateKeyUp("lshift", 100)

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightCtrlClick_is_pressed_and_shift_key_is_pressed_and_layout_key_pressed_and_key_remapped_as_right_key_a_word_is_selected_#1514()
{
    simulateTyping("hello")
    setMousePositionToCaret()
    simulateTyping(" world")
    simulateKeyDown("rightCtrlClick")
    sleep 100
    simulateKeyDown("lshift", 50)
    simulateKeyDown("space", 50)
    simulateKeyDown("a", 50)
    simulateKeyUp("a", 50)
    simulateKeyUp("space", 50)
    simulateKeyUp("lshift", 50)
    simulateKeyUp("rightCtrlClick")
    sleep 100
    actual := getSelectedText()
    expected := "world"
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}    

When_rightCtrlClick_is_continuously_pressed_and_layout_key_is_pressed_after_release_left_click_is_not_sent_#1515()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo")
    simulateKeyDown("rightCtrlClick")
    sleep 100
    simulateKeyDown("space", 50)
    simulateKeyUp("space", 50)
    expected := getCurrentCaretPosition()
    simulateKeyUp("rightCtrlClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}    

When_rightCtrlClick_is_continuously_pressed_and_mouse_is_moved_the_text_is_selected_#1516()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    simulateKeyDown("rightCtrlClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyUp("rightCtrlClick")
    sleep 100
    actual := getSelectedText()
    expected := "hello "
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightCtrlClick_pressed_and_mouse_is_moved_and_layout_key_is_pressed_longer_then_timeoutStillSendLayoutKey_space_is_not_sent_on_layout_key_release_#1519()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    simulateKeyDown("rightCtrlClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyDown("space", timeoutStillSendLayoutKey + 100)
    simulateKeyUp("space", 100)
    simulateKeyUp("rightCtrlClick")
    sleep 100

    actual := clearText()
    expected := "hello "

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}    

When_non_modifier_letter_is_released_and_layout_key_press_in_less_then_timeoutProcessLayoutOnRelease_and_rightCtrlClick_pressed_and_letter_key_alternative_mapped_as_right_key_pressed_and_released_caret_is_moved_#1520()
{
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    simulateTyping("world")
    simulateKeyDown("space", 50)
    simulateKeyDown("rightCtrlClick")
    sleep 50
    simulateTyping("a")
    simulateKeyUp("space", 100)
    simulateKeyUp("rightCtrlClick")
    sleep 100
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_non_modifier_letter_is_released_and_layout_key_press_in_less_then_timeoutProcessLayoutOnRelease_and_rightCtrlClick_press_and_letter_key_pressed_and_released_and_rightCtrlClick_released_left_click_is_not_sent_#1521()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    simulateTyping("world")
    simulateKeyDown("space", 50)
    simulateKeyDown("rightCtrlClick")
    sleep 50
    simulateTyping("a")
    simulateKeyUp("space", 100)
    simulateKeyUp("rightCtrlClick")
    sleep 100
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_rightCtrlClick_is_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_rightCtrlClick_release_#1522()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    simulateKeyDown("rightCtrlClick")
    sleep timeoutStillSendLayoutKey
    sleep 100
    simulateKeyUp("rightCtrlClick")
    sleep 100
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_rightCtrlClick_action_is_not_lbutton_and_mouse_is_moved_on_release_action_is_sent_instead_of_mouse_click_#1525()
{
    modifierDoubledAsClick["rightCtrlClick"] := "c"
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    simulateKeyDown("rightCtrlClick")
    sleep 50
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyUp("rightCtrlClick")
    sleep 100
    
    expected := "hello c"
    validateTestOutput(A_ThisFunc , expected)
    modifierDoubledAsClick["rightCtrlClick"] := "lbutton"
}

When_ctrl_is_pressed_and_rightCtrlClick_is_continuously_pressed_and_mouse_is_moved_the_text_is_selected_#1526()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    simulateKeyDown("lctrl", 100)
    setMousePositionToCaret()
    simulateKeyDown("rightCtrlClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyUp("rightCtrlClick")
    sleep 100
    simulateKeyUp("lctrl", 100)
    
    actual := getSelectedText()
    expected := "hello "
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightCtrlClick_is_continuously_pressed_and_mouse_is_moved_and_ctrl_is_pressed_the_text_remains_selected_#1527()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    simulateKeyDown("rightCtrlClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyDown("lctrl", 100)
    simulateKeyUp("rightCtrlClick")
    sleep 100
    simulateKeyUp("lctrl", 100)
    
    actual := getSelectedText()
    expected := "hello "
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightCtrlClick_is_continuously_pressed_and_mouse_is_moved_and_ctrl_is_pressed_and_released_the_text_remains_selected_#1528()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    simulateKeyDown("rightCtrlClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyDown("lctrl", 100)
    simulateKeyUp("lctrl", 100)
    simulateKeyUp("rightCtrlClick")
    sleep 100
    actual := getSelectedText()
    expected := "hello "
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightCtrlClick_is_pressed_and_backspace_pressed_and_released_and_ctrl_pressed_and_rightCtrlClick_released_and_backspace_pressed_then_ctrl_and_backspace_is_sent_#1529()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello world again")
    simulateKeyDown("rightCtrlClick")
    sleep 100
    simulateKeyDown("backspace", 100)
    simulateKeyUp("backspace", 100)
    simulateKeyDown("lctrl", 100)
    simulateKeyUp("rightCtrlClick")
    sleep 100
    simulateKeyDown("backspace", 100)
    simulateKeyUp("backspace", 100)

    sleep 100
    simulateKeyUp("lctrl", 100)
    expected := "hello "
    validateTestOutput(A_ThisFunc , expected)
    setDefaultTestEnvironment(A_ThisFunc)
}
