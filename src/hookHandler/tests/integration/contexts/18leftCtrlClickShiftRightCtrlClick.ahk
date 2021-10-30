When_leftCtrlClick_pressed_shift_pressed_rightCtrlClick_doubled_as_left_pressed_a_word_is_selected_after_a_rightCtrlClick_released_#1801()
{
    modifierDoubledAsClick["rightCtrlClick"] := "left"
    simulateTyping("hello world")
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyDown("shift")
    sleep 100
    simulateKeyDown("rightCtrlClick")
    sleep 50
    simulateKeyUp("rightCtrlClick")
    sleep %timerTimeoutStickyKeys%
    sleep 100
    actual := getSelectedText()
    simulateKeyUp("leftCtrlClick")
    sleep 100
    simulateKeyUp("shift")
    expected := "world"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}

When_leftCtrlClick_pressed_shift_pressed_rightCtrlClick_doubled_as_left_pressed_nothing_is_typed_when_a_rightCtrlClick_and_leftCtrlClick_released_#1802()
{
    modifierDoubledAsClick["rightCtrlClick"] := "left"
    simulateTyping("hello world")
    simulateKeyDown("leftCtrlClick")
    sleep 100
    simulateKeyDown("shift")
    sleep 100
    simulateKeyDown("rightCtrlClick")
    sleep 50
    modifierDoubledAsClick["leftCtrlClick"] := "a"
    modifierDoubledAsClick["rightCtrlClick"] := "b"
    simulateKeyUp("rightCtrlClick")
    sleep 100
    simulateKeyUp("leftCtrlClick")
    sleep 100
    simulateKeyUp("shift")
    sleep 100
    actual := clearText()
    expected := "hello world"

    addTestResult(A_ThisFunc, expected, actual, evaluateResult(expected, actual))
    setDefaultTestEnvironment(A_ThisFunc)
}
