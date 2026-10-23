function after_prestige()
{
    global.draw_hud = true;
    o_game.autocrunching = false;
    if (get_upgrade_count(global.shops.blc.auto_teleport_best_area) > 0 && global.shops.blc.auto_teleport_best_area.data.toggle && is_unlocked_areas())
    {
        var __struct = global.areas;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            if (!mitem.data.auto_teleport || !get_value_ext(mitem, mitem.can_teleport))
            {
                continue;
            }
            if (o_game.area.key == mkey)
            {
                exit;
            }
            if (get_hp_drain_area(mitem) > 0)
            {
                area_start_key = global.areas.garden.key;
            }
            change_area(mitem);
            break;
        }
    }
    if (global.last_prestige_level == global.prestige_levels.ulc.level)
    {
        cancel_all_borbventures();
        generate_trades(true);
    }
    global.is_prestiging = false;
}
