global modifierDoubledAsClick := object()
global alternativeModifierDoubledAsClick := object()


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

    IniRead, action, %path%, mouse, alternativeLeftShiftDoubledAs
    alternativeModifierDoubledAsClick["leftShiftClick"] := action
    IniRead, action, %path%, mouse, alternativeLeftCtrlDoubledAs
    alternativeModifierDoubledAsClick["leftCtrlClick"] := action
    IniRead, action, %path%, mouse, alternativeLeftWinDoubledAs
    alternativeModifierDoubledAsClick["leftWinClick"] := action
    IniRead, action, %path%, mouse, alternativeLeftAltDoubledAs
    alternativeModifierDoubledAsClick["leftAltClick"] := action
    IniRead, action, %path%, mouse, alternativeRightShiftDoubledAs
    alternativeModifierDoubledAsClick["rightShiftClick"] := action
    IniRead, action, %path%, mouse, alternativeRightCtrlDoubledAs
    alternativeModifierDoubledAsClick["rightCtrlClick"] := action
    IniRead, action, %path%, mouse, alternativeRightWinDoubledAs
    alternativeModifierDoubledAsClick["rightWinClick"] := action
    IniRead, action, %path%, mouse, alternativeRightAltDoubledAs
    alternativeModifierDoubledAsClick["rightAltClick"] := action
}
