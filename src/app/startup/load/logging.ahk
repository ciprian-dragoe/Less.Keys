global logInput := 0
global logStickyKeys := 0


readLoggingSettings(path)
{
    IniRead, logInput, %path%, logging, logInput
    IniRead, logStickyKeys, %path%, logging, logStickyKeys
}
