#include %A_ScriptDir%\tests\indexTests.ahk


global defaultLeftCtrlClickAction
global defaultLeftShiftClickAction
global defaultLeftWinClickAction
global defaultLeftAltClickAction
global defaultRightCtrlClickAction
global defaultRightShiftClickAction
global defaultRightWinClickAction
global defaultRightAltClickAction
global defaultTimeoutStillSendLayoutKey
global defaultTimeoutProcessLayoutOnRelease
global defaultTimerTimeoutStickyKeys
global extraKeysMappings := object()
; previously was normal notepad but in recent update it is very unstable as a test environment with random failing
global TESTING_ENVIRONMENT := "Notepad++"

processCustomAppNameRules()
{
}

if (prepareTestEnvironment())
{
    initTestEnvironment()
    sleep 1000
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
    defaultTimeoutProcessLayoutOnRelease := timeoutProcessLayoutOnRelease
    defaultTimeoutStillSendLayoutKey := timeoutStillSendLayoutKey
    defaultTimerTimeoutStickyKeys := timerTimeoutStickyKeys
    setTestVariables()
    setExtraKeys()
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
    timeoutProcessLayoutOnRelease := defaultTimeoutProcessLayoutOnRelease
    timeoutStillSendLayoutKey := defaultTimeoutStillSendLayoutKey
    timerTimeoutStickyKeys := defaultTimerTimeoutStickyKeys
}

setExtraKeys()
{
    layout["LWin"] := "lwin"
    layout["RWin"] := "lwin"

    for key , value in layout
    {
        switch value
        {
            case "leftCtrlClick":
                extraKeysMappings[value] := key
            case "rightCtrlClick":
                extraKeysMappings[value] := key
            case "leftShiftClick":
                extraKeysMappings[value] := key
            case "rightShiftClick":
                extraKeysMappings[value] := key
            case "leftWinClick":
                extraKeysMappings[value] := key
            case "rightWinClick":
                extraKeysMappings[value] := key
            case "leftAltClick":
                extraKeysMappings[value] := key
            case "rightAltClick":
                extraKeysMappings[value] := key
        }
    }
}
