; the newer lenovo ThinkPads models have a bad keyboard where it is very easy while a key is pressed
; to be hardware detected as up and then down again, this implementation tries to reduce
; some of these scenarios
global otherKeyPressedWhileWobblyKeyDown := false
global isWobblyKeyPressed := 0

wobblyKeyPress(state)
{
    if (state)
    {
        wobblyKeyDown()
    }
    else
    {
        wobblyKeyUp()
    }
}

wobblyKeyDown()
{
    if (isWobblyKeyPressed)
    {
        return
    }

    isWobblyKeyPressed := 1
    SetTimer, TimerCancelWobblyKey, OFF
    otherKeyPressedWhileWobblyKeyDown := false
    setWinState(1)
}

wobblyKeyUp()
{
    isWobblyKeyPressed := 0
    if (otherKeyPressedWhileWobblyKeyDown)
    {
        resetModifierWithoutTriggerUpState("lwin", winActive)
    }
    else
    {
        SetTimer TimerStickyFailBack, off
        SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%

        justBefore := min(timerTimeoutStickyKeys - 100, 500)
        SetTimer, TimerCancelWobblyKey, %justBefore%
    }
}

timerCancelWobblyKey()
{
    SetTimer, TimerCancelWobblyKey, OFF
    resetModifierWithoutTriggerUpState("lwin", winActive)
}
