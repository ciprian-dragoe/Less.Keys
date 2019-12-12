If WScript.Arguments.length = 0 Then

  Set objShell = CreateObject("Shell.Application")
   'Pass a bogus argument, say [ uac]
  objShell.ShellExecute "wscript.exe", Chr(34) & _
    WScript.ScriptFullName & Chr(34) & " uac", "", "runas", 1

Else

    Set objShell= CreateObject("Shell.Application")

    strComputer = "."
    Const HIGH_PRIORITY = 128
    processName = "LessKeys.exe"   ' The process name of your app
    appName = "c:\Users\cipri\OneDrive\PORTABLE_PROGRAMS\ahk\Navigare\LessKeys\\LessKeys.exe" ' The app you want to run

    objShell.ShellExecute appName, , , "runas", 1

    Set objWMIService = GetObject("winmgmts:" _
        & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")

    Set colProcesses = objWMIService.ExecQuery _
        ("Select * from Win32_Process Where Name = '" & processName & "'")

    For Each p in colProcesses  
        p.SetPriority(HIGH_PRIORITY)
    Next

End If