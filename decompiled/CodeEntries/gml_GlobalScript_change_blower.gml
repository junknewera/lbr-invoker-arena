function change_blower(arg0)
{
    if (is_string(arg0))
    {
        arg0 = variable_struct_get(global.shops.weapons, arg0);
    }
    if (is_undefined(arg0))
    {
        arg0 = global.shops.weapons.hands;
    }
    if (get_upgrade_count(arg0) == 0)
    {
        arg0 = global.shops.weapons.hands;
    }
    with (o_blower)
    {
        blower = arg0;
        init();
    }
    with (o_autoblower)
    {
        init();
    }
    o_game.data.current_weapon_key = arg0.key;
    init_game_vars(true);
}
