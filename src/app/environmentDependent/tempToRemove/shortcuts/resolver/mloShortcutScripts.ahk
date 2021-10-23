global MLO_CLASS_NAME := "TfrmMyLifeMain"
global MLO_TASK_WINDOWS_NAME :="TVirtualStringTree5_"
global MLO_FILTER_WINDOWS_NAME :="TEdit2_"
global MLO_NAME := "MyLifeOrganized"
global MLO_MOVE_UP_PIXELS
global MLO_WINDOW_NAME := "MyLifeOrganized"



if (A_ComputerName = ACTIVE_COMPUTER_1) {
    MLO_MOVE_UP_PIXELS := -115
}
else if (A_ComputerName = ACTIVE_COMPUTER_2) {
    MLO_MOVE_UP_PIXELS := -115
}
else if (A_ComputerName = ACTIVE_COMPUTER_3) {
    MLO_MOVE_UP_PIXELS := -115
}

setContextMlo(number)
{
    send !l ; context window
    sleep 100
    send %number%
    send {space}
    send {enter}
    hideNotesAndFocusTasks()
}

changeViewMlo(viewCombination, extraInstructions)
{
    sendKeyCombinationIndependentActiveModifiers("!/") ; unzoom
    sendKeyCombinationIndependentActiveModifiers("^+!-") ; schimb workspace taskuri focus
    sleep 50
    sendKeyCombinationIndependentActiveModifiers(viewCombination)
    for index , instruction in extraInstructions
    {
        sleep 50
        sendKeyCombinationIndependentActiveModifiers(instruction)
    }
}

contextDependentView()
{
    extraInstructions := ["{home}"]
    if (A_Hour >= 5 && A_Hour < 9)
    {
        ; ========== PLANIFIC
        extraInstructions := ["{F7}", "{home}"]
        changeViewMlo("^+9", extraInstructions)
    }
    else if (A_Hour >= 9 && A_Hour < 18 && (A_DDDD = "Saturday"))
    {
        ; ========== HOBBY
        changeViewMlo("^+3", extraInstructions)
    }
    else if (A_Hour >= 9 && A_Hour < 18 && (A_DDDD = "Monday" || A_DDDD = "Tuesday" || A_DDDD = "Wednesday" || A_DDDD = "Thursday" || A_DDDD = "Friday"))
    {
        ; ========== SERVICI
        changeViewMlo("^+2", extraInstructions)
    }
    else if (A_Hour >= 18 && A_Hour < 21 && (A_DDDD = "Monday" || A_DDDD = "Tuesday" || A_DDDD = "Wednesday" || A_DDDD = "Thursday" || A_DDDD = "Friday"))
    {
        ; ========== ADMIN
        changeViewMlo("^+1", extraInstructions)
    }
    else if (A_Hour >= 21 && A_Hour < 25)
    {
        ; ========== PLANIFIC
        extraInstructions := ["{F7}", "{home}"]
        changeViewMlo("^+9", extraInstructions)
    }
    else
    {
        ; ========== PLANIFIC
        extraInstructions := ["{F7}", "{home}"]
        changeViewMlo("^+9", extraInstructions)
    }
}

mloCloseFind()
{
    sendKeyCombinationIndependentActiveModifiers("^+!-") ; schimb workspace taskuri focus
}

mloShowFind()
{
    sendKeyCombinationIndependentActiveModifiers("^+!=") ; schimb workspace all tasks
    sendKeyCombinationIndependentActiveModifiers("^+=") ; schimb view search
    sleep 500
    sendKeyCombinationIndependentActiveModifiers("{home}") ; unfold all tasks
    ControlClick, TEdit3, A,,,, NA
    ControlClick, TEdit2, A,,,, NA
    sendKeyCombinationIndependentActiveModifiers("^a")
    sendKeyCombinationIndependentActiveModifiers("{backspace}")
    sleep 300
    sendKeyCombinationIndependentActiveModifiers("{F7}") ; unfold all tasks
    sleep 300
    sendKeyCombinationIndependentActiveModifiers("{F7}") ; unfold all tasks
}

moveNoteWindowAndSetCursorEnd(direction)
{
    if (!isTaskWindowInFocus())
    {
        send ^{%direction%}
        sleep 200
        send ^{end}
    }
    else
    {
        send ^{%direction%}
    }
}

toggleMaximizeMloWindow()
{
    WinGetClass, activeProgramWindowClass, A
    if (activeProgramWindowClass = MLO_CLASS_NAME)
    {
        WinMinimize, A
    }
    else
    {
        SetTitleMatchMode, 2
        WinActivate, %MLO_NAME%, , 2
        WinWait, %MLO_NAME%, , 2
        setMloWindowPosition()
    }
}

setMloWindowPosition()
{
    WinMove, , %MLO_MOVE_UP_PIXELS%
}

hideShowMLOnotes()
{
    If (isTaskWindowInFocus())
    {
        openNotesAssociatedWithTask()
    }
    else
    {
        hideNotesAndFocusTasks()
    }
}

