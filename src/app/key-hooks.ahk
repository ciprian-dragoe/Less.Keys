global navigationMode = 1



#If navigationMode = 1
    
    *escape::processKeyDown(layout["escape"])
    *escape up::processKeyUp(layout["escape"])
    
    *f1::processKeyDown(layout["F1"])
    *f1 up::processKeyUp(layout["F1"])
    
    *f2::processKeyDown(layout["F2"])
    *f2 up::processKeyUp(layout["F2"])
    
    *f3::processKeyDown(layout["F3"])
    *f3 up::processKeyUp(layout["F3"])
    
    *f4::processKeyDown(layout["F4"])
    *f4 up::processKeyUp(layout["F4"])
    
    *f5::processKeyDown(layout["F5"])
    *f5 up::processKeyUp(layout["F5"])
    
    *f6::processKeyDown(layout["F6"])
    *f6 up::processKeyUp(layout["F6"])
    
    *f7::processKeyDown(layout["F7"])
    *f7 up::processKeyUp(layout["F7"])
    
    *f8::processKeyDown(layout["F8"])
    *f8 up::processKeyUp(layout["F8"])
    
    *f9::processKeyDown(layout["F9"])
    *f9 up::processKeyUp(layout["F9"])
    
    *f10::processKeyDown(layout["F10"])
    *f10 up::processKeyUp(layout["F10"])
    
    *f11::processKeyDown(layout["F11"])
    *f11 up::processKeyUp(layout["F11"])
    
    *f12::processKeyDown(layout["F12"])
    *f12 up::processKeyUp(layout["F12"])
    
    *home::processKeyDown(layout["home"])
    *home up::processKeyUp(layout["home"])
            
    *end::processKeyDown(layout["end"])
    *end up::processKeyUp(layout["end"])
        
    *insert::processKeyDown(layout["insert"])
    *insert up::processKeyUp(layout["insert"])
            
    *delete::processKeyDown(layout["delete"])
    *delete up::processKeyUp(layout["delete"])
        
    *sc029::processKeyDown(layout["``"])
    *sc029 up::processKeyUp(layout["``"])        
    
    *1::processKeyDown(layout[1])
    *1 up::processKeyUp(layout[1])
    
    *2::processKeyDown(layout[2])
    *2 up::processKeyUp(layout[2])
        
    *3::processKeyDown(layout[3])
    *3 up::processKeyUp(layout[3])
    
    *4::processKeyDown(layout[4])
    *4 up::processKeyUp(layout[4])
    
    *5::processKeyDown(layout[5])
    *5 up::processKeyUp(layout[5])
    
    *6::processKeyDown(layout[6])
    *6 up::processKeyUp(layout[6])
            
    *7::processKeyDown(layout[7])
    *7 up::processKeyUp(layout[7])
    
    *8::processKeyDown(layout[8])
    *8 up::processKeyUp(layout[8])
        
    *9::processKeyDown(layout[9])
    *9 up::processKeyUp(layout[9])
    
    *0::processKeyDown(layout[0])
    *0 up::processKeyUp(layout[0])
    
    *-::processKeyDown(layout["-"])
    *- up::processKeyUp(layout["-"])
    
    *=::processKeyDown(layout["="])	
    *= up::processKeyUp(layout["="])
            
    *backspace::processKeyDown(layout["backspace"])
    *backspace up::processKeyUp(layout["backspace"])
        
    *tab::processKeyDown(layout["tab"])
    *tab up::processKeyUp(layout["tab"])
    
    *q::
        if (GetKeyState("Capslock", "P")) {
            processKeyDown("7")
        }
        else {
            processKeyDown(layout["q"])
        }
    return
    *q up::
        processKeyUp("6")
        processKeyUp(layout["q"])
    return
    
    *w::
        if (GetKeyState("Capslock", "P")) {
            processKeyDown("8")
        }
        else {
            processKeyDown(layout["w"])
        }
    return
    *w up::
        processKeyUp("8")
        processKeyUp(layout["w"])
    return
    
    *e::
        if (GetKeyState("Capslock", "P")) {
            processKeyDown("9")
        }
        else {
            processKeyDown(layout["e"])
        }
    return
    *e up::
        processKeyUp("9")
        processKeyUp(layout["e"])
    return
    
    *r::
        if (GetKeyState("Capslock", "P")) {
            processKeyDown("0")
        }
        else {
            processKeyDown(layout["r"])
        }
    return
    *r up::
        processKeyUp("0")
        processKeyUp(layout["r"])
    return
    
    *t::processKeyDown(layout["t"])
    *t up::processKeyUp(layout["t"])
    
    *y::processKeyDown(layout["y"])
    *y up::processKeyUp(layout["y"])
    
    *u::processKeyDown(layout["u"])
    *u up::processKeyUp(layout["u"])
    
    *i::processKeyDown(layout["i"])
    *i up::processKeyUp(layout["i"])
    
    *o::processKeyDown(layout["o"])
    *o up::processKeyUp(layout["o"])
    
    *p::processKeyDown(layout["p"])
    *p up::processKeyUp(layout["p"])
    
    *[::processKeyDown(layout["["])
    *[ up::processKeyUp(layout["["])
    
    *]::processKeyDown(layout["]"])	
    *] up::processKeyUp(layout["]"])
    
    *\::processKeyDown(layout["\"])	
    *\ up::processKeyUp(layout["\"])
            
    *capslock::return
    *capslock up::return
    
    *a::
        if (GetKeyState("Capslock", "P")) {
            processKeyDown("4")
        }
        else {
            processKeyDown(layout["a"])
        }
    return
    *a up::
        processKeyUp("4")
        processKeyUp(layout["a"])
    return
    
    *s::
        if (GetKeyState("Capslock", "P")) {
            processKeyDown("5")
        }
        else {
            processKeyDown(layout["s"])
        }
    return
    *s up::
        processKeyUp("5")
        processKeyUp(layout["s"])
    return
    
    *d::
        if (GetKeyState("Capslock", "P")) {
            processKeyDown("6")
        }
        else {
            processKeyDown(layout["d"])
        }
    return
    *d up::
        processKeyUp("6")
        processKeyUp(layout["d"])
    return
    
    *f::processKeyDown(layout["f"])
    *f up::processKeyUp(layout["f"])
    
    *g::processKeyDown(layout["g"])
    *g up::processKeyUp(layout["g"])
    
    *h::processKeyDown(layout["h"])
    *h up::processKeyUp(layout["h"])
    
    *j::processKeyDown(layout["j"])
    *j up::processKeyUp(layout["j"])
    
    *k::processKeyDown(layout["k"])
    *k up::processKeyUp(layout["k"])
    
    *l::processKeyDown(layout["l"])
    *l up::processKeyUp(layout["l"])
    
    *`;::processKeyDown(layout[";"])
    *`; up::processKeyUp(layout[";"])
    
    *'::processKeyDown(layout["'"])
    *' up::processKeyUp(layout["'"])
        
    *enter::processKeyDown(layout["enter"])
    *enter up::processKeyUp(layout["enter"])
            
    *z::
        if (GetKeyState("Capslock", "P")) {
            processKeyDown("1")
        }
        else {
            processKeyDown(layout["z"])
        }
    return
    *z up::
        processKeyUp("1")
        processKeyUp(layout["z"])
    return
    
    *x::
        if (GetKeyState("Capslock", "P")) {
            processKeyDown("2")
        }
        else {
            processKeyDown(layout["x"])
        }
    return
    *x up::
        processKeyUp("2")
        processKeyUp(layout["x"])
    return
    
    *c::
        if (GetKeyState("Capslock", "P")) {
            processKeyDown("3")
        }
        else {
            processKeyDown(layout["c"])
        }
    return
    *c up::
        processKeyUp("3")
        processKeyUp(layout["c"])
    return
    
    *v::processKeyDown(layout["v"])
    *v up::processKeyUp(layout["v"])
    
    *b::processKeyDown(layout["b"])
    *b up::processKeyUp(layout["b"])
    
    *n::processKeyDown(layout["n"])
    *n up::processKeyUp(layout["n"])
    
    *m::processKeyDown(layout["m"])
    *m up::processKeyUp(layout["m"])
    
    *sc033::processKeyDown(layout[","])
    *sc033 up::processKeyUp(layout[","])
    
    *sc034::processKeyDown(layout["."])
    *sc034 up::processKeyUp(layout["."])
    
    *sc035::processKeyDown(layout["/"])
    *sc035 up::processKeyUp(layout["/"])
    
    *space::processKeyDown(layout["space"])
    *space up::processKeyUp(layout["space"])
    
    *left::processKeyDown(layout["left"])
    *left up::processKeyUp(layout["left"])
    
    *down::processKeyDown(layout["down"])
    *down up::processKeyUp(layout["down"])
    
    *right::processKeyDown(layout["right"])
    *right up::processKeyUp(layout["right"])
    
    *up::processKeyDown(layout["up"])
    *up up::processKeyUp(layout["up"])
    
    *pgdn::processKeyDown(layout["pgdn"])
    *pgdn up::processKeyUp(layout["pgdn"])
    
    *pgup::processKeyDown(layout["pgup"])
    *pgup up::processKeyUp(layout["pgup"])
    
    *appskey::processKeyDown(layout["appskey"])
    *appskey up::processKeyUp(layout["appskey"])
    
    *printscreen::processKeyDown(layout["printscreen"])
    *printscreen up::processKeyUp(layout["printscreen"])
    
    *lctrl::processKeyDown(layout["lctrl"])
    *lctrl up::processKeyUp(layout["lctrl"])
        
    *rctrl::processKeyDown(layout["rctrl"])
    *rctrl up::processKeyUp(layout["rctrl"])
        
    *lalt::processKeyDown(layout["lalt"])
    *lalt up::processKeyUp(layout["lalt"])
        
    *ralt::processKeyDown(layout["ralt"])
    *ralt up::processKeyUp(layout["ralt"])
    
    *lshift::processKeyDown(layout["lshift"])
    *lshift up::processKeyUp(layout["lshift"])
    
    *rshift::processKeyDown(layout["rshift"])
    *rshift up::processKeyUp(layout["rshift"])
    
	*pause::processKeyDown(layout["pause"])
    *pause up::processKeyUp(layout["pause"])

	*MButton::processKeyDown(layout["MButton"])
    *MButton up::processKeyUp(layout["MButton"])

	*XButton1::processKeyDown(layout["XButton1"])
    *XButton1 up::processKeyUp(layout["XButton1"])

	*XButton2::processKeyDown(layout["XButton2"])
    *XButton2 up::processKeyUp(layout["XButton2"])


;-------------------- END OF keys that will be processed
#if
