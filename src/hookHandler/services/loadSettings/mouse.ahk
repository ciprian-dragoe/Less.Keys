readMouseSettings(path)
{
    IniRead, timeoutMouseScrollPoll, %path%, mouse, scrollPoll
    timeoutMouseScrollPoll := Max(timeoutMouseScrollPoll, 50)
    IniRead, mouseScrollAcceleration, %path%, mouse, scrollAcceleration
}
