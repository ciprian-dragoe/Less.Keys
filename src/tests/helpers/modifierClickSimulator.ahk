global mockResponseIsKeyPressed := true



simulateModifierClick(modifier, isPressed, timePressed = 50)
{
    if (timePressed)
    {
        sleep %timePressed%
    }
    
    if (isPressed)
    {
        mockResponseIsKeyPressed := true
        IsKeyPressed := Func("mockIsKeyPressed")
        processKeyDown(modifier)
    }
    else
    {
        mockResponseIsKeyPressed := false
        IsKeyPressed := Func("PhysicalKeyPressState")
        processKeyUp(modifier)
    }
}

mockIsKeyPressed(key)
{
    return mockResponseIsKeyPressed
}