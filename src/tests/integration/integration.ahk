#include %A_ScriptDir%\tests\helpers\simulators.ahk
#include %A_ScriptDir%\tests\helpers\typingValidators.ahk
#include %A_ScriptDir%\tests\helpers\caretValidators.ahk
#include %A_ScriptDir%\tests\integration\contexts\1sticky.ahk
#include %A_ScriptDir%\tests\integration\contexts\2shortcuts.ahk
#include %A_ScriptDir%\tests\integration\contexts\3shiftClick.ahk
#include %A_ScriptDir%\tests\integration\contexts\4ctrlClick.ahk
#include %A_ScriptDir%\tests\integration\contexts\5shiftClickCtrlClick.ahk
#include %A_ScriptDir%\tests\integration\contexts\6layoutKey.ahk
#include %A_ScriptDir%\tests\integration\contexts\7remappedLayout.ahk
#include %A_ScriptDir%\tests\integration\contexts\8winClick.ahk
#include %A_ScriptDir%\tests\integration\contexts\9winClickCtrlClick.ahk
#include %A_ScriptDir%\tests\integration\contexts\10winClickShiftClick.ahk
#include %A_ScriptDir%\tests\integration\contexts\11altClick.ahk
#include %A_ScriptDir%\tests\integration\contexts\12altClickCtrlClick.ahk
#include %A_ScriptDir%\tests\integration\contexts\13altClickShiftClick.ahk
#include %A_ScriptDir%\tests\integration\contexts\14altClickWinClick.ahk



global successTestResults := []
global failureTestResults := []

