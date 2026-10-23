function reset_tavern_games()
{
    if (!variable_global_exists("tavern_games_playing"))
    {
        exit;
    }
    var __struct = global.tavern_games_playing;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(global.tavern_games_playing, mkey, false);
    }
}
