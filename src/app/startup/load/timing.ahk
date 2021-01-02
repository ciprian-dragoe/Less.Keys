global timeoutStillSendLayoutKey := 0
global timeoutProcessLayoutOnRelease := 0
global minimumDelayBetweenSameKeyUpAndDown := 0

readTimingSettings(path)
{
    IniRead, timeoutStillSendLayoutKey, %path%, timings, timeoutStillSendLayoutKey
    IniRead, minimumDelayBetweenSameKeyUpAndDown, %path%, timings, minimumDelayBetweenSameKeyUpAndDown
    IniRead, timeoutProcessLayoutOnRelease, %path%, timings, timeoutProcessLayoutOnRelease
}
