global modifierDoubledAsClick := object()

readMouseSettings(path)
{
    IniRead, timeoutMouseScrollPoll, %path%, mouse, scrollPoll
    IniRead, mouseScrollAcceleration, %path%, mouse, scrollAcceleration
    
    IniRead, action, %path%, mouse, shiftDoubledAs
    modifierDoubledAsClick["shiftClick"] := action
    IniRead, action, %path%, mouse, ctrlDoubledAs
    modifierDoubledAsClick["ctrlClick"] := action    
}
