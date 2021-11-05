global logInput := 0


readLoggingSettings(path)
{
    IniRead, logInput, %path%, logging, logInput
}
