global wobblyKeyTimeout := 0



readRandomSettings(path)
{
    IniRead, wobblyKeyTimeout, %path%, random, wobblyKeyTimeout
}
