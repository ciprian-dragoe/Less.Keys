#include %A_ScriptDir%\tests\indexTests.ahk



global defaultCtrlClickAction
global defaultShiftClickAction


if (prepareTestEnvironment())
{
    defaultCtrlClickAction := modifierDoubledAsClick["ctrlClick"]
    defaultShiftClickAction := modifierDoubledAsClick["shiftClick"]
    modifierDoubledAsClick["ctrlClick"] := "lbutton"
    modifierDoubledAsClick["shiftClick"] := "lbutton"
    runIntegrationTests()
    printTestResults(successTestResults)
    printTestResults(failureTestResults)
    modifierDoubledAsClick["ctrlClick"] := defaultCtrlClickAction
    modifierDoubledAsClick["shiftClick"] := defaultShiftClickAction
}
