global initialMousePositionXAxis
global initialMousePositionYAxis
global mouseScrollAcceleration
global totalDifferenceXAxis := 0
global totalDifferenceYAxis := 0
global timeoutMouseScrollPoll
global sendRightMouseButton
global lastScrollState

timerScrollWithMouseMovement()
{
    CoordMode, Mouse, Screen
    MouseGetPos, xpos, ypos
    differenceY := initialMousePositionYAxis - ypos
    differenceX := initialMousePositionXAxis - xpos
    if (differenceY != 0 || differenceY != 0) {
        systemCursor(0)
        SetTimer, TimerShowMouse, OFF
        SetTimer, TimerShowMouse, 300
        direction := getScrollDirection(differenceY, differenceX)
        amount := getScrollAmount()
        initiateScroll(direction, amount)
    }
    
    DllCall("SetCursorPos", "int", initialMousePositionXAxis, "int", initialMousePositionYAxis)
}

getScrollDirection(differenceY, differenceX) {
    if (abs(differenceY) > abs(differenceX)) {
        if (totalDifferenceYAxis * differenceY < 0) {
            totalDifferenceYAxis := 0
        }
        totalDifferenceYAxis := totalDifferenceYAxis + differenceY
        if (totalDifferenceYAxis > 0) {
            return "wheelup"
        } else {
            return "wheeldown"
        }
    } else {
        if (totalDifferenceXAxis * differenceX < 0) {
            totalDifferenceXAxis := 0
        }
        totalDifferenceXAxis := totalDifferenceXAxis + differenceX
        if (totalDifferenceXAxis > 0) {
            return "wheelleft"
        } else {
            return "wheelright"
        }
    }
}

getScrollAmount() {
    return max(ceil(abs(totalDifferenceXAxis / mouseScrollAcceleration)), ceil(abs(totalDifferenceYAxis / mouseScrollAcceleration)))
}

initiateScroll(direction, amount) {
    loop %amount% {
        SendInput {blind}{%direction%}
    }
    if (amount) {
        totalDifferenceYAxis := 0
        totalDifferenceXAxis := 0
        sendLayoutKey := false
        sendRightMouseButton := false
    }
}

systemCursor(OnOff) {
    if (OnOff = lastScrollState)
    {
        return
    }

    lastScrollState := OnOff
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
