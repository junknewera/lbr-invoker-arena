function get_random_available_boss_area(arg0 = false, arg1 = false)
{
    var area = undefined;
    if (arg0)
    {
        global.areas_boss_random = array_shuffle(global.areas_boss_random);
    }
    var __array = global.areas_boss_random;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        var has_event_boss = false;
        var skip_ww = false;
        if (!call_method(mitem, mitem.check) || !call_method(mitem, mitem.can_teleport))
        {
            continue;
        }
        if (is_struct(mitem.galaxy) && mitem.galaxy.is_obfuscated())
        {
            skip_ww = true;
        }
        if (is_current_area(mitem))
        {
            continue;
        }
        var __array2 = mitem.enemy;
        var __prop_len2 = array_length(__array2);
        for (var __i2 = 0; __i2 < __prop_len2; __i2++)
        {
            var mitem2 = __array2[__i2];
            if (arg1 && !get_default_struct_value(mitem2.data, "ww", true))
            {
                skip_ww = true;
            }
            if (mitem2.is_event_boss)
            {
                has_event_boss = true;
            }
        }
        if (has_event_boss || skip_ww)
        {
            continue;
        }
        if (mitem.data.boss_spawn_delay <= o_game.data.stats.time_elapsed)
        {
            area = mitem;
            break;
        }
    }
    return area;
}
