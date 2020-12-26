When_leftCtrlClick_pressed_shift_pressed_rightCtrlClick_doubled_as_left_pressed_a_word_is_selected_before_a_rightCtrlClick_released_#1801()
{
    modifierDoubledAsClick["rightCtrlClick"] := "left"
    simulateTyping("hello world")
    processKeyDown("leftCtrlClick")
    sleep 100
    processKeyDown("shift")
    sleep 100
    processKeyDown("rightCtrlClick")
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

When_leftCtrlClick_pressed_shift_pressed_rightCtrlClick_doubled_as_left_pressed_nothing_is_typed_when_a_rightCtrlClick_and_leftCtrlClick_released_#1802()
{
    modifierDoubledAsClick["rightCtrlClick"] := "left"
    simulateTyping("hello world")
    processKeyDown("leftCtrlClick")
    sleep 100
    processKeyDown("shift")
    sleep 100
    processKeyDown("rightCtrlClick")
    sleep 50
    modifierDoubledAsClick["leftCtrlClick"] := "a"
    modifierDoubledAsClick["rightCtrlClick"] := "b"
    processKeyUp("rightCtrlClick")
    sleep 100
    processKeyUp("leftCtrlClick")
    sleep 100
    processKeyUp("shift")
    sleep 100
    actual := clearText()
    expected := "hello world"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}
