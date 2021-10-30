global timeoutStillSendLayoutKey := 0
global timeoutProcessLayoutOnRelease := 0


readTimingSettings(path)
{
    IniRead, timeoutStillSendLayoutKey, %path%, timings, timeoutStillSendLayoutKey
    IniRead, timeoutProcessLayoutOnRelease, %path%, timings, timeoutProcessLayoutOnRelease
}