runIntegrationTests()
{
    ; STICKY
    When_shift_key_is_logically_pressed_and_not_released_for_more_then_stickyTime_shift_and_shiftActive_is_reset_after_stickyTime_#101()
    When_shiftClick_key_is_logically_pressed_and_not_released_for_more_then_stickyTime_shift_is_reset_after_stickyTime_#102()
    When_ctrl_key_is_logically_pressed_and_not_released_for_more_then_stickyTime_ctrl_and_ctrlActive_is_reset_after_stickyTime_#103()
    When_ctrlClick_key_is_logically_pressed_and_not_released_for_more_then_stickyTime_ctrl_is_reset_after_stickyTime_#104()
    When_alt_key_is_logically_pressed_and_not_released_for_more_then_stickyTime_alt_and_altActive_is_reset_after_stickyTime_#105()
    When_lwin_key_is_logically_pressed_and_not_released_for_more_then_stickyTime_lwin_and_winActive_is_reset_after_stickyTime_#106()
    When_layout_key_is_logically_pressed_and_not_released_for_more_then_stickyTime_alternativeLayout_is_reset_after_stickyTime_#107()
    When_processKeyOnRelease_is_set_after_stickyTime_it_is_reset_#108()
    When_shiftClick_key_is_logically_pressed_and_mouse_moved_and_stickyTime_passes_left_click_is_released_#109()
    When_ctrlClick_key_is_logically_pressed_and_mouse_moved_and_stickyTime_passes_left_click_is_released_#110()
    When_non_modifier_key_is_logically_pressed_and_not_released_after_stickyTime_passes_activePressedKeys_is_reset_to_empty_array_#111()
    When_lastKeyProcessedAsAlternative_is_set_after_stickyTime_it_is_reset_#112()
    When_keyToSendOnUp_is_set_after_stickyTime_it_is_reset_#113()
    
    ; SHORTCUTS
    When_key_matches_shortcut_pattern_shortcut_action_is_executed_instead_of_key_#201()
    When_key_matches_shortcut_pattern_and_is_kept_pressed_after_shortcut_action_is_sent_next_layout_key_press_without_release_is_not_processed_as_space_#202()
    
    ; SHIFT CLICK
    When_shiftClick_is_pressed_at_release_left_click_is_sent_#301()
    When_shiftClick_is_continously_pressed_and_layout_key_is_pressed_and_released_space_is_sent_#302()
    When_shiftClick_is_continously_pressed_and_backtick_is_pressed_keyboard_shortcut_is_sent_#303()
    When_shiftClick_is_continously_pressed_and_backtick_is_pressed_left_click_is_not_sent_on_shiftClick_release_#304()
    When_shiftClick_is_continously_pressed_and_layout_key_is_pressed_and_backtick_is_sent_on_shiftClick_release_click_is_not_sent_#305()
    When_shiftClick_is_pressed_and_shift_key_is_pressed_and_released_click_is_sent_on_shiftClick_release_#306()
    When_shiftClick_is_pressed_and_alt_key_is_pressed_click_is_sent_on_shiftClick_release_#307()
    When_shiftClick_is_pressed_and_ctrl_key_is_pressed_and_released_click_is_sent_on_shiftClick_release_#308()
    When_shiftClick_is_pressed_and_ctrl_key_is_pressed_click_is_sent_on_shiftClick_release_#309()
    When_shiftClick_is_pressed_and_shift_key_is_pressed_and_released_click_is_sent_on_shiftClick_release_#310()
    When_shiftClick_is_pressed_and_shift_key_is_pressed_click_is_sent_on_shiftClick_release_#311()
    When_shiftClick_is_pressed_and_shift_is_pressed_and_released_click_is_sent_on_shiftClick_release_#312()
    When_shiftClick_is_pressed_and_shift_is_pressed_click_is_sent_on_shiftClick_release_#313()
    When_shiftClick_is_pressed_and_shift_key_is_pressed_and_layout_key_pressed_and_backtick_pressed_keyboard_shortcut_is_sent_#314()
    When_shiftClick_is_continously_pressed_and_layout_key_is_pressed_after_release_left_click_is_not_sent_#315()
    When_shiftClick_is_continously_pressed_and_mouse_is_moved_the_text_is_selected_#316()
    When_shiftClick_is_continously_pressed_and_mouse_is_moved_and_a_letter_is_typed_a_letter_is_not_sent_#317()
    When_shiftClick_is_continously_pressed_and_mouse_is_moved_and_layout_key_is_pressed_space_is_not_sent_on_layout_key_release_#318()
    When_shiftClick_pressed_and_mouse_is_moved_and_layout_key_is_pressed_longer_then_timeoutStillSendLayoutKey_space_is_not_sent_on_layout_key_release_#319()
    When_non_modifier_letter_is_released_and_layout_key_continous_press_in_less_then_timeoutProcessLayoutOnRelease_and_shiftClick_pressed_and_backtick_pressed_and_released_click_is_not_sent_#320()
    When_non_modifier_letter_is_released_and_layout_key_continous_press_in_less_then_timeoutProcessLayoutOnRelease_and_shiftClick_continous_press_and_backtick_pressed_and_shiftClick_released_left_click_is_not_sent_#321()
    When_shiftClick_is_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_shiftClick_release_#322()
	When_layout_key_is_pressed_followed_by_shiftClick_left_click_is_not_sent_on_shiftClick_release_#323()
    When_non_modifier_key_is_pressed_followed_by_shiftClick_left_click_is_not_sent_on_shiftClick_release_#324()
    When_shiftClick_action_is_not_lbutton_and_mouse_is_moved_on_release_action_is_sent_instead_of_mouse_click_#325()
    When_shift_is_pressed_and_shiftClick_is_continously_pressed_and_mouse_is_moved_the_text_is_selected_#326()
    When_shiftClick_is_continously_pressed_and_mouse_is_moved_and_ctrl_is_pressed_the_text_remains_selected_#327()
    When_shiftClick_is_continously_pressed_and_mouse_is_moved_and_shift_is_pressed_and_released_the_text_remains_selected_#328()
    
    ; CTRL CLICK
    When_ctrlClick_is_pressed_at_release_left_click_is_sent_#401()
    When_ctrlClick_is_continously_pressed_and_layout_key_is_pressed_but_not_releases_space_is_sent_#402()
    When_ctrlClick_is_continously_pressed_and_a_letter_is_pressed_all_text_is_selected_#403()
    When_ctrlClick_is_continously_pressed_and_a_key_is_pressed_left_click_is_not_sent_on_ctrlClick_release_#404()
    When_ctrlClick_is_continously_pressed_and_layout_key_is_pressed_and_key_remapped_as_left_is_sent_on_ctrlClick_release_click_is_not_sent_#405()
    When_ctrlClick_is_pressed_and_ctrl_key_is_pressed_and_released_click_is_sent_on_ctrlClick_release_#406()
    When_ctrlClick_is_pressed_and_ctrl_key_is_pressed_click_is_sent_on_ctrlClick_release_#407()
    When_ctrlClick_is_pressed_and_alt_key_is_pressed_and_released_click_is_sent_on_ctrlClick_release_#408()
    When_ctrlClick_is_pressed_and_alt_key_is_pressed_click_is_sent_on_ctrlClick_release_#409()
    When_ctrlClick_is_pressed_and_win_key_is_pressed_and_released_click_is_sent_on_ctrlClick_release_#410()
    When_ctrlClick_is_pressed_and_win_key_is_pressed_click_is_sent_on_ctrlClick_release_#411()
    When_ctrlClick_is_pressed_and_shift_is_pressed_and_released_click_is_sent_on_ctrlClick_release_#412()
    When_ctrlClick_is_pressed_and_shift_is_pressed_click_is_sent_on_ctrlClick_release_#413()
    When_ctrlClick_is_pressed_and_shift_key_is_pressed_and_layout_key_pressed_and_key_remapped_as_left_key_a_word_is_selected_#414()
    When_ctrlClick_is_continously_pressed_and_layout_key_is_pressed_after_release_left_click_is_not_sent_#415()
    When_ctrlClick_is_continously_pressed_and_mouse_is_moved_the_text_is_selected_#416()
    When_ctrlClick_is_continously_pressed_and_mouse_is_moved_and_a_letter_is_typed_a_letter_is_not_sent_#417()
    When_ctrlClick_is_continously_pressed_and_mouse_is_moved_and_layout_key_is_pressed_space_is_not_sent_on_layout_key_release_#418()
    When_ctrlClick_pressed_and_mouse_is_moved_and_layout_key_is_pressed_longer_then_timeoutStillSendLayoutKey_space_is_not_sent_on_layout_key_release_#419()
    When_non_modifier_letter_is_released_and_layout_key_continous_press_in_less_then_timeoutProcessLayoutOnRelease_and_ctrlClick_pressed_and_letter_key_alternative_mapped_as_left_key_pressed_and_released_caret_is_moved_#420()
	When_non_modifier_letter_is_released_and_layout_key_continous_press_in_less_then_timeoutProcessLayoutOnRelease_and_ctrlClick_continous_press_and_letter_key_pressed_and_released_and_ctrlClick_released_left_click_is_not_sent_#421()
    When_ctrlClick_is_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_ctrlClick_release_#422()
    When_layout_key_is_pressed_followed_by_ctrlClick_left_click_is_not_sent_on_ctrlClick_release_#423()
    When_non_modifier_key_is_pressed_followed_by_ctrlClick_left_click_is_not_sent_on_ctrlClick_release_#424()
    When_ctrlClick_action_is_not_lbutton_and_mouse_is_moved_on_release_action_is_sent_instead_of_mouse_click_#425()
    When_ctrl_is_pressed_and_ctrlClick_is_continously_pressed_and_mouse_is_moved_the_text_is_selected_#426()
    When_ctrlClick_is_continously_pressed_and_mouse_is_moved_and_ctrl_is_pressed_the_text_remains_selected_#427()
    When_ctrlClick_is_continously_pressed_and_mouse_is_moved_and_ctrl_is_pressed_and_released_the_text_remains_selected_#428()
    
    ; SHIFT CLICK & CTRL CLICK
    When_shiftClick_is_pressed_and_ctrlClick_is_pressed_left_click_is_sent_on_shiftClick_release_#501()
    When_ctrlClick_is_pressed_and_shiftClick_is_pressed_click_is_sent_on_ctrlClick_release_#502()
    When_shiftClick_is_continously_pressed_and_ctrlClick_is_continously_pressed_and_layout_key_continously_pressed_and_key_remapped_as_left_key_a_word_is_selected_#503()
    When_shiftClick_is_continously_pressed_and_ctrlClick_is_continously_pressed_and_layout_key_continously_pressed_and_key_remapped_as_left_key_left_click_is_not_sent_on_shiftClick_release_#504()
    When_shiftClick_is_continously_pressed_and_ctrlClick_is_continously_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_ctrlClick_release_#505()
    When_shiftClick_is_pressed_and_ctrlClick_is_pressed_and_released_left_click_is_sent_on_shiftClick_release_#506()
    When_ctrlClick_is_pressed_and_shiftClick_is_pressed_and_released_left_click_is_sent_on_ctrlClick_release_#507()
    
    ; LAYOUT
    When_layout_key_is_pressed_and_key_which_is_reMapped_as_left_key_is_sent_cursor_is_moved_to_left_#601()
    When_layout_key_is_pressed_a_key_does_not_introduce_letter_a_#602()
    When_layout_key_is_pressed_less_then_timeoutStillSendLayoutKey_and_during_this_time_no_non_modifier_key_is_pressed_space_is_sent_on_layout_key_up_#603()
    When_layout_key_is_pressed_more_then_timeoutStillSendLayoutKey_and_during_this_time_no_non_modifier_key_is_pressed_space_is_not_sent_on_layout_key_up_#604()
    When_layout_key_is_pressed_less_then_timeoutStillSendLayoutKey_and_during_this_time_non_modifier_key_is_pressed_space_is_not_sent_on_layout_key_up_#605()
    When_layout_key_is_pressed_less_then_timeoutStillSendLayoutKey_and_during_this_time_modifier_key_is_pressed_space_is_sent_on_layout_key_up_#606()
    When_layout_key_is_pressed_continously_for_3_seconds_and_during_this_time_no_non_modifier_key_is_pressed_space_is_not_sent_on_layout_key_up_#607()
    When_non_modifier_key_is_already_pressed_and_layout_key_is_pressed_space_is_sent_before_layout_key_released_#608()
    When_non_modifier_key_is_released_followed_by_layout_key_press_in_less_than_timeoutProcessLayoutOnRelease_followed_by_non_modifier_key_press_which_has_alternative_mapping_followed_by_same_non_modifier_key_release_remapped_key_is_sent_#609()
    When_non_modifier_key_is_released_followed_by_layout_key_press_in_less_than_timeoutProcessLayoutOnRelease_followed_by_non_modifier_key_press_followed_layout_key_release_space_is_sent_followed_by_non_modifier_key_#610()
    When_layout_key_is_pressed_followed_by_non_modifier_key_press_without_release_followed_by_layout_key_release_followed_by_same_non_modifier_key_press_remapped_key_is_sent_only_once_and_no_other_key_#611()
    When_layout_key_is_pressed_followed_by_non_modifier_key_press_followed_by_layout_key_release_followed_by_other_non_modifier_key_press_remapped_key_is_sent_followed_last_non_modifier_key_pressed_#612()
    When_non_modifier_key_is_released_followed_by_layout_key_press_in_less_than_timeoutProcessLayoutOnRelease_followed_by_non_modifier_key_press_without_alternative_mapping_followed_by_same_release_the_key_is_sent_followed_by_space_#613()
    When_letter_is_released_followed_by_layout_key_press_in_less_than_timeoutProcessLayoutOnRelease_followed_by_letter_press_followed_by_different_letter_press_and_release_alternative_key_for_first_and_second_letter_is_sent_#614()
    When_letter_is_released_followed_by_layout_key_press_in_less_than_timeoutProcessLayoutOnRelease_followed_by_letter_press_followed_by_different_letter_press_followed_by_layout_release_space_is_not_sent_#615()
    When_letter_is_released_followed_by_layout_key_press_in_less_than_timeoutProcessLayoutOnRelease_followed_by_letter_press_followed_by_different_letter_press_followed_by_layout_release_alternative_keys_are_sent_for_both_letters_#616()
    When_letter_is_remapped_as_accented_character_is_pressed_accented_character_is_sent_#617()
    When_shift_key_is_pressed_followed_by_letter_remapped_as_accented_character_sibling_accented_character_is_sent_#618()
    
    ; REMAPPED LAYOUT
    When_key_which_has_been_remapped_is_pressed_remapped_key_is_sent_instead_#701()
    When_layout_key_is_pressed_followed_by_key_which_has_been_remapped_is_pressed_alternative_of_remapped_key_is_sent_#702()
    When_key_which_has_been_remapped_as_modifier_key_is_pressed_modifier_key_is_sent_instead_#703()
    When_key_which_has_been_remapped_as_modifier_key_is_pressed_followed_by_layout_key_press_followed_by_key_which_has_alternative_mapping_the_alternative_mapped_key_is_sent_#704()
    When_modifer_key_remapped_as_letter_is_pressed_on_release_activePressedKeys_is_reset_#705()
    When_layout_key_pressed_and_modifer_key_remapped_as_letter_is_pressed_on_modifier_key_release_activePressedKeys_is_reset_#706()
    When_layout_key_pressed_and_modifer_key_remapped_as_letter_is_pressed_on_modifier_key_release_alternative_key_is_sent_#707()
    When_layout_key_pressed_followed_by_modifer_key_remapped_as_letter_pressed_followed_by_layout_release_followed_by_same_modifier_press_remapped_letter_is_sent_#708()
    When_layout_key_continuously_pressed_followed_by_letter_alternatively_mapped_as_accented_character_accented_character_is_sent_#709()
    When_layout_key_continuously_pressed_followed_by_shift_key_press_followed_by_letter_alternatively_mapped_as_accented_character_sibling_accented_character_is_sent_#710()
        
    ; WIN CLICK
    When_winClick_is_pressed_at_release_left_click_is_sent_#801()
    When_winClick_is_continously_pressed_and_layout_key_is_pressed_and_released_space_is_sent_#802()
    When_winClick_is_continously_pressed_and_backtick_is_pressed_keyboard_shortcut_is_sent_#803()
    When_winClick_is_continously_pressed_and_backtick_is_pressed_left_click_is_not_sent_on_winClick_release_#804()
    When_winClick_is_continously_pressed_and_layout_key_is_pressed_and_backtick_is_sent_on_winClick_release_click_is_not_sent_#805()
    When_winClick_is_pressed_and_win_key_is_pressed_and_released_click_is_sent_on_winClick_release_#806()
    When_winClick_is_pressed_and_alt_key_is_pressed_click_is_sent_on_winClick_release_#807()
    When_winClick_is_pressed_and_ctrl_key_is_pressed_and_released_click_is_sent_on_winClick_release_#808()
    When_winClick_is_pressed_and_ctrl_key_is_pressed_click_is_sent_on_winClick_release_#809()
    When_winClick_is_pressed_and_win_key_is_pressed_and_released_click_is_sent_on_winClick_release_#810()
    When_winClick_is_pressed_and_win_key_is_pressed_click_is_sent_on_winClick_release_#811()
    When_winClick_is_pressed_and_shift_is_pressed_and_released_click_is_sent_on_winClick_release_#812()
    When_winClick_is_pressed_and_shift_is_pressed_click_is_sent_on_winClick_release_#813()
    When_winClick_is_pressed_and_shift_key_is_pressed_and_layout_key_pressed_and_backtick_pressed_keyboard_shortcut_is_sent_#814()
    When_winClick_is_continously_pressed_and_layout_key_is_pressed_after_release_left_click_is_not_sent_#815()
    When_winClick_is_continously_pressed_and_mouse_is_moved_the_text_is_selected_#816()
    When_winClick_is_continously_pressed_and_mouse_is_moved_and_a_letter_is_typed_a_letter_is_not_sent_#817()
    When_winClick_is_continously_pressed_and_mouse_is_moved_and_layout_key_is_pressed_space_is_not_sent_on_layout_key_release_#818()
	When_winClick_pressed_and_mouse_is_moved_and_layout_key_is_pressed_longer_then_timeoutStillSendLayoutKey_space_is_not_sent_on_layout_key_release_#819()
    When_non_modifier_letter_is_released_and_layout_key_continous_press_in_less_then_timeoutProcessLayoutOnRelease_and_winClick_pressed_and_backtick_pressed_and_released_click_is_not_sent_#820()
    When_non_modifier_letter_is_released_and_layout_key_continous_press_in_less_then_timeoutProcessLayoutOnRelease_and_winClick_continous_press_and_backtick_pressed_and_winClick_released_left_click_is_not_sent_#821()
    When_winClick_is_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_winClick_release_#822()
    When_layout_key_is_pressed_followed_by_winClick_left_click_is_not_sent_on_winClick_release_#823()
    When_non_modifier_key_is_pressed_followed_by_winClick_left_click_is_not_sent_on_winClick_release_#824()
    When_winClick_action_is_not_lbutton_and_mouse_is_moved_on_release_action_is_sent_instead_of_mouse_click_#825()
    When_win_is_pressed_and_winClick_is_continously_pressed_and_mouse_is_moved_the_text_is_selected_#826()
    When_winClick_is_continously_pressed_and_mouse_is_moved_and_ctrl_is_pressed_the_text_remains_selected_#827()
    When_winClick_is_continously_pressed_and_mouse_is_moved_and_win_is_pressed_and_released_the_text_remains_selected_#828()

    ; WIN CLICK CTRL CLICK
    When_winClick_is_pressed_and_ctrlClick_is_pressed_left_click_is_sent_on_winClick_release_#901()
    When_ctrlClick_is_pressed_and_winClick_is_pressed_click_is_sent_on_ctrlClick_release_#902()
    When_winClick_is_continously_pressed_and_ctrlClick_is_continously_pressed_and_backtick_pressed_keyboard_shortcut_is_sent#903()
    When_winClick_is_continously_pressed_and_ctrlClick_is_continously_pressed_and_backtick_pressed_click_is_not_sent_winClick_release#904()
    When_winClick_is_continously_pressed_and_ctrlClick_is_continously_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_ctrlClick_release_#905()
    When_winClick_is_pressed_and_ctrlClick_is_pressed_and_released_left_click_is_sent_on_winClick_release_#906()
    When_ctrlClick_is_pressed_and_winClick_is_pressed_and_released_left_click_is_sent_on_ctrlClick_release_#907()

    ; WIN CLICK SHIFT CLICK
    When_winClick_is_pressed_and_shiftClick_is_pressed_left_click_is_sent_on_winClick_release_#1001()
    When_shiftClick_is_pressed_and_winClick_is_pressed_click_is_sent_on_shiftClick_release_#1002()
    When_winClick_is_continously_pressed_and_shiftClick_is_continously_pressed_and_backtick_pressed_keyboard_shortcut_is_sent_#1003()
    When_winClick_is_continously_pressed_and_shiftClick_is_continously_pressed_and_backtick_pressed_click_is_not_sent_winClick_release_#1004()
    When_winClick_is_continously_pressed_and_shiftClick_is_continously_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_shiftClick_release_#1005()
    When_winClick_is_pressed_and_shiftClick_is_pressed_and_released_left_click_is_sent_on_winClick_release_#1006()
    When_shiftClick_is_pressed_and_winClick_is_pressed_and_released_left_click_is_sent_on_shiftClick_release_#1007()
    
    ; ALT CLICK
    When_altClick_is_pressed_at_release_left_click_is_sent_#1101()
    When_altClick_is_continously_pressed_and_layout_key_is_pressed_and_released_space_is_sent_#1102()
    When_altClick_is_continously_pressed_and_backtick_is_pressed_keyboard_shortcut_is_sent_#1103()
    When_altClick_is_continously_pressed_and_backtick_is_pressed_left_click_is_not_sent_on_altClick_release_#1104()
    When_altClick_is_continously_pressed_and_layout_key_is_pressed_and_backtick_is_sent_on_altClick_release_click_is_not_sent_#1105()
    When_altClick_is_pressed_and_alt_key_is_pressed_and_released_click_is_sent_on_altClick_release_#1106()
    When_altClick_is_pressed_and_alt_key_is_pressed_click_is_sent_on_altClick_release_#1107()
    When_altClick_is_pressed_and_ctrl_key_is_pressed_and_released_click_is_sent_on_altClick_release_#1108()
    When_altClick_is_pressed_and_ctrl_key_is_pressed_click_is_sent_on_altClick_release_#1109()
    When_altClick_is_pressed_and_win_key_is_pressed_and_released_click_is_sent_on_altClick_release_#1110()
    When_altClick_is_pressed_and_win_key_is_pressed_click_is_sent_on_altClick_release_#1111()
    When_altClick_is_pressed_and_shift_is_pressed_and_released_click_is_sent_on_altClick_release_#1112()
    When_altClick_is_pressed_and_shift_is_pressed_click_is_sent_on_altClick_release_#1113()
    When_altClick_is_pressed_and_shift_key_is_pressed_and_layout_key_pressed_and_backtick_pressed_keyboard_shortcut_is_sent_#1114()
    When_altClick_is_continously_pressed_and_layout_key_is_pressed_after_release_left_click_is_not_sent_#1115()
    When_altClick_is_continously_pressed_and_mouse_is_moved_the_text_is_selected_#1116()
    When_altClick_is_continously_pressed_and_mouse_is_moved_and_a_letter_is_typed_a_letter_is_not_sent_#1117()
	When_altClick_is_continously_pressed_and_mouse_is_moved_and_layout_key_is_pressed_space_is_not_sent_on_layout_key_release_#1118()
    When_altClick_pressed_and_mouse_is_moved_and_layout_key_is_pressed_longer_then_timeoutStillSendLayoutKey_space_is_not_sent_on_layout_key_release_#1119()
    When_non_modifier_letter_is_released_and_layout_key_continous_press_in_less_then_timeoutProcessLayoutOnRelease_and_altClick_pressed_and_backtick_pressed_and_released_click_is_not_sent_#1120()
    When_non_modifier_letter_is_released_and_layout_key_continous_press_in_less_then_timeoutProcessLayoutOnRelease_and_altClick_continous_press_and_backtick_pressed_and_altClick_released_left_click_is_not_sent_#1121()
    When_altClick_is_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_altClick_release_#1122()
    When_layout_key_is_pressed_followed_by_altClick_left_click_is_not_sent_on_altClick_release_#1123()
    When_non_modifier_key_is_pressed_followed_by_altClick_left_click_is_not_sent_on_altClick_release_#1124()
    When_altClick_action_is_not_lbutton_and_mouse_is_moved_on_release_action_is_sent_instead_of_mouse_click_#1125()
    When_alt_is_pressed_and_altClick_is_continously_pressed_and_mouse_is_moved_the_text_is_selected_#1126()
    When_altClick_is_continously_pressed_and_mouse_is_moved_and_ctrl_is_pressed_the_text_remains_selected_#1127()
    When_altClick_is_continously_pressed_and_mouse_is_moved_and_alt_is_pressed_and_released_the_text_remains_selected_#1128()

    ; ALT CLICK CTRL CLICK
    When_altClick_is_pressed_and_ctrlClick_is_pressed_left_click_is_sent_on_altClick_release_#1201()
    When_ctrlClick_is_pressed_and_altClick_is_pressed_click_is_sent_on_ctrlClick_release_#1202()
    When_altClick_is_continously_pressed_and_ctrlClick_is_continously_pressed_and_backtick_pressed_keyboard_shortcut_is_sent#1203()
    When_altClick_is_continously_pressed_and_ctrlClick_is_continously_pressed_and_backtick_pressed_click_is_not_sent_altClick_release#1204()
    When_altClick_is_continously_pressed_and_ctrlClick_is_continously_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_ctrlClick_release_#1205()
    When_altClick_is_pressed_and_ctrlClick_is_pressed_and_released_left_click_is_sent_on_altClick_release_#1206()
    When_ctrlClick_is_pressed_and_altClick_is_pressed_and_released_left_click_is_sent_on_ctrlClick_release_#1207()
    
    ; ALT CLICK SHIFT CLICK
    When_altClick_is_pressed_and_shiftClick_is_pressed_left_click_is_sent_on_altClick_release_#1301()
    When_shiftClick_is_pressed_and_altClick_is_pressed_click_is_sent_on_shiftClick_release_#1302()
    When_altClick_is_continously_pressed_and_shiftClick_is_continously_pressed_and_backtick_pressed_keyboard_shortcut_is_sent_#1303()
    When_altClick_is_continously_pressed_and_shiftClick_is_continously_pressed_and_backtick_pressed_click_is_not_sent_altClick_release_#1304()
    When_altClick_is_continously_pressed_and_shiftClick_is_continously_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_shiftClick_release_#1305()
    When_altClick_is_pressed_and_shiftClick_is_pressed_and_released_left_click_is_sent_on_altClick_release_#1306()
    When_shiftClick_is_pressed_and_altClick_is_pressed_and_released_left_click_is_sent_on_shiftClick_release_#1307()
    
    ; ALT CLICK WIN CLICK
    When_altClick_is_pressed_and_ctrlClick_is_pressed_left_click_is_sent_on_altClick_release_#1401()
    When_ctrlClick_is_pressed_and_altClick_is_pressed_click_is_sent_on_ctrlClick_release_#1402()
    When_altClick_is_continously_pressed_and_ctrlClick_is_continously_pressed_and_backtick_pressed_keyboard_shortcut_is_sent_#1403()
    When_altClick_is_continously_pressed_and_ctrlClick_is_continously_pressed_and_backtick_pressed_click_is_not_sent_altClick_release_#1404()
    When_altClick_is_continously_pressed_and_ctrlClick_is_continously_pressed_more_then_timeoutStillSendLayoutKey_left_click_is_not_sent_on_ctrlClick_release_#1405()
    When_altClick_is_pressed_and_ctrlClick_is_pressed_and_released_left_click_is_sent_on_altClick_release_#1406()
    When_ctrlClick_is_pressed_and_altClick_is_pressed_and_released_left_click_is_sent_on_ctrlClick_release_#1407()
}

