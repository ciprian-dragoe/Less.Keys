When_rightAltClick_is_pressed_at_release_left_click_is_sent_#3701()
{
    simulateTyping("he")
    expected := setMousePositionToCaret()
    simulateTyping("llo")
    simulateKeyDown("rightAltClick")
    sleep 100
    simulateKeyUp("rightAltClick")
    sleep 100
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_rightAltClick_is_continuously_pressed_and_layout_key_is_pressed_and_released_space_is_sent_#3702()
{
    simulateTyping("hello")
    simulateKeyDown("rightAltClick")
    sleep 100
    simulateKeyDown("space", 200)
    simulateKeyUp("space", 200)
    simulateKeyUp("rightAltClick")
    sleep 100
    send {escape 2}

    expected := "hello"
    validateTestOutput(A_ThisFunc , expected)
}

When_rightAltClick_is_continuously_pressed_and_backtick_is_pressed_keyboard_shortcut_is_sent_#3703()
{
    simulateTyping("hello ")
    simulateKeyDown("rightAltClick")
    sleep 100
    simulateKeyDown("``", 100)
    simulateKeyUp("``", 100)
    simulateKeyUp("rightAltClick")
    sleep 100
        
    actual := clearText()
    expected := "hello INTEGRATION_TEST"
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_rightAltClick_is_pressed_and_alt_key_is_pressed_and_released_click_is_sent_on_rightAltClick_release_#3706()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    simulateKeyDown("rightAltClick")
    sleep 100
    simulateKeyDown("lalt", 100)
    simulateKeyUp("lalt", 100)
    simulateKeyUp("rightAltClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightAltClick_is_pressed_and_alt_key_is_pressed_click_is_sent_on_rightAltClick_release_#3707()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    simulateKeyDown("rightAltClick")
    sleep 100
    simulateKeyDown("lalt", 50)
    simulateKeyUp("rightAltClick")
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
    simulateKeyDown("rightAltClick")
    sleep 100
    simulateKeyDown("lctrl", 100)
    simulateKeyUp("lctrl", 100)
    simulateKeyUp("rightAltClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightAltClick_is_pressed_and_ctrl_key_is_pressed_click_is_sent_on_rightAltClick_release_#3709()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    simulateKeyDown("rightAltClick")
    sleep 100
    simulateKeyDown("lctrl", 100)
    simulateKeyUp("rightAltClick")
    sleep 100
    simulateKeyUp("lctrl", 100)

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightAltClick_is_pressed_and_win_key_is_pressed_and_released_click_is_sent_on_rightAltClick_release_#3710()
{
    timerTimeoutStickyKeys := 3000
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    simulateKeyDown("rightAltClick")
    sleep 100
    simulateKeyDown("lwin")
    sleep 50
    simulateKeyUp("lwin")
    sleep 700
    simulateKeyDown("lwin")
    sleep 100
    simulateKeyUp("lwin")
    sleep 700
    simulateKeyUp("rightAltClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightAltClick_is_pressed_and_win_key_is_pressed_click_is_sent_on_rightAltClick_release_#3711()
{
    timerTimeoutStickyKeys := 3000
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    simulateKeyDown("rightAltClick")
    sleep 100
    simulateKeyDown("lwin")
    sleep 50
    
    simulateKeyUp("rightAltClick")
    sleep 100
    simulateKeyUp("lwin")
    sleep 700

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightAltClick_is_pressed_and_shift_is_pressed_and_released_click_is_sent_on_rightAltClick_release_#3712()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    simulateKeyDown("rightAltClick")
    sleep 100
    simulateKeyDown("lshift", 100)
    simulateKeyUp("lshift", 100)
    simulateKeyUp("rightAltClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightAltClick_is_pressed_and_shift_is_pressed_click_is_sent_on_rightAltClick_release_#3713()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    simulateKeyDown("rightAltClick")
    sleep 100
    simulateKeyDown("lshift", 100)
    simulateKeyUp("rightAltClick")
    sleep 100
    simulateKeyUp("lshift", 100)

    validateCaretOutput(A_ThisFunc, expected)
}

When_rightAltClick_is_continuously_pressed_and_layout_key_is_pressed_after_release_left_click_is_not_sent_#3715()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo")
    simulateKeyDown("rightAltClick")
    sleep 100
    simulateKeyDown("space", 50)
    simulateKeyUp("space", 50)
    expected := getCurrentCaretPosition()
    simulateKeyUp("rightAltClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}    

When_rightAltClick_is_continuously_pressed_and_mouse_is_moved_the_text_is_selected_#3716()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    simulateKeyDown("rightAltClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyUp("rightAltClick")
    sleep 100
    
    actual := getSelectedText()
    expected := "hello "
    
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
    simulateKeyDown("rightAltClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyDown("space", timeoutStillSendLayoutKey + 100)
    simulateKeyUp("space", 100)
    simulateKeyUp("rightAltClick")

    sleep 100

    actual := clearText()
    expected := "hello "

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
    timerTimeoutStickyKeys := default
}    

When_rightAltClick_is_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_rightAltClick_release_#3722()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    simulateKeyDown("rightAltClick")
    sleep timeoutStillSendLayoutKey
    sleep 100
    simulateKeyUp("rightAltClick")
    sleep 100
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_rightAltClick_action_is_not_lbutton_and_mouse_is_moved_on_release_action_is_sent_instead_of_mouse_click_#3725()
{
        modifierDoubledAsClick["rightAltClick"] := "c"
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
        setMousePositionToCaret()
    simulateKeyDown("rightAltClick")
    sleep 50
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyUp("rightAltClick")
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
    simulateKeyDown("rightAltClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyUp("rightAltClick")
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
    simulateKeyDown("rightAltClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyDown("lctrl", 100)
    simulateKeyUp("rightAltClick")
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
    simulateKeyDown("rightAltClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyDown("lalt", 100)
    simulateKeyUp("lalt", 100)
    simulateKeyUp("rightAltClick")
    sleep 100
    
    actual := getSelectedText()
    expected := "hello "
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}
