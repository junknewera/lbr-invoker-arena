function reset_shop_items(arg0, arg1 = 0)
{
    var prestige = get_default_struct_value(global.prestige_levels_map, arg1);
    if (!is_struct(prestige))
    {
        return logstack("Reset items: Invalid prestige level", arg1);
    }
    if (arg0 == global.shops.weapons && get_upgrade_count(global.shops.gems.keep_blower_after_prestige) > 0 && global.game_settings.gem_upgrades_enabled)
    {
        exit;
    }
    var keep_autobuyers = false;
    if (arg1 == global.prestige_levels.ulc.level)
    {
        keep_autobuyers = true;
    }
    var __struct = arg0;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.auto_upgrade_sorted_items_cache = undefined;
        if (mitem.prestige_level >= arg1)
        {
            continue;
        }
        if (mitem.is_autobuyer && keep_autobuyers)
        {
            continue;
        }
        mitem.data.count = get_cloned_struct_value(mitem.data_start, "count");
        if (get_default_struct_value(mitem, "available", false))
        {
            mitem.data.count = 1;
        }
        mitem.cost_cache_highest = 0;
    }
}

function reset_shops()
{
    var __array = global.shops_items_array;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        reset_shop_item(mitem);
    }
}

function reset_shop_item(arg0)
{
    arg0.auto_upgrade_sorted_items_cache = undefined;
    arg0.data.count = arg0.data_start.count;
    if (get_default_struct_value(arg0, "available", false))
    {
        arg0.data.count = 1;
    }
    arg0.cost_cache_highest = 0;
}
