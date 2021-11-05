tooltip `n`n`n`n===Compile Started===`n`n`n`n

handleError(error, source)
{
    if (error)
    {
        tooltip
        sleep 500
        tooltip Error appeared during compilation with code %ErrorLevel%`n`n%source%
        sleep 2000
        exitApp
    }
}

compilerPath := A_WorkingDir . "\..\..\docs\externalTools\compiler\Ahk2Exe.exe"
iconPath := A_WorkingDir . "\..\..\docs\externalTools\icon.ico"
sourcePathHookHandler := A_WorkingDir . "\..\hookHandler\startHookHandler_development.ahk"
sourcePathHookReader := A_WorkingDir . "\..\hookReader\startHookReader_development.ahk"
sourcePathLessKeys := A_WorkingDir . "\..\lessKeys\LessKeys_development.ahk"
outputPathHookHandler := A_WorkingDir . "\..\environmentDependent\development\binaries\startHookHandler.exe"
outputPathHookReader := A_WorkingDir . "\..\environmentDependent\development\binaries\startHookReader.exe"
outputPathLessKeys := A_WorkingDir . "\..\environmentDependent\development\binaries\LessKeys.exe"
runwait, %compilerPath% /in %sourcePathHookHandler% /out %outputPathHookHandler%
handleError(ErrorLevel, sourcePathHookHandler)
runwait, %compilerPath% /in %sourcePathHookReader% /out %outputPathHookReader%
handleError(ErrorLevel, sourcePathHookHandler)
runwait, %compilerPath% /in %sourcePathLessKeys% /out %outputPathLessKeys% /icon %iconPath%
handleError(ErrorLevel, sourcePathHookHandler)

tooltip `n`n`n`n===Compile finished successful===`n`n`n`n
sleep 2000
exitapp
