#include %A_ScriptDir%\tests\indexTests.ahk



global defaultLeftCtrlClickAction
global defaultLeftShiftClickAction
global defaultLeftWinClickAction
global defaultLeftAltClickAction
global defaultRightCtrlClickAction
global defaultRightShiftClickAction
global defaultRightWinClickAction
global defaultRightAltClickAction


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
    clipboard :=
    defaultLeftCtrlClickAction := modifierDoubledAsClick["leftCtrlClick"]
    defaultLeftShiftClickAction := modifierDoubledAsClick["leftShiftClick"]
    defaultLeftWinClickAction := modifierDoubledAsClick["leftWinClick"]
    defaultLeftAltClickAction := modifierDoubledAsClick["leftAltClick"]
    defaultRightCtrlClickAction := modifierDoubledAsClick["rightCtrlClick"]
    defaultRightShiftClickAction := modifierDoubledAsClick["rightShiftClick"]
    defaultRightWinClickAction := modifierDoubledAsClick["rightWinClick"]
    defaultRightAltClickAction := modifierDoubledAsClick["rightAltClick"]
    modifierDoubledAsClick["leftCtrlClick"] := "lbutton"
    modifierDoubledAsClick["leftShiftClick"] := "lbutton"
    modifierDoubledAsClick["leftWinClick"] := "lbutton"
    modifierDoubledAsClick["leftAltClick"] := "lbutton"
    modifierDoubledAsClick["rightCtrlClick"] := "lbutton"
    modifierDoubledAsClick["rightShiftClick"] := "lbutton"
    modifierDoubledAsClick["rightWinClick"] := "lbutton"
    modifierDoubledAsClick["rightAltClick"] := "lbutton"
}

finalizeTestEnvironment()
{
    modifierDoubledAsClick["leftCtrlClick"] := defaultLeftCtrlClickAction
    modifierDoubledAsClick["leftShiftClick"] := defaultLeftShiftClickAction
    modifierDoubledAsClick["leftWinClick"] := defaultLeftWinClickAction
    modifierDoubledAsClick["leftAltClick"] := defaultLeftAltClickAction
    modifierDoubledAsClick["rightCtrlClick"] := defaultRightCtrlClickAction
    modifierDoubledAsClick["rightShiftClick"] := defaultRightShiftClickAction
    modifierDoubledAsClick["rightWinClick"] := defaultRightWinClickAction
    modifierDoubledAsClick["rightAltClick"] := defaultRightAltClickAction
}
