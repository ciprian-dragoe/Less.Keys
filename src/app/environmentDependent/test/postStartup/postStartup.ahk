#include %A_ScriptDir%\tests\indexTests.ahk



global defaultCtrlClickAction
global defaultShiftClickAction
global defaultWinClickAction
global defaultAltClickAction


if (prepareTestEnvironment())
{
    initTestEnvironment()
    
    runIntegrationTests()
    printTestResults(successTestResults)
    printTestResults(failureTestResults)
    
    finalizeTestEnvironment()
}

initTestEnvironment()
{
    defaultCtrlClickAction := modifierDoubledAsClick["ctrlClick"]
    defaultShiftClickAction := modifierDoubledAsClick["shiftClick"]
    defaultWinClickAction := modifierDoubledAsClick["winClick"]
    defaultAltClickAction := modifierDoubledAsClick["altClick"]
    modifierDoubledAsClick["ctrlClick"] := "lbutton"
    modifierDoubledAsClick["shiftClick"] := "lbutton"
    modifierDoubledAsClick["winClick"] := "lbutton"
    modifierDoubledAsClick["altClick"] := "lbutton"
}

finalizeTestEnvironment()
{
    modifierDoubledAsClick["ctrlClick"] := defaultCtrlClickAction
    modifierDoubledAsClick["shiftClick"] := defaultShiftClickAction
    modifierDoubledAsClick["winClick"] := defaultWinClickAction
    modifierDoubledAsClick["altClick"] := defaultAltClickAction
}
