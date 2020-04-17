Alternative_layout_does_not_introduce_letter_for_key_which_is_reMapped_as_left_key()
{
    simulateTyping("hello ")
    simulateKeyDown("space", 50)
    simulateTyping("a")
    simulateKeyUp("space", 50)
    
    expected := "hello "
    validateTestOutput(A_ThisFunc , expected)
}

Alternative_layout_moves_caret_for_key_which_is_reMapped_as_left_key()
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