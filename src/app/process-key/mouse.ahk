global initialMousePositionXAxis
global initialMousePositionYAxis



TimerGetMouseMovement:
    CoordMode, Mouse, Screen
    MouseGetPos, xpos, ypos
    differenceY := initialMousePositionYAxis - ypos
    differenceX := initialMousePositionXAxis - xpos
    if (abs(differenceY) > abs(differenceX)) {
        systemCursor(0)
        sendLayoutKey := false
        if (differenceY > 0) {
            SendInput {wheelup}
        }
        else {
            SendInput {wheeldown}
        }
    }
    if (abs(differenceX) > abs(differenceY)) {
        systemCursor(0)
        sendLayoutKey := false
        if (differenceX > 0) {
            SendInput {WheelLeft}
        }
        else {
            SendInput {WheelRight}
        }
    }
    DllCall("SetCursorPos", "int", initialMousePositionXAxis, "int", initialMousePositionYAxis) 
return


systemCursor(OnOff) {
    static AndMask, XorMask, $, h_cursor
        ,c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13 ; system cursors
        , b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13   ; blank cursors
        , h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,h12,h13   ; handles of default cursors
    if ($ = "") {        ; init when requested or at first call
            $ = h                                          ; active default cursors
            VarSetCapacity( h_cursor,4444, 1 )
            VarSetCapacity( AndMask, 32*4, 0xFF )
            VarSetCapacity( XorMask, 32*4, 0 )
            system_cursors = 32512,32513,32514,32515,32516,32642,32643,32644,32645,32646,32648,32649,32650
            StringSplit c, system_cursors, `,
            Loop %c0%
            {
                h_cursor   := DllCall( "LoadCursor", "Ptr",0, "Ptr",c%A_Index% )
                h%A_Index% := DllCall( "CopyImage", "Ptr",h_cursor, "UInt",2, "Int",0, "Int",0, "UInt",0 )
                b%A_Index% := DllCall( "CreateCursor", "Ptr",0, "Int",0, "Int",0
                    , "Int",32, "Int",32, "Ptr",&AndMask, "Ptr",&XorMask )
            }
    }
    if (!OnOff) {
        $ = b  ; use blank cursors
    }
    else {
        $ = h  ; use the saved cursors
    }
    Loop %c0%
    {
        h_cursor := DllCall( "CopyImage", "Ptr",%$%%A_Index%, "UInt",2, "Int",0, "Int",0, "UInt",0 )
        DllCall( "SetSystemCursor", "Ptr",h_cursor, "UInt",c%A_Index% )
    }
}
