tooltip Compile started
runwait, ".\compile\externalTools\Ahk2Exe.exe" /in startDevelopment.ahk /out ".\compile\binaries\development\LessKeys.exe" /icon ".\compile\icon.ico"

if (ErrorLevel)
{
    tooltip Error appeared during compilation with code %ErrorLevel%
}
else
{
    tooltip Compile finished successful
}
sleep 1000

exitapp