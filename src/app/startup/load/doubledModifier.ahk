global modifierDoubledAsClick := object()

readDoubledModifierSettings(path)
{
    IniRead, action, %path%, mouse, leftShiftDoubledAs
    modifierDoubledAsClick["leftShiftClick"] := action
    IniRead, action, %path%, mouse, leftCtrlDoubledAs
    modifierDoubledAsClick["leftCtrlClick"] := action
    IniRead, action, %path%, mouse, leftWinDoubledAs
    modifierDoubledAsClick["leftWinClick"] := action
    IniRead, action, %path%, mouse, leftAltDoubledAs
    modifierDoubledAsClick["leftAltClick"] := action
    IniRead, action, %path%, mouse, rightShiftDoubledAs
    modifierDoubledAsClick["rightShiftClick"] := action
    IniRead, action, %path%, mouse, rightCtrlDoubledAs
    modifierDoubledAsClick["rightCtrlClick"] := action
    IniRead, action, %path%, mouse, rightWinDoubledAs
    modifierDoubledAsClick["rightWinClick"] := action
    IniRead, action, %path%, mouse, rightAltDoubledAs
    modifierDoubledAsClick["rightAltClick"] := action
}
