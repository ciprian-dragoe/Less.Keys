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

compilerPath := A_WorkingDir . "\..\docs\externalTools\compiler\Ahk2Exe.exe"
iconPath := A_WorkingDir . "\..\docs\externalTools\icon.ico"
sourcePathHookHandler := A_WorkingDir . "\app\hookHandler\startHookHandler_live.ahk"
sourcePathHookReader := A_WorkingDir . "\app\hookReader\startHookReader_live.ahk"
sourcePathLessKeys := A_WorkingDir . "\app\lessKeys\LessKeys_live.ahk"
outputPathHookHandler := A_WorkingDir . "\..\startHookHandler.exe"
outputPathHookReader := A_WorkingDir . "\..\startHookReader.exe"
outputPathLessKeys := A_WorkingDir . "\..\LessKeys.exe"
runwait, %compilerPath% /in %sourcePathHookHandler% /out %outputPathHookHandler%
handleError(ErrorLevel, sourcePathHookHandler)
runwait, %compilerPath% /in %sourcePathHookReader% /out %outputPathHookReader%
handleError(ErrorLevel, sourcePathHookHandler)
runwait, %compilerPath% /in %sourcePathLessKeys% /out %outputPathLessKeys% /icon %iconPath%
handleError(ErrorLevel, sourcePathHookHandler)

tooltip `n`n`n`n===Compile finished successful===`n`n`n`n
sleep 2000
exitapp
