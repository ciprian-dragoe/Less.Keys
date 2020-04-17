#include %A_ScriptDir%\tests\helpers\simulators.ahk
#include %A_ScriptDir%\tests\helpers\validators.ahk
#include %A_ScriptDir%\tests\integration\layout\alternativeLayoutActive.ahk



global testResults := []

runIntegrationTests()
{
    Alternative_layout_does_not_introduce_letter_for_key_which_is_reMapped_as_left_key()        
}