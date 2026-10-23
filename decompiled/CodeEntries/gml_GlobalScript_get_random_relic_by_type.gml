function get_random_relic_by_type(arg0 = global.relic_types_rarity)
{
    if (!is_array(arg0) || array_length(arg0) == 0)
    {
        exit;
    }
    var rarity_levels = pluck(arg0, "level");
    var type = @@array_get@@(arg0, 0);
    var __array = global.relic_types_rarity;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (!in_array(mitem.level, rarity_levels))
        {
            continue;
        }
        if (percent_chance(mitem.get_spawn_chance()))
        {
            type = mitem;
            break;
        }
    }
    var relic = get_random_relic(type.key);
    return relic;
}
