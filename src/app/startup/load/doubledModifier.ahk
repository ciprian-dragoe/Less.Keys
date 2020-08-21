global modifierDoubledAsClick := object()

readDoubledModifierSettings(path)
{
    IniRead, action, %path%, mouse, shiftDoubledAs
    modifierDoubledAsClick["shiftClick"] := action
    IniRead, action, %path%, mouse, ctrlDoubledAs
    modifierDoubledAsClick["ctrlClick"] := action    
    IniRead, action, %path%, mouse, winDoubledAs
    modifierDoubledAsClick["winClick"] := action
    IniRead, action, %path%, mouse, altDoubledAs
    modifierDoubledAsClick["altClick"] := action
}