isTaskWindowInFocus()
{
    ControlGetFocus, activeWindowNow, A
    activeWindowNow := activeWindowNow . "_"  ; transform into a string so that comparison can work
    IfInString, MLO_TASK_WINDOWS_NAME, %activeWindowNow%
    {
        return 1
    }
    else
    {
        return 0
    }
}

openNotesAssociatedWithTask()
{
    failSafeCounter := 20
    sendKeyCombinationIndependentActiveModifiers("!1")
    Loop, %failSafeCounter%
    {
        failSafeCounter--
        if (!isTaskWindowInFocus())
        {
            sendKeyCombinationIndependentActiveModifiers("^{end}")
            break
        }
        sleep 100
    }
}

hideNotesAndFocusTasks()
{
    sendKeyCombinationIndependentActiveModifiers("!{F2}") ; shortcut MLO hide properties window
}

synthesisTemplateMLO()
{
    openNotesAssociatedWithTask()
    sendKeyCombinationIndependentActiveModifiers("^a")
    sendKeyCombinationIndependentActiveModifiers("+{left}")
    sendKeyCombinationIndependentActiveModifiers("^c")
    hideNotesAndFocusTasks()
    sendKeyCombinationIndependentActiveModifiers("!w")
    sleep 100
    sendKeyCombinationIndependentActiveModifiers("%A_DD%.%A_MM%.%A_YYYY% [%A_Hour%]-[%A_Min%] | ^v")
    sendKeyCombinationIndependentActiveModifiers("{enter}")
    sleep 100
}

journalTemplateMLO()
{
    time = 100
    openNotesAssociatedWithTask()
    sendKeyCombinationIndependentActiveModifiers("^a")
    sendKeyCombinationIndependentActiveModifiers("+{left 2}")
    sendKeyCombinationIndependentActiveModifiers("^c")
    hideNotesAndFocusTasks()
    sleep %time%
    sendKeyCombinationIndependentActiveModifiers("^d")
    sleep %time%
    sendKeyCombinationIndependentActiveModifiers("{down}")
    sleep %time%
    sendKeyCombinationIndependentActiveModifiers("{enter}")
    sleep %time%
    sendKeyCombinationIndependentActiveModifiers("%A_DD%.%A_MM%.%A_YYYY% [%A_Hour%]-[%A_Min%] | ^v")
    sendKeyCombinationIndependentActiveModifiers("{enter}")
    sleep %time%
    sendKeyCombinationIndependentActiveModifiers("^+a") ; toggle folder
    sleep %time%
    sendKeyCombinationIndependentActiveModifiers("{right}")
}

rapidTaskEntry()
{
    sendKeyCombinationIndependentActiveModifiers("#!]") ; shortcut MLO for rapid task entry
    SetTimer TimerActivateMloRapidTaskWindow, 200
}

timerActivateMloRapidTaskWindow()
{
    If WinExist("Rapid Task Entry")
    {
        SetTimer TimerActivateMloRapidTaskWindow, OFF
        WinActivate ahk_class TfrmQuickAddMLOTask, , 2

        WinMove, A,, 0, 0, (A_ScreenWidth), 500
    }
}


; reduce scroll bar width in windows https://www.thewindowsclub.com/windows-8-scroll-bar-hard-see-change-windows-8-scrollbar-width
setMloDarkMode(enabled)
{
    if (enabled)
    {
        topWidth := A_ScreenWidth + 10
        topHeight := 155
        topX := -10
        topY := -10
        Gui, top:new
        Gui, +toolwindow -caption +alwaysontop
        Gui, color , 000000  ; set color value RGB
        Gui, top:show, w%topWidth% h%topHeight% x%topX% y%topY%

        bottomWidth := A_ScreenWidth + 10
        bottomHeight := 60
        bottomX := -10
        bottomY := A_ScreenHeight - bottomHeight
        Gui, bottom:new
        Gui, +toolwindow -caption +alwaysontop
        Gui, color , 000000  ; set color value RGB
        Gui, bottom:show, w%bottomWidth% h%bottomHeight% x%bottomX% y%bottomY%

        leftWidth := 20
        leftHeight := A_ScreenHeight + 20
        leftX := -10
        leftY := 0
        Gui, left:new
        Gui, +toolwindow -caption +alwaysontop
        Gui, color , 000000  ; set color value RGB
        Gui, left:show, w%leftWidth% h%leftHeight% x%leftX% y%leftY%

        rightWidth := 70
        rightHeight := A_ScreenHeight + 20
        rightX := A_ScreenWidth - 28
        rightY := 0
        Gui, right:new
        Gui, +toolwindow -caption +alwaysontop
        Gui, color , 000000  ; set color value RGB
        Gui, right:show, w%rightWidth% h%rightHeight% x%rightX% y%rightY%
    }
    else
    {
        Gui, top:destroy
        Gui, bottom:destroy
        Gui, left:destroy
        Gui, right:destroy
    }
}
