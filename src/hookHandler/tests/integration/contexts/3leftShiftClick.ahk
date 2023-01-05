When_leftShiftClick_is_pressed_at_release_left_click_is_sent_#301()
{
    simulateTyping("he")
    expected := setMousePositionToCaret()
    simulateTyping("llo")
    simulateKeyDown("leftShiftClick")
    sleep 100
    simulateKeyUp("leftShiftClick")
    sleep 100
    
    validateCaretOutput(A_ThisFunc, expected)    
}

When_leftShiftClick_is_continuously_pressed_and_layout_key_is_pressed_and_released_space_is_sent_#302()
{
    simulateTyping("hello")
    simulateKeyDown("leftShiftClick")
    sleep 100
    simulateKeyDown("space", 200)
    simulateKeyUp("space", 200)
    simulateKeyUp("leftShiftClick")
    sleep 100

    expected := "hello "
    validateTestOutput(A_ThisFunc , expected)
}

When_leftShiftClick_is_continuously_pressed_and_backtick_is_pressed_keyboard_shortcut_is_sent_#303()
{
    simulateTyping("hello ")
    simulateKeyDown("leftShiftClick")
    sleep 100
    simulateKeyDown("``", 100)
    simulateKeyUp("``", 100)
    simulateKeyUp("leftShiftClick")
    sleep 100
        
    actual := clearText()
    expected := "hello INTEGRATION_TEST"
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftShiftClick_is_continuously_pressed_and_backtick_is_pressed_left_click_is_not_sent_on_leftShiftClick_release_#304()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo")
    simulateKeyDown("leftShiftClick")
    sleep 100
    simulateTyping("z")
    expected := getCurrentCaretPosition()
    simulateKeyUp("leftShiftClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)    
}

When_leftShiftClick_is_continuously_pressed_and_layout_key_is_pressed_and_backtick_is_sent_on_leftShiftClick_release_click_is_not_sent_#305()
{
    simulateTyping("he")
    simulateTyping("llo ")
    simulateKeyDown("leftShiftClick")
    sleep 100
    simulateKeyDown("space", 50)
    simulateKeyDown("``", 50)
    simulateKeyUp("leftShiftClick")
    sleep 100
    simulateKeyUp("space", 50)
    simulateKeyUp("``", 50)
    expected := setMousePositionToCaret()

    validateCaretOutput(A_ThisFunc, expected)
}

When_leftShiftClick_is_pressed_and_shift_key_is_pressed_and_released_click_is_sent_on_leftShiftClick_release_#306()
{
    simulateTyping("he")
    expected := setMousePositionToCaret()
    simulateTyping("llo")
    simulateKeyDown("leftShiftClick")
    sleep 100
    simulateKeyDown("lshift")
    sleep 50
    simulateKeyUp("lshift")
    sleep 100
    simulateKeyUp("leftShiftClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_leftShiftClick_is_pressed_and_alt_key_is_pressed_click_is_sent_on_leftShiftClick_release_#307()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    simulateKeyDown("leftShiftClick")
    sleep 100
    simulateKeyDown("lalt", 50)
    simulateKeyUp("leftShiftClick")
    sleep 100
    simulateKeyUp("lalt", 50)
    send {escape 2}

    validateCaretOutput(A_ThisFunc, expected)
}

When_leftShiftClick_is_pressed_and_ctrl_key_is_pressed_and_released_click_is_sent_on_leftShiftClick_release_#308()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    simulateKeyDown("leftShiftClick")
    sleep 100
    simulateKeyDown("lctrl", 100)
    simulateKeyUp("lctrl", 100)
    simulateKeyUp("leftShiftClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_leftShiftClick_is_pressed_and_ctrl_key_is_pressed_click_is_sent_on_leftShiftClick_release_#309()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    simulateKeyDown("leftShiftClick")
    sleep 100
    simulateKeyDown("lctrl", 100)
    simulateKeyUp("leftShiftClick")
    sleep 100
    simulateKeyUp("lctrl", 100)

    validateCaretOutput(A_ThisFunc, expected)
}

When_leftShiftClick_is_pressed_and_shift_key_is_pressed_and_released_click_is_sent_on_leftShiftClick_release_#310()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    simulateKeyDown("leftShiftClick")
    sleep 100
    simulateKeyDown("lshift")
    sleep 50
    simulateKeyUp("lshift")
    sleep 100
    simulateKeyUp("leftShiftClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_leftShiftClick_is_pressed_and_shift_key_is_pressed_click_is_sent_on_leftShiftClick_release_#311()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    simulateKeyDown("leftShiftClick")
    sleep 100
    simulateKeyDown("lshift", 50)
    sleep 50
    simulateKeyUp("leftShiftClick")
    sleep 100
    simulateKeyUp("lshift", 50)
    validateCaretOutput(A_ThisFunc, expected)
}

When_leftShiftClick_is_pressed_and_shift_is_pressed_and_released_click_is_sent_on_leftShiftClick_release_#312()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    simulateKeyDown("leftShiftClick")
    sleep 100
    simulateKeyDown("lshift", 100)
    simulateKeyUp("lshift", 100)
    simulateKeyUp("leftShiftClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_leftShiftClick_is_pressed_and_shift_is_pressed_click_is_sent_on_leftShiftClick_release_#313()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    simulateKeyDown("leftShiftClick")
    sleep 100
    simulateKeyDown("lshift", 100)
    simulateKeyUp("leftShiftClick")
    sleep 100
    simulateKeyUp("lshift", 100)

    validateCaretOutput(A_ThisFunc, expected)
}

When_leftShiftClick_is_pressed_and_shift_key_is_pressed_and_layout_key_pressed_and_backtick_pressed_keyboard_shortcut_is_sent_#314()
{
    simulateTyping("hello")
    setMousePositionToCaret()
    simulateTyping(" world")
    simulateKeyDown("leftShiftClick")
    sleep 100
    simulateKeyDown("lshift", 50)
    simulateKeyDown("space", 50)
    simulateKeyDown("``", 50)
    simulateKeyUp("space", 50)
    simulateKeyUp("``", 50)
    simulateKeyUp("lshift", 50)
    simulateKeyUp("leftShiftClick")
    sleep 100
    actual := clearText()
    expected := "hello world INTEGRATION_TEST"
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}    

When_leftShiftClick_is_continuously_pressed_and_layout_key_is_pressed_after_release_left_click_is_not_sent_#315()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo")
    simulateKeyDown("leftShiftClick")
    sleep 100
    simulateKeyDown("space", 50)
    simulateKeyUp("space", 50)
    expected := getCurrentCaretPosition()
    simulateKeyUp("leftShiftClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}    

When_leftShiftClick_is_continuously_pressed_and_mouse_is_moved_the_text_is_selected_#316()
{
    timeoutStillSendLayoutKey := 2000
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    simulateKeyDown("leftShiftClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyUp("leftShiftClick")
    sleep 100
    
    actual := getSelectedText()
    expected := "hello "
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftShiftClick_pressed_and_mouse_is_moved_and_layout_key_is_pressed_longer_then_timeoutStillSendLayoutKey_space_is_not_sent_on_layout_key_release_#319()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    simulateKeyDown("leftShiftClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyDown("space", timeoutStillSendLayoutKey + 100)
    simulateKeyUp("space", 100)
    simulateKeyUp("leftShiftClick")
    sleep 100

    actual := clearText()
    expected := "hello "

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}    

When_non_modifier_letter_is_released_and_layout_key_continuous_press_in_less_then_timeoutProcessLayoutOnRelease_and_leftShiftClick_pressed_and_backtick_pressed_and_released_click_is_not_sent_#320()
{
    simulateTyping("hello ")
    setMousePositionToCaret()
    simulateTyping("world")
    simulateKeyDown("space", 50)
    simulateKeyDown("leftShiftClick")
    sleep 50
    simulateKeyDown("``", 100)
    simulateKeyUp("``", 100)
    expected := getCurrentCaretPosition()
    simulateKeyUp("space", 100)
    simulateKeyUp("leftShiftClick")
    
    sleep 100
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_non_modifier_letter_is_released_and_layout_key_continuous_press_in_less_then_timeoutProcessLayoutOnRelease_and_leftShiftClick_continuous_press_and_backtick_pressed_and_leftShiftClick_released_left_click_is_not_sent_#321()
{
    simulateTyping("hello ")
    setMousePositionToCaret()
    simulateTyping("world")
    simulateKeyDown("space", 50)
    simulateKeyDown("leftShiftClick")
    sleep 50
    simulateKeyDown("``", 100)
    simulateKeyUp("``", 100)
    simulateKeyUp("space", 100)
    simulateKeyUp("leftShiftClick")
    expected := getCurrentCaretPosition()
    
    sleep 100
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_leftShiftClick_is_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_leftShiftClick_release_#322()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    simulateKeyDown("leftShiftClick")
    sleep timeoutStillSendLayoutKey
    sleep 100
    simulateKeyUp("leftShiftClick")
    sleep 100
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_leftShiftClick_action_is_not_lbutton_and_mouse_is_moved_on_release_action_is_sent_instead_of_mouse_click_#325()
{
    modifierDoubledAsClick["leftShiftClick"] := "c"
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    simulateKeyDown("leftShiftClick")
    sleep 50
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyUp("leftShiftClick")
    sleep 100
    
    expected := "hello c"
    validateTestOutput(A_ThisFunc , expected)
    modifierDoubledAsClick["leftShiftClick"] := "lbutton"
}

When_shift_is_pressed_and_leftShiftClick_is_continuously_pressed_and_mouse_is_moved_the_text_is_selected_#326()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    simulateKeyDown("lshift", 100)
    setMousePositionToCaret()
    simulateKeyDown("leftShiftClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyUp("leftShiftClick")
    sleep 100
    simulateKeyUp("lshift", 100)
    sleep 300
    
    actual := getSelectedText()
    expected := "hello "
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftShiftClick_is_continuously_pressed_and_mouse_is_moved_and_ctrl_is_pressed_the_text_remains_selected_#327()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    simulateKeyDown("leftShiftClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyDown("lctrl", 100)
    simulateKeyUp("leftShiftClick")
    sleep 100
    simulateKeyUp("lctrl", 100)
    
    actual := getSelectedText()
    expected := "hello "
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftShiftClick_is_continuously_pressed_and_mouse_is_moved_and_shift_is_pressed_and_released_the_text_remains_selected_#328()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    simulateKeyDown("leftShiftClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyDown("lshift", 100)
    simulateKeyUp("lshift", 300)
    simulateKeyDown("lshift", 100)
    simulateKeyUp("lshift", 300)
    simulateKeyUp("leftShiftClick")
    sleep 100
    
    actual := getSelectedText()
    expected := "hello "
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftShiftClick_is_pressed_and_a_letter_pressed_and_released_and_shift_pressed_and_leftShiftClick_released_and_a_letter_pressed_then_caps_a_letter_is_sent_#329()
{
    simulateKeyDown("leftShiftClick")
    sleep 100
    simulateTyping("a")
    simulateKeyDown("lshift", 100)
    simulateKeyUp("leftShiftClick")
    sleep 100
    simulateTyping("a")
    simulateKeyUp("lshift", 100)
    expected := "AA"
    validateTestOutput(A_ThisFunc , expected)
}

