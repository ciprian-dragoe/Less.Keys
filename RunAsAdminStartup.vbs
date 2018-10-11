Set WshShell = CreateObject("WScript.Shell" ) 
WshShell.Run """c:\Dropbox\PORTABLE_PROGRAMS\ahk\Navigare\KeyboardEnchancer\KeyboardEnchancer.exe""", 0 'Must quote command if it has spaces; must escape quotes
Set WshShell = Nothing