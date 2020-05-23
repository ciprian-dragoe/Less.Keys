readMouseSettings(path)
{
    IniRead, timeoutMouseScrollPoll, %path%, mouse, scrollPoll
    IniRead, mouseScrollAcceleration, %path%, mouse, scrollAcceleration    
}
