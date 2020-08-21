tooltip Compile started

compilerPath := A_WorkingDir . "\..\docs\externalTools\Ahk2Exe.exe"
iconPath := A_WorkingDir . "\..\docs\externalTools\icon.ico"
sourcePath := A_WorkingDir . "\startDevelopment.ahk"
outputPath := A_WorkingDir . "\app\environmentDependent\development\binaries\LessKeys.exe"
runwait, %compilerPath% /in %sourcePath% /out %outputPath% /icon  %iconPath%

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
