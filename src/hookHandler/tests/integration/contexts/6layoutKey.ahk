When_layout_key_is_pressed_and_key_which_is_reMapped_as_left_key_is_sent_cursor_is_moved_to_left_#601()
{
    simulateTyping("hello")
    setMousePositionToCaret()
    simulateTyping(" ")
    simulateKeyDown("space", 50)
    simulateKeyDown("a", 50)
    expected := getCurrentCaretPosition()
    simulateKeyUp("space", 50)
    simulateKeyUp("a", 50)

    validateCaretOutput(A_ThisFunc, expected)
    clearText()
}

When_layout_key_is_pressed_a_key_does_not_introduce_letter_a_#602()
{
    simulateTyping("hello ")
    simulateKeyDown("space", 50)
    simulateTyping("a")
    simulateKeyUp("space", 50)
    
    expected := "hello "
    validateTestOutput(A_ThisFunc , expected)
}

When_layout_key_is_pressed_less_then_timeoutStillSendLayoutKey_and_during_this_time_no_non_modifier_key_is_pressed_space_is_sent_on_layout_key_up_#603()
{
    simulateTyping("hello ")
    simulateKeyDown("space", 50)
    simulateKeyUp("space", 50)
    
    expected := "hello  "
    validateTestOutput(A_ThisFunc , expected)
}

When_layout_key_is_pressed_more_then_timeoutStillSendLayoutKey_and_during_this_time_no_non_modifier_key_is_pressed_space_is_not_sent_on_layout_key_up_#604()
{
    simulateTyping("hello ")
    simulateKeyDown("space", timeoutStillSendLayoutKey + 100)
    simulateKeyUp("space", 50)
    
    expected := "hello "
    validateTestOutput(A_ThisFunc , expected)
}

When_layout_key_is_pressed_less_then_timeoutStillSendLayoutKey_and_during_this_time_non_modifier_key_is_pressed_space_is_not_sent_on_layout_key_up_#605()
{
    simulateTyping("hello ")
    simulateKeyDown("space", 50)
    simulateTyping("a")
    simulateKeyUp("space", 50)
    
    expected := "hello "
    validateTestOutput(A_ThisFunc , expected)
}

When_layout_key_is_pressed_less_then_timeoutStillSendLayoutKey_and_during_this_time_modifier_key_is_pressed_space_is_sent_on_layout_key_up_#606()
{
    simulateTyping("hello ")
    simulateKeyDown("space", 50)
    simulateKeyDown("lshift", 50)
    simulateKeyUp("space", 50)
    simulateKeyUp("lshift", 50)
    
    expected := "hello  "
    validateTestOutput(A_ThisFunc , expected)
}

When_layout_key_is_pressed_continuously_for_3_seconds_and_during_this_time_no_non_modifier_key_is_pressed_space_is_not_sent_on_layout_key_up_#607()
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

When_non_modifier_key_is_already_pressed_and_layout_key_is_pressed_space_is_sent_before_layout_key_released_#608()
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

When_non_modifier_key_is_released_followed_by_layout_key_press_in_less_than_timeoutProcessLayoutOnRelease_followed_by_non_modifier_key_press_which_has_alternative_mapping_followed_by_same_non_modifier_key_release_remapped_key_is_sent_#609()
{
    simulateKeyDown("w", 40)
    simulateKeyUp("w", 40)
    simulateKeyDown("space", 40)
    simulateKeyDown("a", 40)
    simulateKeyUp("a", 40)
    simulateKeyUp("space", 40)
    
    expected := "w"
    validateTestOutput(A_ThisFunc , expected)
}

When_non_modifier_key_is_released_followed_by_layout_key_press_in_less_than_timeoutProcessLayoutOnRelease_followed_by_non_modifier_key_press_followed_layout_key_release_space_is_sent_followed_by_non_modifier_key_#610()
{
    simulateKeyDown("w", 40)
    simulateKeyUp("w", 40)
    simulateKeyDown("space", 40)
    simulateKeyDown("e", 40)
    simulateKeyUp("space", 40)
    simulateKeyUp("e", 40)
    
    expected := "w e"
    validateTestOutput(A_ThisFunc , expected)
}

When_layout_key_is_pressed_followed_by_non_modifier_key_press_without_release_followed_by_layout_key_release_followed_by_same_non_modifier_key_press_remapped_key_is_sent_only_once_and_no_other_key_#611()
{
    simulateKeyDown("w", 50)
    simulateKeyUp("w", 1000)
    simulateKeyDown("space", 50)
    simulateKeyDown("a", 50)
    simulateKeyUp("space", 50)
    simulateKeyDown("a", 50)
    simulateKeyUp("a", 50)
    
    expected := "w"
    validateTestOutput(A_ThisFunc , expected)
}

