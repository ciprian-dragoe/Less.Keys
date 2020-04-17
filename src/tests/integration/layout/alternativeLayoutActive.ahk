Alternative_layout_does_not_introduce_letter_for_key_which_is_reMapped_as_left_key()
{
    simulateTyping("hello ")
    simulateKeyDown("space", 50)
    simulateTyping("a")
    simulateKeyUp("space", 50)
    
    expected := "hello "
    validateTestOutput(A_ThisFunc , expected)
}