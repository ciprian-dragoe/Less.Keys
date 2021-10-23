global FREEPLANE_MOVE_UP_PIXELS
global FREEPLANE_MOVE_LEFT_PIXELS
global FREEPLANE_NOTE_WINDOW_NAME := "Edit note"
global FREEPLANE_WINDOW_NAME := "Freeplane"
global FREEPLANE_CLASS_NAME := "SunAwtDialog"


if (A_ComputerName = ACTIVE_COMPUTER_1) ; lenovo-x230
{
    FREEPLANE_MOVE_UP_PIXELS := -133
    FREEPLANE_MOVE_LEFT_PIXELS := -11
}
else if (A_ComputerName = ACTIVE_COMPUTER_2) ; CIPI-ASUS-ROG
{
    FREEPLANE_MOVE_UP_PIXELS := -158
    FREEPLANE_MOVE_LEFT_PIXELS := -14
}
else if (A_ComputerName = ACTIVE_COMPUTER_3) ; yoga-cipi
{
    FREEPLANE_MOVE_UP_PIXELS := -220 ; 2560resolution_150scale_14screen
    FREEPLANE_MOVE_LEFT_PIXELS := -15 ; 2560resolution_150scale_14screen
}

ShowFreeplaneNotes(windowName)
{
    sendKeyCombinationIndependentActiveModifiers("^[")
    WinWaitActive, %windowName%, ,2
    IfWinActive, %windowName%
    {
        WinMove %FREEPLANE_MOVE_LEFT_PIXELS%, %FREEPLANE_MOVE_UP_PIXELS%
    }
}


CloseFreeplaneNotes()
{
    while (ctrlActive)
    {
        sleep 22
    }
    sendKeyCombinationIndependentActiveModifiers("!{enter}")
}


freeplaneTemplate(templateNumber)
{
    sendKeyCombinationIndependentActiveModifiers("^o")
    WinWaitActive, ahk_class SunAwtDialog, , 2
    sleep 100
    sendKeyCombinationIndependentActiveModifiers("+{tab}")
    sleep 100
    sendKeyCombinationIndependentActiveModifiers(templateNumber)
    sleep 100
    sendKeyCombinationIndependentActiveModifiers("{enter}")
    sleep 300
    sendKeyCombinationIndependentActiveModifiers("^+s")
    WinWaitActive, ahk_class SunAwtDialog, , 2
    sendKeyCombinationIndependentActiveModifiers("+{tab}")
    sendKeyCombinationIndependentActiveModifiers("templateNumber")
    sendKeyCombinationIndependentActiveModifiers("{f2}")
    sleep 50
    sendKeyCombinationIndependentActiveModifiers("{right}{shift down}{home}{right 2}{shift up}^c{escape}")
    sleep 200
    sendKeyCombinationIndependentActiveModifiers("{tab}")
    sleep 200
    sendKeyCombinationIndependentActiveModifiers("^v - %A_YYYY%.%A_MM%.%A_DD% [%A_Hour%]-[%A_Min%]")
    sendKeyCombinationIndependentActiveModifiers("{enter}")
}
