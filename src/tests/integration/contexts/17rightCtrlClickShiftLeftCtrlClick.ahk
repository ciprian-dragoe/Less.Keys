When_rightCtrlClick_pressed_shift_pressed_leftCtrlClick_doubled_as_left_pressed_a_word_is_selected_before_a_leftCtrlClick_released_#1701()
{
    modifierDoubledAsClick["leftCtrlClick"] := "left"
    simulateTyping("hello world")
    processKeyDown("rightCtrlClick")
    sleep 100
    processKeyDown("shift")
    sleep 100
    processKeyDown("leftCtrlClick")
    sleep 50
    actual := getSelectedText()
    processKeyUp("rightCtrlClick")
    sleep 100
    processKeyUp("leftCtrlClick")
    sleep 100
    processKeyUp("shift")
    expected := "world"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}