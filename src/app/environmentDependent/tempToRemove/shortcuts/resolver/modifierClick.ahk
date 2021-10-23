global MLO_OVERLAY_ACTIVE := 0


activateWin1()
{
    send {blind}^{left}
    send {blind}1
    SetTimer, TimerMloDarkMode, 500
}

activateWin2()
{
    send {blind}^{left}
    send {blind}2
}

activateWin3()
{
    send {blind}^{left}
    send {blind}3
}

activateWin4()
{
    send {blind}^{left}
    send {blind}4
}

activateWin5()
{
    send {blind}^{left}
    send {blind}5
}

activateWin6()
{
    send {blind}^{left}
    send {blind}6
}

activateWin7()
{
    send {blind}^{left}
    send {blind}7
}

activateWin8()
{
    send {blind}8
}

activateWin9()
{
    send {blind}^{left}
    send {blind}9
}

activateWin0()
{
    send {blind}^{left}
    send {blind}0
}

timerMloDarkMode()
{
    mloActive := WinActive("01-MY-LIST.ml")
    if (mloActive)
    {
        if (!MLO_OVERLAY_ACTIVE)
        {
            MLO_OVERLAY_ACTIVE := 1
            setMloDarkMode(1)
            WinActivate ahk_class TfrmMyLifeMain, , 2 ; reselect mlo because overlay is not selected
        }
    }
    else
    {
        SetTimer TimerMloDarkMode, OFF
        MLO_OVERLAY_ACTIVE := 0
        setMloDarkMode(0)
    }
}
