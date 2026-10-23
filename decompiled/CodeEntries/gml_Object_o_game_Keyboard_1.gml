key_modifier = get_key_modifier();
if (keyboard_check(vk_shift) && keyboard_check(vk_alt) && keyboard_check(ord("R")))
{
    save_game();
    game_restart_adv();
}
