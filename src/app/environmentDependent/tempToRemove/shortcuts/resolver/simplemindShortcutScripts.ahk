global SIMPLEMIND_MOVE_UP_PIXELS
global SIMPLEMIND_MOVE_LEFT_PIXELS


global SIMPLEMIND_NOTE_WINDOW_NAME := "Topic Properties"
global SIMPLEMIND_WINDOW_NAME := "SimpleMind"
global SIMPLEMIND_CLASS_NAME := "SunAwtDialog"


if (A_ComputerName = DEBUG_COMPUTER_1) {
    SIMPLEMIND_MOVE_UP_PIXELS := -55
    SIMPLEMIND_MOVE_LEFT_PIXELS := -10
} else if (A_ComputerName = DEBUG_COMPUTER_2) {
    SIMPLEMIND_MOVE_UP_PIXELS := -140
    SIMPLEMIND_MOVE_LEFT_PIXELS := -14
} else if (A_ComputerName = DEBUG_COMPUTER_3){
    SIMPLEMIND_MOVE_UP_PIXELS := -100
    SIMPLEMIND_MOVE_LEFT_PIXELS := -10
}


ShowSimplemindNotes(windowName)
{
    send ^w
    WinWaitActive, %windowName%, ,2
    IfWinActive, %windowName%
    {
        WinMaximize
        WinMove %SIMPLEMIND_MOVE_LEFT_PIXELS%, %SIMPLEMIND_MOVE_UP_PIXELS%
    }
}


CloseSimplemindNotes()
{
    send {tab}{enter}
}