When_layout_key_is_pressed_followed_by_non_modifier_key_press_followed_by_layout_key_release_followed_by_other_non_modifier_key_press_remapped_key_is_sent_followed_last_non_modifier_key_pressed_#612()
{
    simulateKeyDown("w", 50)
    simulateKeyUp("w", 1000)
    simulateKeyDown("space", 50)
    simulateKeyDown("a", 50)
    simulateKeyUp("a", 50)
    simulateKeyUp("space", 50)
    simulateKeyDown("d", 50)
    simulateKeyUp("d", 50)
    
    expected := "dw"
    validateTestOutput(A_ThisFunc , expected)
}

When_non_modifier_key_is_released_followed_by_layout_key_press_in_less_than_timeoutProcessLayoutOnRelease_followed_by_non_modifier_key_press_without_alternative_mapping_followed_by_same_release_the_key_is_sent_followed_by_space_#613()
{
    simulateKeyDown("w", 50)
    simulateKeyUp("w", 50)
    simulateKeyDown("space", 50)
    simulateKeyDown("y", 10)
    simulateKeyUp("y", 50)
    simulateKeyUp("space", 50)
    
    expected := "w y"
    validateTestOutput(A_ThisFunc , expected)
}

When_letter_is_released_followed_by_layout_key_press_in_less_than_timeoutProcessLayoutOnRelease_followed_by_letter_press_followed_by_different_letter_press_and_release_space_and_normal_key_for_first_and_second_letter_is_sent_#614()
{
    simulateKeyDown("w", 40)
    simulateKeyUp("w", 40)
    simulateKeyDown("space", 40)
    simulateKeyDown("o", 40)
    simulateKeyDown("l", 40)
    simulateKeyUp("o", 40)
    simulateKeyUp("l", 40)
    simulateKeyUp("space", 40)
    
    expected := "w ol"
    validateTestOutput(A_ThisFunc , expected)
}

When_letter_is_remapped_as_accented_character_is_pressed_accented_character_is_sent_#617()
{
    send {Asc 0192}
    expected := clearText()
    simulateKeyDown("pgup", 50)
    simulateKeyUp("pgup", 50)
    
    validateTestOutput(A_ThisFunc , expected)
}

When_shift_key_is_pressed_followed_by_letter_remapped_as_accented_character_sibling_accented_character_is_sent_#618()
{
    send {Asc 0224}
    expected := clearText()
    simulateKeyDown("lshift", 50)
    simulateKeyDown("pgup", 50)
    simulateKeyUp("pgup", 50)
    simulateKeyUp("lshift", 50)
    
    validateTestOutput(A_ThisFunc , expected)
}

When_a_letter_is_pressed_followed_by_layout_key_press_space_is_sent_before_layout_key_lift_#619()
{
    simulateKeyDown("a", 50)
    simulateKeyDown("space", 50)
    sleep % timerTimeoutStickyKeys + 2 * timerTimeoutStickyKeys
    expected := "a "
    validateTestOutput(A_ThisFunc , expected)
    simulateKeyUp("space", 50)
    simulateKeyUp("a", 50)
    clearText()
}

When_a_letter_is_pressed_followed_by_layout_key_press_space_is_sent_before_layout_key_lift_#620()
{
    simulateKeyDown("a", 50)
    simulateKeyDown("space", 50)
    sleep % timerTimeoutStickyKeys + 2 * timerTimeoutStickyKeys
    expected := "a "
    validateTestOutput(A_ThisFunc , expected)
    simulateKeyUp("space", 50)
    simulateKeyUp("a", 50)
    clearText()
}

When_a_letter_is_pressed_followed_by_layout_key_press_space_followed_by_letter_with_alternative_mapping_the_normal_value_is_sent_#621()
{
    simulateKeyDown("a", 50)
    simulateKeyDown("space", 50)
    simulateKeyDown("c", 50)
    simulateKeyUp("c", 50)
    sleep % timerTimeoutStickyKeys + 2 * timerTimeoutStickyKeys
    expected := "a c"
    validateTestOutput(A_ThisFunc , expected)
    simulateKeyUp("space", 50)
    simulateKeyUp("a", 50)
    clearText()
}
