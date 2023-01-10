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
    SetTimer TimerStickyFailBack, off
    SetTimer TimerStickyFailBack, %timerTimeoutStickyKeys%
    if (otherKeyPressedWhileWobblyKeyDown = 2)
    {
        ; to avoid bug in windows when where when pressing Win + (number)x and that 
        ; application is a stacked window, a tooltip remains always displayed if 
        ; win key is released before the animation finishes 
        SetTimer, TimerCancelWobblyKey, OFF
        SetTimer, TimerCancelWobblyKey, 250
    }
    else if (otherKeyPressedWhileWobblyKeyDown)
    {
        timerCancelWobblyKey()        
    }
    else
    {
        justBefore := min(timerTimeoutStickyKeys - 100, wobblyKeyTimeout)
        SetTimer, TimerCancelWobblyKey, OFF
        SetTimer, TimerCancelWobblyKey, %justBefore%
    }
}

timerCancelWobblyKey()
{
    SetTimer, TimerCancelWobblyKey, OFF
    resetModifierWithoutTriggerUpState("lwin", winActive)
}
