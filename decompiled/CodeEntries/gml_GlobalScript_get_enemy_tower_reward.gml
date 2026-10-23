function get_enemy_tower_reward(arg0 = false, arg1 = global.current_tower_floor)
{
    var res = {};
    var mult = 0;
    var has_mult_upgrade = get_upgrade_count(global.shops.gold_token.enemy_multiplier_rewards) > 0;
    if (arg0)
    {
        res.gold_token = max(1, 10 * ((arg1 div 10) - 1));
        mult = 0.02;
        mult *= (1 + get_upgrade_attribute_value(global.upgrade_attributes.resources_multiplier.gold_token));
    }
    else
    {
        res.silver_token = global.current_tower_floor;
        mult = 0.1;
        mult *= (1 + get_upgrade_attribute_value(global.upgrade_attributes.resources_multiplier.silver_token));
    }
    var __struct = res;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        var val = mitem;
        if (has_mult_upgrade)
        {
            val = ceil(mitem * (1 + (get_upgrade_attribute_value(global.upgrade_attributes.enemy_drop_multiplier) * mult)));
        }
        variable_struct_set(res, mkey, val);
    }
    return res;
}
