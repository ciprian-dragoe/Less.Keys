When_key_which_has_been_remapped_is_pressed_remapped_key_is_sent_instead_#701()
{
    simulateKeyDown("pause", 50)
    simulateKeyUp("pause", 50)
    
    expected := "\"
    validateTestOutput(A_ThisFunc , expected)
}

When_layout_key_is_pressed_followed_by_key_which_has_been_remapped_is_pressed_alternative_of_remapped_key_is_sent_#702()
{
    simulateKeyDown("space", 50)
    simulateKeyDown("pause", 50)
    simulateKeyUp("pause", 50)
    simulateKeyUp("space", 50)
    
    expected := "/"
    validateTestOutput(A_ThisFunc , expected)
}

When_key_which_has_been_remapped_as_modifier_key_is_pressed_modifier_key_is_sent_instead_#703()
{
    simulateTyping("hello")
    simulateKeyDown("capslock", 50)
    simulateKeyDown("a", 50)
    simulateKeyUp("a", 50)
    simulateKeyUp("capslock", 50)
    simulateKeyDown("w", 50)
    simulateKeyUp("w", 50)
        
    expected := "w"
    validateTestOutput(A_ThisFunc , expected)
}

When_key_which_has_been_remapped_as_modifier_key_is_pressed_followed_by_layout_key_press_followed_by_key_which_has_alternative_mapping_the_alternative_mapped_key_is_sent_#704()
{
    simulateTyping("hello")
    simulateKeyDown("space", 50)
    simulateKeyDown("capslock", 50)
    simulateKeyDown("a", 50)
    simulateKeyUp("a", 50)
    simulateKeyUp("capslock", 50)
    simulateKeyUp("space", 50)
    simulateKeyDown("w", 50)
    simulateKeyUp("w", 50)
        
    expected := "whello"
    validateTestOutput(A_ThisFunc , expected)
}

When_modifier_key_remapped_as_letter_is_pressed_on_release_activePressedKeys_is_reset_#705()
{
    simulateKeyDown("rshift")
    simulateKeyUp("rshift")
    sleep 50
    
    result := ""
    for index, value in activePressedKeys
    {
        result .= value
    }
    expected:= ""
    addTestResult(A_ThisFunc, expected, result, evaluateResult(expected, result))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_layout_key_pressed_and_modifier_key_remapped_as_letter_is_pressed_on_modifier_key_release_activePressedKeys_is_reset_#706()
{
    simulateKeyDown("space", 50)
    simulateKeyDown("rshift", 50)
    simulateKeyUp("rshift")
    sleep 50
    simulateKeyUp("space", 50)
    
    result := ""
    for index, value in activePressedKeys
    {
        result .= value
    }
    expected := ""
    addTestResult(A_ThisFunc, expected, result, evaluateResult(expected, result))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_layout_key_pressed_and_modifier_key_remapped_as_letter_is_pressed_on_modifier_key_release_alternative_key_is_sent_#707()
{
    simulateKeyDown("space", 50)
    simulateKeyDown("rshift", 50)
    simulateKeyUp("rshift")
    sleep 50
    simulateKeyUp("space", 50)
    
    expected := "-"
    validateTestOutput(A_ThisFunc , expected)
}

When_layout_key_pressed_followed_by_modifier_key_remapped_as_letter_pressed_followed_by_layout_release_followed_by_same_modifier_press_remapped_letter_is_sent_#708()
{
    simulateKeyDown("space", 50)
    simulateKeyDown("rshift", 50)
    simulateKeyUp("rshift")
    sleep 50
    simulateKeyUp("space", 50)
    simulateKeyDown("rshift", 50)
    simulateKeyUp("rshift", 50)
    
    expected := "-o"
    validateTestOutput(A_ThisFunc , expected)
}

When_layout_key_continuously_pressed_followed_by_letter_alternatively_mapped_as_accented_character_accented_character_is_sent_#709()
{
    send {Asc 0224}
    expected := clearText()
    simulateKeyDown("space", 50)
    simulateKeyDown("appskey", 50)
    simulateKeyUp("appskey", 50)
    simulateKeyUp("space", 50)
    
    validateTestOutput(A_ThisFunc , expected)
}

When_layout_key_continuously_pressed_followed_by_shift_key_press_followed_by_letter_alternatively_mapped_as_accented_character_sibling_accented_character_is_sent_#710()
{
    send {Asc 0192}
    expected := clearText()
    simulateKeyDown("space", 50)
    simulateKeyDown("lshift", 50)
    simulateKeyDown("appskey", 50)
    simulateKeyUp("appskey", 50)
    simulateKeyUp("lshift", 50)
    simulateKeyUp("space", 50)
    
    validateTestOutput(A_ThisFunc , expected)
}

When_letter_pressed_and_released_layoutKey_press_in_less_then_timeoutProcessLayoutOnRelease_letter_a_press_THEN_layoutKey_letter_a_letter_b_sent_on_letter_b_press_#711()
{
    simulateKeyDown("w")
    sleep 40
    simulateKeyUp("w")
    sleep 40
    simulateKeyDown("space")
    sleep 40
    simulateKeyDown("a")
    sleep 40
    simulateKeyDown("b")
    sleep 100
    sleep %timerTimeoutStickyKeys%
    simulateKeyUp("space")
    simulateKeyUp("a")
    simulateKeyUp("b")

    expected := "w ab"
    validateTestOutput(A_ThisFunc , expected)
}

When_letter_pressed_and_released_layoutKey_press_in_less_then_timeoutProcessLayoutOnRelease_letter_o_continuous_press_two_times_THEN_alternative_value_of_o_is_sent_once_#712()
{
    simulateKeyDown("w")
    sleep 10
    simulateKeyUp("w")
    sleep 10
    simulateKeyDown("space")
    sleep 10
    simulateKeyDown("o")
    sleep 10
    simulateKeyDown("o")
    sleep 100
    sleep %timerTimeoutStickyKeys%
    simulateKeyUp("space")
    simulateKeyUp("o")

    expected := "w-"
    validateTestOutput(A_ThisFunc , expected)
}

When_letter_pressed_and_released_layoutKey_press_in_less_then_timeoutProcessLayoutOnRelease_letter_h_continuous_press_two_times_THEN_layoutKey_letter_h_is_sent_once_#713()
{
    simulateKeyDown("w")
    sleep 10
    simulateKeyUp("w")
    sleep 10
    simulateKeyDown("space")
    sleep 10
    simulateKeyDown("h")
    sleep 10
    simulateKeyDown("h")
    sleep 100
    sleep %timerTimeoutStickyKeys%
    simulateKeyUp("space")
    simulateKeyUp("h")

    expected := "w h"
    validateTestOutput(A_ThisFunc , expected)
}
