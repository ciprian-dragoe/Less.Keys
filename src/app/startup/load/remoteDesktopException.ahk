global isRemoteDesktopActive

timerFixRemoteDesktopOverwritesLessKeys()
{
    If WinActive("ahk_class TscShellContainerClass")
    {
        if (isRemoteDesktopActive)
        {
            return
        }
        isRemoteDesktopActive := true
        Suspend, On
        Suspend, Off
    }
    else
    {
        isRemoteDesktopActive := false
    }
}