function load_curse_game_level(arg0)
{
    var level_file = sprintf("curse_game_levels/%s.dat", arg0);
    if (!is_save_valid(level_file))
    {
        return notify_error("Invalid curse game level");
    }
    var level_string = get_file_contents(level_file);
    if (!is_string(level_string) || is_empty(level_string))
    {
        return notify_error("Invalid file");
    }
    var level;
    try
    {
        level = parse_save_data(level_string);
    }
    catch (e)
    {
        log("error parsing curse level", e);
    }
    if (!is_struct(level))
    {
        return log("invalid level");
    }
    with (o_minigame_curse)
    {
        var __struct = level;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var obj = asset_get_index(mkey);
            if (obj == -1)
            {
                log("invalid object", mkey);
            }
            else
            {
                if (obj == o_minigame_curse_wall)
                {
                    obj = o_minigame_curse_wall_default;
                }
                if (!in_array(obj, instance_list))
                {
                    log("object not in instance list", mkey);
                }
                else
                {
                    var __array2 = mitem;
                    var __prop_len2 = array_length(__array2);
                    for (var __i2 = 0; __i2 < __prop_len2; __i2++)
                    {
                        var mitem2 = __array2[__i2];
                        var place_layer = global.layers.gui_items_1;
                        if (obj == o_minigame_curse_ball)
                        {
                            place_layer = global.layers.gui_items_2;
                        }
                        instance_create_layer(mitem2.x, mitem2.y, place_layer, obj);
                    }
                }
            }
        }
    }
}
