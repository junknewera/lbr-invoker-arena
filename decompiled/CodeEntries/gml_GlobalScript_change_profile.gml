function change_profile(arg0)
{
    arg0 = get_default_value(arg0, global.profile_types.def);
    global.changing_profile = true;
    save_game(arg0);
    game_restart_adv();
}
