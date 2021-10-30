When_leftCtrlClick_is_pressed_at_release_left_click_is_sent_#401()
{
    simulateTyping("he")
    expected := setMousePositionToCaret()
    simulateTyping("llo")
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyUp("leftCtrlClick")
    sleep 100
    
    validateCaretOutput(A_ThisFunc, expected)    
}

When_leftCtrlClick_is_continuously_pressed_and_layout_key_is_pressed_but_not_released_space_is_not_sent_#402()
{
    simulateTyping("hello")
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyDown("space", timerTimeoutStickyKeys)
    simulateKeyUp("space", 50)
    simulateKeyUp("leftCtrlClick")
    sleep 100
        
    expected := "hello"
    validateTestOutput(A_ThisFunc , expected)
}

When_leftCtrlClick_is_continuously_pressed_and_a_letter_is_pressed_all_text_is_selected_#403()
{
    simulateTyping("hello ")
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateTyping("a")
    simulateKeyUp("leftCtrlClick")
    sleep 100
        
    actual := getSelectedText()
    expected := "hello "
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftCtrlClick_is_continuously_pressed_and_a_key_is_pressed_left_click_is_not_sent_on_leftCtrlClick_release_#404()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo")
    expected := getCurrentCaretPosition()
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateTyping("a")
    simulateKeyUp("leftCtrlClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)    
}

When_leftCtrlClick_is_continuously_pressed_and_layout_key_is_pressed_and_key_remapped_as_left_is_sent_on_leftCtrlClick_release_click_is_not_sent_#405()
{
    expected := setMousePositionToCaret()
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo ")
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyDown("space", 50)
    simulateKeyDown("a", 50)
    simulateKeyUp("leftCtrlClick")
    sleep 100
    simulateKeyUp("space", 50)
    simulateKeyUp("a", 50)

    validateCaretOutput(A_ThisFunc, expected)
}

When_leftCtrlClick_is_pressed_and_ctrl_key_is_pressed_and_released_click_is_sent_on_leftCtrlClick_release_#406()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyDown("lctrl", 100)
    simulateKeyUp("lctrl", 100)
    simulateKeyUp("leftCtrlClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_leftCtrlClick_is_pressed_and_ctrl_key_is_pressed_click_is_sent_on_leftCtrlClick_release_#407()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyDown("lctrl", 50)
    simulateKeyUp("leftCtrlClick")
    sleep 100
    simulateKeyUp("lctrl", 50)

    validateCaretOutput(A_ThisFunc, expected)
}

When_leftCtrlClick_is_pressed_and_alt_key_is_pressed_and_released_click_is_sent_on_leftCtrlClick_release_#408()
{
    timeoutStillSendLayoutKey := 2000
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyDown("lalt", 100)
    simulateKeyUp("lalt", 100)
    simulateKeyDown("lalt", 100)
    simulateKeyUp("lalt", 100)
    simulateKeyUp("leftCtrlClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_leftCtrlClick_is_pressed_and_alt_key_is_pressed_click_is_sent_on_leftCtrlClick_release_#409()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyDown("lalt", 100)
    simulateKeyUp("leftCtrlClick")
    sleep 100
    simulateKeyUp("lalt", 100)

    validateCaretOutput(A_ThisFunc, expected)
}

When_leftCtrlClick_is_pressed_and_win_key_is_pressed_and_released_click_is_sent_on_leftCtrlClick_release_#410()
{
    timerTimeoutStickyKeys := 3000
    timeoutStillSendLayoutKey := 2000
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyDown("lwin")
    sleep 50
    simulateKeyUp("lwin")
    sleep 700
    simulateKeyDown("lwin")
    sleep 100
    simulateKeyUp("lwin")
    sleep 700
    simulateKeyUp("leftCtrlClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_leftCtrlClick_is_pressed_and_win_key_is_pressed_click_is_sent_on_leftCtrlClick_release_#411()
{
    timerTimeoutStickyKeys := 3000
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyDown("lwin")
    sleep 50
    
    simulateKeyUp("leftCtrlClick")
    sleep 100
    simulateKeyUp("lwin")
    sleep 700

    validateCaretOutput(A_ThisFunc, expected)
}

When_leftCtrlClick_is_pressed_and_shift_is_pressed_and_released_click_is_sent_on_leftCtrlClick_release_#412()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyDown("lshift", 100)
    simulateKeyUp("lshift", 100)
    simulateKeyUp("leftCtrlClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_leftCtrlClick_is_pressed_and_shift_is_pressed_click_is_sent_on_leftCtrlClick_release_#413()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyDown("lshift", 100)
    simulateKeyUp("leftCtrlClick")
    sleep 100
    simulateKeyUp("lshift", 100)

    validateCaretOutput(A_ThisFunc, expected)
}

When_leftCtrlClick_is_pressed_and_shift_key_is_pressed_and_layout_key_pressed_and_key_remapped_as_left_key_a_word_is_selected_#414()
{
    simulateTyping("hello")
    setMousePositionToCaret()
    simulateTyping(" world")
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyDown("lshift", 50)
    simulateKeyDown("space", 50)
    simulateKeyDown("a", 50)
    simulateKeyUp("a", 50)
    simulateKeyUp("space", 50)
    simulateKeyUp("lshift", 50)
    simulateKeyUp("leftCtrlClick")
    sleep 100
    actual := getSelectedText()
    expected := "world"
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}    

When_leftCtrlClick_is_continuously_pressed_and_layout_key_is_pressed_after_release_left_click_is_not_sent_#415()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo")
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyDown("space", 50)
    simulateKeyUp("space", 50)
    expected := getCurrentCaretPosition()
    simulateKeyUp("leftCtrlClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}    

When_leftCtrlClick_is_continuously_pressed_and_mouse_is_moved_the_text_is_selected_#416()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    simulateKeyDown("leftCtrlClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyUp("leftCtrlClick")
    sleep 100
    
    actual := getSelectedText()
    expected := "hello "
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftCtrlClick_pressed_and_mouse_is_moved_and_layout_key_is_pressed_longer_then_timeoutStillSendLayoutKey_space_is_not_sent_on_layout_key_release_#419()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    simulateKeyDown("leftCtrlClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyDown("space", timeoutStillSendLayoutKey + 100)
    simulateKeyUp("space", 100)
    simulateKeyUp("leftCtrlClick")
    sleep 100

    actual := clearText()
    expected := "hello "

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}    

When_non_modifier_letter_is_released_and_layout_key_press_in_less_then_timeoutProcessLayoutOnRelease_and_leftCtrlClick_pressed_and_letter_key_alternative_mapped_as_left_key_pressed_and_released_caret_is_moved_#420()
{
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    simulateTyping("world")
    simulateKeyDown("space", 50)
    simulateKeyDown("leftCtrlClick")
    sleep 50
    simulateTyping("a")
    simulateKeyUp("space", 100)
    simulateKeyUp("leftCtrlClick")
    sleep 100
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_non_modifier_letter_is_released_and_layout_key_press_in_less_then_timeoutProcessLayoutOnRelease_and_leftCtrlClick_press_and_letter_key_pressed_and_released_and_leftCtrlClick_released_left_click_is_not_sent_#421()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    simulateTyping("world")
    simulateKeyDown("space", 50)
    simulateKeyDown("leftCtrlClick")
    sleep 50
    simulateTyping("a")
    simulateKeyUp("space", 100)
    simulateKeyUp("leftCtrlClick")
    sleep 100
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_leftCtrlClick_is_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_leftCtrlClick_release_#422()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    simulateKeyDown("leftCtrlClick")
    sleep timeoutStillSendLayoutKey
    sleep 100
    simulateKeyUp("leftCtrlClick")
    sleep 100
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_leftCtrlClick_action_is_not_lbutton_and_mouse_is_moved_on_release_action_is_sent_instead_of_mouse_click_#425()
{
    modifierDoubledAsClick["leftCtrlClick"] := "c"
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    simulateKeyDown("leftCtrlClick")
    sleep 50
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyUp("leftCtrlClick")
    sleep 100
    
    expected := "hello c"
    validateTestOutput(A_ThisFunc , expected)
    modifierDoubledAsClick["leftCtrlClick"] := "lbutton"
}

When_ctrl_is_pressed_and_leftCtrlClick_is_continuously_pressed_and_mouse_is_moved_the_text_is_selected_#426()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    simulateKeyDown("lctrl", 100)
    setMousePositionToCaret()
    simulateKeyDown("leftCtrlClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyUp("leftCtrlClick")
    sleep 100
    simulateKeyUp("lctrl", 100)
    
    actual := getSelectedText()
    expected := "hello "
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftCtrlClick_is_continuously_pressed_and_mouse_is_moved_and_ctrl_is_pressed_the_text_remains_selected_#427()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    simulateKeyDown("leftCtrlClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyDown("lctrl", 100)
    simulateKeyUp("leftCtrlClick")
    sleep 100
    simulateKeyUp("lctrl", 100)
    
    actual := getSelectedText()
    expected := "hello "
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftCtrlClick_is_continuously_pressed_and_mouse_is_moved_and_ctrl_is_pressed_and_released_the_text_remains_selected_#428()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    simulateKeyDown("leftCtrlClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyDown("lctrl", 100)
    simulateKeyUp("lctrl", 100)
    simulateKeyUp("leftCtrlClick")
    sleep 100
    actual := getSelectedText()
    expected := "hello "
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftCtrlClick_is_pressed_and_backspace_pressed_and_released_and_ctrl_pressed_and_leftCtrlClick_released_and_backspace_pressed_then_ctrl_and_backspace_is_sent_#429()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello world again")
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyDown("backspace", 100)
    simulateKeyUp("backspace", 100)
    simulateKeyDown("lctrl", 100)
    simulateKeyUp("leftCtrlClick")
    sleep 100
    simulateKeyDown("backspace", 100)
    simulateKeyUp("backspace", 100)

    sleep 100
    simulateKeyUp("lctrl", 100)
    expected := "hello "
    validateTestOutput(A_ThisFunc , expected)
    setDefaultTestEnvironment(A_ThisFunc)
}
