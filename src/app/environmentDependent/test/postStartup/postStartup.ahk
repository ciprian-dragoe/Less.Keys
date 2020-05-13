#include %A_ScriptDir%\tests\indexTests.ahk

if (prepareTestEnvironment())
{
    modifierDoubledAsClick["ctrlClick"] := "lbutton"
    runIntegrationTests()
    printTestResults(successTestResults)
    printTestResults(failureTestResults)
    modifierDoubledAsClick["ctrlClick"] := "rbutton"
}
