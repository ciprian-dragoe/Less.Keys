reloadApp()
{
    SetTimer TimerStickyFailBack, off
    Critical Off
    showToolTip("RELOADING")
    reload
}

displayDebugData()
{
    clipboard := debugStoredData
    msgbox % debugStoredData
}

storeDebugData(fileName = "")
{
    if (logStickyKeys)
    {
        if (!fileName)
        {
            fileName = %A_Hour%-%A_Min%-%A_Sec%-%A_MSec%-stored-log.txt
        }
        else
        {
            fileName = %fileName%-%A_Hour%-%A_Min%-%A_Sec%-%A_MSec%.txt
        }

        showtooltip(fileName)
        FileAppend, %debugStoredData%, %A_Desktop%\%fileName%
    }
}

getModifierStates()
{
    result := Object()
    result["winActive"] := GetKeyState("lwin")
    result["altActive"] := GetKeyState("alt")
    result["ctrlActive"] := GetKeyState("ctrl")
    result["shiftActive"] := GetKeyState("shift")
    return result
}

resetModifiersToState(state)
{
    if (state["altActive"])
    {
        send {alt down}
    }
    if (state["ctrlActive"])
    {
        send {ctrl down}
    }
    if (state["shiftActive"])
    {
        send {shift down}
    }
    if (state["winActive"])
    {
        send {lwin down}
    }
}

resetAllModifiers()
{
    dummy := 0
    resetModifierWithoutTriggerUpState("lwin", dummy)
    resetModifierWithoutTriggerUpState("alt", dummy)
    send {ctrl up}
    send {shift up}
}

sendTestMessage()
{
    originalState := getModifierStates()
    resetAllModifiers()
    send INTEGRATION_TEST
    resetModifiersToState(originalState)
}

exit()
{
    showToolTip("EXIT")
    exitApp
}