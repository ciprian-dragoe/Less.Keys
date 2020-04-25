When_key_which_has_been_remapped_is_pressed_remapped_key_is_sent_instead_#101()
{
    simulateKeyDown("pause", 50)
    simulateKeyUp("pause", 50)
    
    expected := "\"
    validateTestOutput(A_ThisFunc , expected)
}

When_layout_key_is_pressed_followed_by_key_which_has_been_remapped_is_pressed_alternative_of_remapped_key_is_sent_#102()
{
    simulateKeyDown("space", 50)
    simulateKeyDown("pause", 50)
    simulateKeyUp("pause", 50)
    simulateKeyUp("space", 50)
    
    expected := "/"
    validateTestOutput(A_ThisFunc , expected)
}

When_key_which_has_been_remapped_as_modifier_key_is_pressed_modifier_key_is_sent_instead_#103()
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

When_key_which_has_been_remapped_as_modifier_key_is_pressed_followed_by_layout_key_press_followed_by_key_which_has_alternative_mapping_the_alternative_mapped_key_is_sent_#104()
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
