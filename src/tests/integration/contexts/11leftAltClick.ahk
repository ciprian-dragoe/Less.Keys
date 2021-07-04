When_leftAltClick_is_pressed_at_release_left_click_is_sent_#1101()
{
    simulateTyping("he")
    expected := setMousePositionToCaret()
    simulateTyping("llo")
    processKeyDown("leftAltClick")
    sleep 100
    processKeyUp("leftAltClick")
    sleep 100
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_leftAltClick_is_continuously_pressed_and_layout_key_is_pressed_and_released_space_is_sent_#1102()
{
    simulateTyping("hello")
    processKeyDown("leftAltClick")
    sleep 100
    simulateKeyDown("space", 200)
    simulateKeyUp("space", 200)
    processKeyUp("leftAltClick")
    sleep 100
    send {escape 2}

    expected := "hello"
    validateTestOutput(A_ThisFunc , expected)
}

When_leftAltClick_is_continuously_pressed_and_backtick_is_pressed_keyboard_shortcut_is_sent_#1103()
{
    simulateTyping("hello ")
    processKeyDown("leftAltClick")
    sleep 100
    simulateKeyDown("``", 100)
    simulateKeyUp("``", 100)
    processKeyUp("leftAltClick")
    sleep 100
        
    actual := clearText()
    expected := "hello INTEGRATION_TEST"
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftAltClick_is_continuously_pressed_and_backtick_is_pressed_left_click_is_not_sent_on_leftAltClick_release_#1104()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo")
    expected := getCurrentCaretPosition()
    processKeyDown("leftAltClick")
    sleep 100
    simulateTyping("a")
    processKeyUp("leftAltClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)    
}

When_leftAltClick_is_pressed_and_alt_key_is_pressed_and_released_click_is_sent_on_leftAltClick_release_#1106()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    processKeyDown("leftAltClick")
    sleep 100
    simulateKeyDown("lalt", 100)
    simulateKeyUp("lalt", 100)
    processKeyUp("leftAltClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_leftAltClick_is_pressed_and_alt_key_is_pressed_click_is_sent_on_leftAltClick_release_#1107()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    processKeyDown("leftAltClick")
    sleep 100
    simulateKeyDown("lalt", 50)
    processKeyUp("leftAltClick")
    sleep 100
    simulateKeyUp("lalt", 50)

    validateCaretOutput(A_ThisFunc, expected)
}

When_leftAltClick_is_pressed_and_ctrl_key_is_pressed_and_released_click_is_sent_on_leftAltClick_release_#1108()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    processKeyDown("leftAltClick")
    sleep 100
    simulateKeyDown("lctrl", 100)
    simulateKeyUp("lctrl", 100)
    processKeyUp("leftAltClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_leftAltClick_is_pressed_and_ctrl_key_is_pressed_click_is_sent_on_leftAltClick_release_#1109()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    processKeyDown("leftAltClick")
    sleep 100
    simulateKeyDown("lctrl", 100)
    processKeyUp("leftAltClick")
    sleep 100
    simulateKeyUp("lctrl", 100)

    validateCaretOutput(A_ThisFunc, expected)
}

When_leftAltClick_is_pressed_and_win_key_is_pressed_and_released_click_is_sent_on_leftAltClick_release_#1110()
{
    timerTimeoutStickyKeys := 3000
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    processKeyDown("leftAltClick")
    sleep 100
    processKeyDown("lwin")
    sleep 50
    processKeyUp("lwin")
    sleep 700
    processKeyDown("lwin")
    sleep 100
    processKeyUp("lwin")
    sleep 700
    processKeyUp("leftAltClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_leftAltClick_is_pressed_and_win_key_is_pressed_click_is_sent_on_leftAltClick_release_#1111()
{
    timerTimeoutStickyKeys := 3000
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    processKeyDown("leftAltClick")
    sleep 100
    processKeyDown("lwin")
    sleep 50
    
    processKeyUp("leftAltClick")
    sleep 100
    processKeyUp("lwin")
    sleep 700

    validateCaretOutput(A_ThisFunc, expected)
}

When_leftAltClick_is_pressed_and_shift_is_pressed_and_released_click_is_sent_on_leftAltClick_release_#1112()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    processKeyDown("leftAltClick")
    sleep 100
    simulateKeyDown("lshift", 100)
    simulateKeyUp("lshift", 100)
    processKeyUp("leftAltClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}

When_leftAltClick_is_pressed_and_shift_is_pressed_click_is_sent_on_leftAltClick_release_#1113()
{
    simulateTyping("he")
    setMousePositionToCaret()
    expected := getCurrentCaretPosition()
    simulateTyping("llo")
    processKeyDown("leftAltClick")
    sleep 100
    simulateKeyDown("lshift", 100)
    processKeyUp("leftAltClick")
    sleep 100
    simulateKeyUp("lshift", 100)

    validateCaretOutput(A_ThisFunc, expected)
}

When_leftAltClick_is_continuously_pressed_and_layout_key_is_pressed_after_release_left_click_is_not_sent_#1115()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo")
    processKeyDown("leftAltClick")
    sleep 100
    simulateKeyDown("space", 50)
    simulateKeyUp("space", 50)
    expected := getCurrentCaretPosition()
    processKeyUp("leftAltClick")
    sleep 100

    validateCaretOutput(A_ThisFunc, expected)
}    

When_leftAltClick_is_continuously_pressed_and_mouse_is_moved_the_text_is_selected_#1116()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    processKeyDown("leftAltClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    processKeyUp("leftAltClick")
    sleep 100
    
    actual := getSelectedText()
    expected := "hello "
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftAltClick_pressed_and_mouse_is_moved_and_layout_key_is_pressed_longer_then_timeoutStillSendLayoutKey_space_is_not_sent_on_layout_key_release_#1119()
{
    default := timerTimeoutStickyKeys
    timerTimeoutStickyKeys := 2000
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    processKeyDown("leftAltClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyDown("space", timeoutStillSendLayoutKey + 100)
    simulateKeyUp("space", 100)
    processKeyUp("leftAltClick")

    sleep 100

    actual := clearText()
    expected := "hello "

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
    timerTimeoutStickyKeys := default
}    

When_leftAltClick_is_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_leftAltClick_release_#1122()
{
    setMousePositionToCaret()
    simulateTyping("hello ")
    expected := getCurrentCaretPosition()
    processKeyDown("leftAltClick")
    sleep timeoutStillSendLayoutKey
    sleep 100
    processKeyUp("leftAltClick")
    sleep 100
    
    validateCaretOutput(A_ThisFunc, expected)
}

When_leftAltClick_action_is_not_lbutton_and_mouse_is_moved_on_release_action_is_sent_instead_of_mouse_click_#1125()
{
    modifierDoubledAsClick["leftAltClick"] := "c"
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    processKeyDown("leftAltClick")
    sleep 50
    MouseMove startingPosition.x, startingPosition.y
    processKeyUp("leftAltClick")
    sleep 100
    
    expected := "hello c"
    validateTestOutput(A_ThisFunc , expected)
    modifierDoubledAsClick["leftAltClick"] := "lbutton"
}

When_alt_is_pressed_and_leftAltClick_is_continuously_pressed_and_mouse_is_moved_the_text_is_selected_#1126()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    simulateKeyDown("lalt", 100)
    setMousePositionToCaret()
    processKeyDown("leftAltClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    processKeyUp("leftAltClick")
    sleep 100
    simulateKeyUp("lalt", 100)
    
    actual := getSelectedText()
    expected := "hello "
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftAltClick_is_continuously_pressed_and_mouse_is_moved_and_ctrl_is_pressed_the_text_remains_selected_#1127()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    processKeyDown("leftAltClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyDown("lctrl", 100)
    processKeyUp("leftAltClick")
    sleep 100
    simulateKeyUp("lctrl", 100)
    
    actual := getSelectedText()
    expected := "hello "
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftAltClick_is_continuously_pressed_and_mouse_is_moved_and_alt_is_pressed_and_released_the_text_remains_selected_#1128()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    setMousePositionToCaret()
    processKeyDown("leftAltClick")
    sleep 100
    MouseMove startingPosition.x, startingPosition.y
    simulateKeyDown("lalt", 100)
    simulateKeyUp("lalt", 100)
    processKeyUp("leftAltClick")
    sleep 100
    
    actual := getSelectedText()
    expected := "hello "
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_layoutKey_pressed_leftAltClick_pressed_at_release_alternative_value_is_sent_#1129()
{
    simulateTyping("w ")
    processKeyDown("space")
    sleep 100
    processKeyDown("leftAltClick")
    sleep 100
    processKeyUp("leftAltClick")
    sleep 100
    processKeyUp("space")

    expected := "w y"
    validateTestOutput(A_ThisFunc , expected)
}

When_layoutKey_pressed_leftAltClick_pressed_leftAltClick_released_layoutKey_releases_space_is_not_sent_#1130()
{
    simulateTyping("w ")
    processKeyDown("space")
    sleep 100
    processKeyDown("leftAltClick")
    sleep 100
    processKeyUp("leftAltClick")
    sleep 100
    processKeyUp("space")

    expected := "w y"
    validateTestOutput(A_ThisFunc , expected)
}

When_shift_pressed_layoutKey_pressed_leftAltClick_pressed_at_release_capitalized_alternative_value_is_sent_#1131()
{
    simulateTyping("w ")
    processKeyDown("shift")
    sleep 100
    processKeyDown("space")
    sleep 100
    processKeyDown("leftAltClick")
    sleep 100
    processKeyUp("leftAltClick")
    sleep 100
    processKeyUp("space")
    sleep 100
    processKeyUp("shift")

    expected := "w Y"
    validateTestOutput(A_ThisFunc , expected)
}
