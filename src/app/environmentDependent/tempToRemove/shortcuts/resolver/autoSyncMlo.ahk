global SYNC_MLO := 0
global INTERNET_ACCESS := 1

timerCancelTooltip()
{
    tooltip
}

timerSyncMlo()
{
    if (!inStr(lastActiveAppName, ".ml - MyLifeOrganized" . " *") && !inStr(lastActiveAppName, "Rapid Task Entry") && !inStr(lastActiveAppName, "MyLifeOrganized - Reminders"))
    {
        ;showtooltip("`n`n`n`n`n`n`n`n`n" . "                           SYNC                           ;"  . "`n`n`n`n`n`n`n`n`n")
        timerSyncMloStep1_launchPing()
    }
}

timerCheckAfterSyncReminders()
{
    if (WinExist("MyLifeOrganized - Reminders"))
    {
        tooltip, `n`n`n`n`n========= CHECK REMINDERS =========`n`n`n`n`n
        SetTimer TimerCheckAfterSyncReminders, OFF
        SetTimer TimerCancelTooltip, OFF
        SetTimer TimerCancelTooltip, 1000
    }
}

timerCheckReminder()
{
    if (WinExist("MyLifeOrganized - Reminders"))
    {
        SetTimer TimerCheckMloChange, OFF
        SetTimer TimerCheckAfterSyncReminders, OFF
        SetTimer TimerCheckAfterSyncReminders, 30000
        timerSyncMloStep1_launchPing()
    }
}

timerCheckMloChange()
{
    if (inStr(lastActiveAppName, ".ml - MyLifeOrganized" . " *") || inStr(lastActiveAppName, "Rapid Task Entry") || inStr(lastActiveAppName, "MyLifeOrganized - Reminders"))
    {
        SYNC_MLO := 1
        resetTimerSyncMlo()
    }
    else if (SYNC_MLO)
    {
        resetTimerSyncMlo()
        SYNC_MLO := 0
        timerSyncMloStep1_launchPing()
    }
}

timerSyncMloStep1_launchPing()
{
    Run,%comspec% /c ping -n 2 -w 200 bing.com > %A_Temp%\ping.log,,hide
    SetTimer TimerSyncMloStep2_readPing, OFF
    SetTimer TimerSyncMloStep2_readPing, 4000
}

timerSyncMloStep2_readPing()
{
    SYNC_MLO := 0
    SetTimer TimerSyncMloStep2_readPing, OFF
    SetTimer TimerCheckMloChange, OFF

    fileread , StrTemp, %A_Temp%\ping.log
    StrTemp := trim(StrTemp)
    stringsplit , TempArr, StrTemp, =
    ifinstring, TempArr%TempArr0%, ms
    {
        INTERNET_ACCESS := 1
        ControlSend, , {F9}, ahk_class %MLO_CLASS_NAME%
    }
    else
    {
        INTERNET_ACCESS := 0
        ControlSend, , ^s, ahk_class %MLO_CLASS_NAME%
    }
    SetTimer TimerCheckMloChange, OFF
    SetTimer TimerCheckMloChange, 1000
}

resetTimerSyncMlo()
{
    SetTimer TimerSyncMloStep2_readPing, OFF
}
