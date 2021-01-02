When_shift_key_is_logically_pressed_and_not_released_for_more_then_stickyTime_shift_and_shiftActive_is_reset_after_stickyTime_#101()
{
    simulateTyping("sticky")
    simulateKeyDown("lshift", timerTimeoutStickyKeys + 100)
    
    actual := "" . (!shiftActive && !GetKeyState("shift"))
    addTestResult(A_ThisFunc, "1", actual, evaluateResult(actual, "1"))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_shiftClick_key_is_logically_pressed_and_not_released_for_more_then_stickyTime_shift_is_reset_after_stickyTime_#102()
{
    simulateTyping("sticky")
    processKeyDown("shiftClick")    
    sleep %timerTimeoutStickyKeys%
    sleep 100
    
    actual := "" . (!shiftActive && !GetKeyState("shift"))
    addTestResult(A_ThisFunc, "1", actual, evaluateResult(actual, "1"))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_ctrl_key_is_logically_pressed_and_not_released_for_more_then_stickyTime_ctrl_and_ctrlActive_is_reset_after_stickyTime_#103()
{
    simulateTyping("sticky")
    simulateKeyDown("lctrl", timerTimeoutStickyKeys + 100)
    
    actual := "" . (!ctrlActive && !GetKeyState("ctrl"))
    addTestResult(A_ThisFunc, "1", actual, evaluateResult(actual, "1"))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_ctrlClick_key_is_logically_pressed_and_not_released_for_more_then_stickyTime_ctrl_is_reset_after_stickyTime_#104()
{
    simulateTyping("sticky")
    processKeyDown("ctrlClick")    
    sleep %timerTimeoutStickyKeys%
    sleep 100
    
    actual := "" . (!ctrlActive && !GetKeyState("ctrl"))
    addTestResult(A_ThisFunc, "1", actual, evaluateResult(actual, "1"))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_alt_key_is_logically_pressed_and_not_released_for_more_then_stickyTime_alt_and_altActive_is_reset_after_stickyTime_#105()
{
    simulateTyping("sticky")
    simulateKeyDown("lalt", timerTimeoutStickyKeys + 100)
    
    actual := "" . (!altActive && !GetKeyState("alt"))
    addTestResult(A_ThisFunc, "1", actual, evaluateResult(actual, "1"))
    simulateKeyDown("lalt", 100)
    simulateKeyUp("lalt", 100)
    setDefaultTestEnvironment(A_ThisFunc)
}

When_lwin_key_is_logically_pressed_and_not_released_for_more_then_stickyTime_lwin_and_winActive_is_reset_after_stickyTime_#106()
{
    simulateTyping("sticky")
    simulateKeyDown("lalt", timerTimeoutStickyKeys + 100)
    
    actual := "" . (!winActive && !GetKeyState("lwin"))
    addTestResult(A_ThisFunc, "1", actual, evaluateResult(actual, "1"))
    simulateKeyDown("lalt", 100)
    simulateKeyUp("lalt", 100)
    setDefaultTestEnvironment(A_ThisFunc)
}

When_layout_key_is_logically_pressed_and_not_released_for_more_then_stickyTime_alternativeLayout_is_reset_after_stickyTime_#107()
{
    simulateTyping("sticky")
    simulateKeyDown("space", timerTimeoutStickyKeys + 100)
    
    actual := "" . !alternativeLayoutActive
    addTestResult(A_ThisFunc, "1", actual, evaluateResult(actual, "1"))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_processKeyOnRelease_is_set_after_stickyTime_it_is_reset_#108()
{
    simulateTyping("sticky")
    processKeyOnRelease := true
    simulateKeyDown("space", timerTimeoutStickyKeys + 100)
    
    actual := "" . !processKeyOnRelease
    addTestResult(A_ThisFunc, "1", actual, evaluateResult(actual, "1"))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftShiftClick_key_is_logically_pressed_and_mouse_moved_and_stickyTime_passes_left_click_is_released_#109()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello")
    expected := setMousePositionToCaret()
    simulateTyping("sticky")
    setMousePositionToCaret()
    processKeyDown("leftShiftClick")
    sleep 100
    MouseMove expected.x, expected.y
    sleep %timerTimeoutStickyKeys%
    MouseMove startingPosition.x, startingPosition.y
    actual := getSelectedText()
    processKeyUp("leftShiftClick")
    sleep 100

    expected := "sticky"
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftCtrlClick_key_is_logically_pressed_and_mouse_moved_and_stickyTime_passes_left_click_is_released_#110()
{
    startingPosition := setMousePositionToCaret()
    simulateTyping("hello ")
    expected := setMousePositionToCaret()
    simulateTyping("sticky")
    setMousePositionToCaret()
    processKeyDown("leftCtrlClick")
    sleep 100
    MouseMove expected.x, expected.y
    sleep %timerTimeoutStickyKeys%
    MouseMove startingPosition.x, startingPosition.y
    actual := getSelectedText()
    processKeyUp("leftCtrlClick")
    sleep 100

    expected := "sticky"
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_lastKeyProcessedAsAlternative_is_set_after_stickyTime_it_is_reset_#112()
{
    lastKeyProcessedAsAlternative := "a"
    simulateKeyDown("space", timerTimeoutStickyKeys + 100)
    
    actual := "" . lastKeyProcessedAsAlternative = ""
    addTestResult(A_ThisFunc, "1", actual, evaluateResult(actual, "1"))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_keyToSendOnUp_is_set_after_stickyTime_it_is_reset_#113()
{
    keyToSendOnUp := "a"
    simulateKeyDown("space", timerTimeoutStickyKeys + 100)
    
    actual := "" . keyToSendOnUp = ""
    addTestResult(A_ThisFunc, "1", actual, evaluateResult(actual, "1"))
    setDefaultTestEnvironment(A_ThisFunc)
}
