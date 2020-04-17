When_layout_key_is_pressed_a_key_is_reMapped_as_left_key_#1()
{
    simulateTyping("hello ")
    simulateKeyDown("space", 50)
    beforeMoveCarretXaxis := A_CaretX
    beforeMoveCarretYaxis := A_CaretY
    simulateTyping("a")
    simulateKeyUp("space", 50)
    afterMoveCarretXaxis := A_CaretX
    afterMoveCarretYaxis := A_CaretY
        
    if (beforeMoveCarretXaxis > afterMoveCarretXaxis && beforeMoveCarretYaxis == afterMoveCarretYaxis)
    {
        result := "PASS"
    }
    else
    {
        result := "FAIL"
    }
    expected := "afterMoveCarretXaxis to be less then beforeMoveCarretXaxis and afterMoveCarretYaxis to equal beforeMoveCarretYaxis"
    actual := afterMoveCarretXaxis . " < " . beforeMoveCarretXaxis . " and " afterMoveCarretYaxis . " = " . beforeMoveCarretYaxis
    addTestResult(A_ThisFunc, expected, actual, result)
    clearText()
}

When_layout_key_is_pressed_a_key_does_not_introduce_letter_a_#2()
{
    simulateTyping("hello ")
    simulateKeyDown("space", 50)
    simulateTyping("a")
    simulateKeyUp("space", 50)
    
    expected := "hello "
    validateTestOutput(A_ThisFunc , expected)
}

When_layout_key_is_pressed_less_then_timeoutStillSendLayoutKey_and_during_this_time_no_non_modifier_key_is_pressed_space_is_sent_on_layout_key_up_#3()
{
    simulateTyping("hello ")
    simulateKeyDown("space", 50)
    simulateKeyUp("space", 50)
    
    expected := "hello  "
    validateTestOutput(A_ThisFunc , expected)
}

When_layout_key_is_pressed_more_then_timeoutStillSendLayoutKey_and_during_this_time_no_non_modifier_key_is_pressed_space_is_not_sent_on_layout_key_up_#4()
{
    simulateTyping("hello ")
    simulateKeyDown("space", timeoutStillSendLayoutKey + 100)
    simulateKeyUp("space", 50)
    
    expected := "hello "
    validateTestOutput(A_ThisFunc , expected)
}

When_layout_key_is_pressed_less_then_timeoutStillSendLayoutKey_and_during_this_time_non_modifier_key_is_pressed_space_is_not_sent_on_layout_key_up_#5()
{
    simulateTyping("hello ")
    simulateKeyDown("space", 50)
    simulateTyping("a")
    simulateKeyUp("space", 50)
    
    expected := "hello "
    validateTestOutput(A_ThisFunc , expected)
}

When_layout_key_is_pressed_less_then_timeoutStillSendLayoutKey_and_during_this_time_modifier_key_is_pressed_space_is_sent_on_layout_key_up_#6()
{
    simulateTyping("hello ")
    simulateKeyDown("space", 50)
    simulateKeyDown("lshift", 50)
    simulateKeyUp("space", 50)
    simulateKeyUp("lshift", 50)
    
    expected := "hello  "
    validateTestOutput(A_ThisFunc , expected)
}

When_layout_key_is_pressed_continously_for_3_seconds_and_during_this_time_no_non_modifier_key_is_pressed_space_is_not_sent_on_layout_key_up_#7()
{
    simulateTyping("hello ")
    simulateKeyDown("space", 500)
    simulateKeyDown("space", 500)
    simulateKeyDown("space", 500)
    simulateKeyDown("space", 500)
    simulateKeyDown("space", 500)
    simulateKeyDown("space", 500)
    simulateKeyUp("space", 50)
    
    expected := "hello "
    validateTestOutput(A_ThisFunc , expected)
}

When_non_modifier_key_is_already_pressed_and_layout_key_is_pressed_space_is_sent_before_layout_key_released_#8()
{
    simulateKeyDown("w", 50)
    simulateKeyUp("w", 50)
    simulateKeyDown("e", 10)
    simulateKeyDown("space", 50)
    simulateKeyUp("e", 50)
    simulateKeyUp("space", 50)
    
    expected := "we "
    validateTestOutput(A_ThisFunc , expected)
}
