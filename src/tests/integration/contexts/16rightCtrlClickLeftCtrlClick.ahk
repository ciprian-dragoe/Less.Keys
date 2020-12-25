When_rightCtrlClick_is_pressed_leftCtrlClick_doubled_as_a_is_pressed_all_text_is_selected_before_a_leftCtrlClickRelease_#1601()
{
    modifierDoubledAsClick["leftCtrlClick"] := "a"
    simulateTyping("hello ")
    processKeyDown("rightCtrlClick")
    sleep 100
    processKeyDown("leftCtrlClick")
    sleep 100
    actual := getSelectedText()
    processKeyUp("rightCtrlClick")
    sleep 100
    processKeyUp("leftCtrlClick")
    sleep 100
    expected := "hello "

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
}

When_rightCtrlClick_doubled_as_b_is_pressed_leftCtrlClick_doubled_as_a_is_pressed_and_released_b_is_not_sent_on_RightCtrlClickRelease_1602()
{
    modifierDoubledAsClick["leftCtrlClick"] := "a"
    modifierDoubledAsClick["rightCtrlClick"] := "b"
    simulateTyping("hello ")
    processKeyDown("rightCtrlClick")
    sleep 100
    processKeyDown("leftCtrlClick")
    sleep 100
    processKeyUp("rightCtrlClick")
    sleep 100
    processKeyUp("leftCtrlClick")
    sleep 100
    actual := getSelectedText()

    expected := "hello "
    validateTestOutput(A_ThisFunc , expected)
}

When_rightCtrlClick_doubled_as_b_is_pressed_leftCtrlClick_doubled_as_a_is_pressed_and_released_b_is_not_sent_on_RightCtrlClickRelease_1602()
{
    modifierDoubledAsClick["leftCtrlClick"] := "a"
    modifierDoubledAsClick["rightCtrlClick"] := "b"
    simulateTyping("hello ")
    processKeyDown("rightCtrlClick")
    sleep 100
    processKeyDown("leftCtrlClick")
    sleep 100
    processKeyUp("rightCtrlClick")
    sleep 100
    processKeyUp("leftCtrlClick")
    sleep 100
    actual := getSelectedText()

    expected := "hello "
    validateTestOutput(A_ThisFunc , expected)
}
1