global playlistName := { q:"001_NOW", w:"002_TANTRIC", e:"003_FALLING_ASLEEP", r:"004_LOVE_SONGS", t:"005_COLINDE", y:"006_CANTECE_MUNTE", u:"007_REFLECT", i:"008_ENERGY_CONFIDENT", o:"009_CONFRONTING_FEAR", p:"010_WORKOUT", 1:"100_DECONECTEZ", 2:"101_DECONECTEZ_LINISTIT", a:"102_DECONECTEZ_WEEKEND_VIBE", s:"103_DECONECTEZ DANCE", d:"104_DECONECTEZ_HAPPY", f:"105_DECONECTEZ_ENERGIC", g:"200_FOCUS", h:"201_FOCUS_PROFUND", j:"202_FOCUS_RITMIC", k:"203_FOCUS_ACTIV", l:"204_FOCUS_CREATIV", 3:"300_SUFERINTA", 4:"301_SUFERINTA_DEEP", z:"302_SUFERINTA_ACCEPT", x:"303_SUFERINTA_ELIBEREZ", c:"304_SUFERINTA_AGRESIV", v:"305_SUFERINTA_MOODY", b:"011_JAZZ", n:"012_RINGTONE", m:"013_OmHarmonics",5:"014_DIMINEATA"}
global playlistSourceSavePath := "d:\SYNC\cipi\Music"
global playlistDestinationSavePath := "d:\SYNC\cipi\MOBILE-SYNC\PLAYLIST"

saveAllPlayLists() {
    sleep 1000
    showTooltip("foobar playlist save - press #F8 to stop", 2222)
    copyPlayLists()
    playlistIndex := "qwertyuiop12asdfghjkl34zxcvbnm5"
    WinActivate, foobar2000
    Loop, parse, playlistIndex
    {
        name := playlistName[A_LoopField]
        showTooltip("[" . name . "]| press #F8 to stop", 2000)
        sleep 100
        sendKeyCombinationIndependentActiveModifiers("^!" . A_LoopField)
        sleep 200
        sendKeyCombinationIndependentActiveModifiers("^+q") ; remove duplicates
        sleep 300
        sendKeyCombinationIndependentActiveModifiers("^s")
        sleep 1000
        sendKeyCombinationIndependentActiveModifiers(name)
        sendKeyCombinationIndependentActiveModifiers("{enter}")
        sleep 300
        sendKeyCombinationIndependentActiveModifiers("y")
    }
    ;copyPlayLists()
}

foobarSearchAllSongs() {
    IfWinNotExist Media Library Search
    {
        sleep 100
        sendKeyCombinationIndependentActiveModifiers("#+f")
        WinWait Media Library Search
        WinActivate Media Library Search
        sendKeyCombinationIndependentActiveModifiers("#+``")
        return
    }

    WinActivate Media Library Search
}

foobarOrderRepeat() {
    sendKeyCombinationIndependentActiveModifiers("#{F4}")
}

foobarOrderDefault() {
    sendKeyCombinationIndependentActiveModifiers("#{F5}")
}

foobarOrderShuffle() {
    sendKeyCombinationIndependentActiveModifiers("#{F6}")
}

copyPlayLists() {
    showtooltip(playlistDestinationSavePath . "\*.m3u8"a)
    FileDelete, %playlistDestinationSavePath%\*.m3u8
    sleep 5000    ; asteapta sa isi dea seama dropbox ca au fost sterse
    FileCopy, %playlistSourceSavePath%\*.m3u, %playlistDestinationSavePath%\
}

mediaNext()
{
    send {Media_Next}
}

mediaPLayPause()
{
    send {Media_Play_Pause}
}

mediaPrevious()
{
    send {Media_Prev}
}
