global accentedCharacter = object()
global accentedCharacterSiblingCode = object()

Loop, Read, %PATH_APP_CONFIGURATION%accentedCharacterMapping.cfg
{
    accentedKey := StrSplit(A_LoopReadLine, "`:").1
    keyCode := StrSplit(A_LoopReadLine, "`:").2
    siblingCode := StrSplit(A_LoopReadLine, "`:").3
    accentedCharacterSiblingCode["+" . keyCode] := siblingCode
    accentedCharacter[accentedKey] := keyCode 
}
