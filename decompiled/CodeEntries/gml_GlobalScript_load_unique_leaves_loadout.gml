function load_unique_leaves_loadout(arg0)
{
    deactivate_all_unique_leaves();
    var __struct = arg0;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (!is_string(mkey))
        {
            continue;
        }
        var uleaf = variable_struct_get(global.unique_leaves, mkey);
        if (is_undefined(uleaf))
        {
            continue;
        }
        if (mitem && uleaf.can_activate())
        {
            uleaf.activate(false);
        }
    }
    init_game_vars();
}
