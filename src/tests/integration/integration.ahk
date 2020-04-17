#include %A_ScriptDir%\tests\helpers\simulators.ahk
#include %A_ScriptDir%\tests\helpers\validators.ahk
#include %A_ScriptDir%\tests\integration\layout\alternativeLayoutActive.ahk



global successTestResults := []
global failureTestResults := []

runIntegrationTests()
{
    Alternative_layout_does_not_introduce_letter_for_key_which_is_reMapped_as_left_key()
    Alternative_layout_moves_caret_for_key_which_is_reMapped_as_left_key()        
}