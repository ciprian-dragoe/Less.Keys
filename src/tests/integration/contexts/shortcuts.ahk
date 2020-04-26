When_key_matches_shortcut_pattern_shortcut_action_is_executed_instead_of_key_#201()
{
    simulateKeyDown("lshift", 50)
    simulateKeyDown("``", 50)
    simulateKeyUp("``", 50)
    simulateKeyUp("lshift", 50)
    
    expected := "INTEGRATION_TEST"
    validateTestOutput(A_ThisFunc , expected)
}

When_key_matches_shortcut_pattern_and_is_kept_pressed_after_shortcut_action_is_sent_next_layout_key_press_is_not_without_release_is_not_processed_as_space_#202()
{
    simulateKeyDown("lshift", 50)
    simulateKeyDown("``", 50)
    simulateKeyDown("space", 1000)
    simulateKeyUp("space", 50)
    simulateKeyUp("lshift", 50)
    simulateKeyUp("``", 50)
    
    expected := "INTEGRATION_TEST"
    validateTestOutput(A_ThisFunc , expected)
}
