global timeoutStillSendLayoutKey := 0
global timeoutProcessLayoutOnRelease := 0
global timeoutFixQuickTypeLeftRightDoubledModifiers := 0

readTimingSettings(path)
{
    IniRead, timeoutFixQuickTypeLeftRightDoubledModifiers, %path%, timings, timeoutFixQuickTypeLeftRightDoubledModifiers
    IniRead, timeoutStillSendLayoutKey, %path%, timings, timeoutStillSendLayoutKey
    IniRead, timeoutProcessLayoutOnRelease, %path%, timings, timeoutProcessLayoutOnRelease
}
