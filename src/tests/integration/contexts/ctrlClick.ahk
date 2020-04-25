When_ctrlRClick_is_pressed_at_release_right_click_is_sent_#031()
{
    simulateTyping("he")
    expected := setMousePositionToCaret()
    simulateTyping("llo")
    simulateModifierClick("ctrlRClick", 1)
    simulateModifierClick("ctrlRClick", 0)
    
    validateCaretOutput(A_ThisFunc, expected)    
}

When_ctrlRClick_is_continously_pressed_and_layout_key_is_pressed_space_is_not_sent_#032()
{
    simulateTyping("hello")
    simulateModifierClick("ctrlRClick", 1)
    simulateKeyDown("space", 1000)
    simulateKeyUp("space", 50)
    simulateModifierClick("ctrlRClick", 0)
        
    expected := "hello"
    validateTestOutput(A_ThisFunc , expected)
}

When_ctrlRClick_is_continously_pressed_and_a_letter_is_pressed_all_text_is_selected_#033()
{
    simulateTyping("hello ")
    simulateModifierClick("ctrlRClick", 1)
    simulateKeyDown("a", 50)
    simulateKeyDown("c", 100)
    actual := clipboard
    simulateModifierClick("ctrlRClick", 0)
    simulateKeyUp("a", 50)
    simulateKeyUp("c", 50)
    expected := "hello "
    
    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment()
}

When_ctrlRClick_is_continously_pressed_and_letter_key_is_pressed_right_click_is_not_sent_on_ctrlRClick_release_#034()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo")
    simulateModifierClick("ctrlRClick", 1)
    simulateKeyDown("a", 50)
    expected := getCurrentCaretPosition()
    simulateModifierClick("ctrlRClick", 0)
    simulateKeyUp("a", 50)

    validateCaretOutput(A_ThisFunc, expected)    
}

When_ctrlRClick_is_continously_pressed_and_layout_key_is_pressed_and_key_remapped_as_left_is_sent_on_ctrlRClick_release_click_is_not_sent_#035()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo world")
    simulateModifierClick("ctrlRClick", 1)
    simulateKeyDown("space", 50)
    simulateKeyDown("a", 50)
    expected := getCurrentCaretPosition()
    simulateModifierClick("ctrlRClick", 0)
    simulateKeyUp("space", 50)
    simulateKeyUp("a", 50)

    validateCaretOutput(A_ThisFunc, expected)
}

When_ctrlRClick_is_pressed_and_shift_key_is_pressed_click_is_not_sent_on_ctrlRClick_release_#036()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo")
    simulateModifierClick("ctrlRClick", 1)
    simulateKeyDown("lshift", 50)
    simulateModifierClick("ctrlRClick", 0)
    simulateKeyUp("lshift", 50)
    expected := getCurrentCaretPosition()

    validateCaretOutput(A_ThisFunc, expected)
}

When_ctrlRClick_is_pressed_and_shift_key_is_pressed_and_layout_key_continous_pressed_and_key_remapped_as_left_key_a_word_is_selected_#037()
{
    simulateTyping("hello")
    setMousePositionToCaret()
    simulateTyping(" world")
    simulateModifierClick("ctrlRClick", 1)
    simulateKeyDown("lshift", 50)
    simulateKeyDown("space", 50)
    simulateKeyDown("a", 50)
    simulateKeyUp("space", 50)
    simulateKeyDown("c", 100)
    actual := clipboard
    simulateModifierClick("ctrlRClick", 0)
    simulateKeyUp("lshift", 50)
    simulateKeyUp("a", 50)
    simulateKeyUp("c", 50)
    expected := "world"
    
    result := evaluateResult(expectedResult, testOutput)
    addTestResult(A_ThisFunc, expected, actual, result)
    setDefaultTestEnvironment()
}    

When_ctrlRClick_is_continously_pressed_and_layout_key_is_pressed_after_release_left_click_is_not_sent_#38()
{
    simulateTyping("he")
    setMousePositionToCaret()
    simulateTyping("llo")
    simulateModifierClick("ctrlRClick", 1)
    simulateKeyDown("space", 50)
    simulateKeyUp("space", 50)
    expected := getCurrentCaretPosition()
    simulateModifierClick("ctrlRClick", 0)

    validateCaretOutput(A_ThisFunc, expected)    
}