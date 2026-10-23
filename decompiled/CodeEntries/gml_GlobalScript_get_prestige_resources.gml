function get_prestige_resources(arg0, arg1)
{
    if (arg1 == global.prestige_levels.prestige.level)
    {
        var coins_add = 0;
        var coins_total = global.resources.coins.data.collected_total;
        var resources_total = _sum(global.resources, function(arg0, arg1)
        {
            var res_collected = arg0.data.collected * power(1.2, arg0.prestige_value * 9);
            res_collected = apply_max_leaf_storage(res_collected);
            return res_collected;
        }, false);
        var coins_collected_modifier = power(global.resources.coins.data.collected_total, 1.15);
        var coins_before_max = apply_max_leaf_storage(power(resources_total, 0.4) / 6);
        var coins_before_floor = max(0, coins_before_max);
        coins_add = floor(coins_before_floor);
        coins_add = max(0, coins_add);
        coins_add *= (1 + global.upgrade_attributes.prestige_value_multiplier);
        coins_add *= (1 + global.upgrade_attributes.prestige_value_multiplier_adder);
        coins_add *= (1 + global.upgrade_attributes.prestige_value_multiplier_dice);
        coins_add *= global.game_settings.prestige_value_multiplier;
        coins_before_max = apply_max_leaf_storage(coins_before_max);
        coins_add = apply_max_leaf_storage(coins_add);
        if (!is_undefined(arg0) && arg0)
        {
            return 
            {
                coins: coins_before_max
            };
        }
        return 
        {
            coins: floor(coins_add)
        };
    }
    else if (arg1 == global.prestige_levels.blc.level)
    {
        var blc_value = get_bm_value(1, "blc_value_adder", "blc_value_multiplier", undefined, true);
        blc_value *= (1 + global.upgrade_attributes.blc_value_multiplier_adder);
        blc_value *= (1 + global.upgrade_attributes.blc_gems_upgrade);
        blc_value *= global.game_settings.blc_value_multiplier;
        blc_value = apply_max_leaf_storage(blc_value);
        var prestige_resources = 
        {
            blc: blc_value
        };
        var coins_persist_upgrade_level = get_upgrade_count(global.shops.blc.coins_persist_blc);
        if (coins_persist_upgrade_level > 0)
        {
            var prestige_resources_tmp = get_prestige_resources(false, global.prestige_levels.prestige.level);
            var prestige_resources_coins = power(prestige_resources_tmp.coins, 0.4);
            prestige_resources_coins *= power(2, coins_persist_upgrade_level);
            prestige_resources_coins = apply_max_leaf_storage(prestige_resources_coins);
            variable_struct_set(prestige_resources, global.resources.coins.key, prestige_resources_coins);
        }
        return prestige_resources;
    }
    else if (arg1 == global.prestige_levels.mlc.level)
    {
        var mlc_base_value = power(floor((global.areas.tower.data.highest_floor - 91) / 10), 4);
        mlc_base_value *= (1 + floor(log10(global.resources.blc.data.count)));
        mlc_base_value = max(10, mlc_base_value);
        var mlc_value = get_bm_value(mlc_base_value, "mlc_value_adder", "mlc_value_multiplier", undefined, true);
        mlc_value *= (1 + global.upgrade_attributes.mlc_value_multiplier_adder);
        mlc_value *= (1 + global.upgrade_attributes.mlc_gems_upgrade);
        mlc_value *= global.game_settings.mlc_value_multiplier;
        mlc_value = apply_max_leaf_storage(mlc_value);
        var prestige_resources = 
        {
            mlc: mlc_value
        };
        var prestige_persist_upgrade_level = get_upgrade_count(global.shops.mlc.coins_persist_mlc);
        if (prestige_persist_upgrade_level > 0)
        {
            var prestige_resources_tmp = get_prestige_resources(false, global.prestige_levels.prestige.level);
            var prestige_resources_coins = power(prestige_resources_tmp.coins, 0.4);
            prestige_resources_coins *= power(2, prestige_persist_upgrade_level);
            prestige_resources_coins = apply_max_leaf_storage(prestige_resources_coins);
            variable_struct_set(prestige_resources, global.resources.coins.key, prestige_resources_coins);
        }
        var blc_persist_upgrade_level = get_upgrade_count(global.shops.mlc.blc_persist_mlc);
        if (blc_persist_upgrade_level > 0)
        {
            var prestige_resources_tmp = get_prestige_resources(false, global.prestige_levels.blc.level);
            var prestige_resources_coins = power(prestige_resources_tmp.blc, 0.4);
            prestige_resources_coins *= power(2, blc_persist_upgrade_level);
            prestige_resources_coins = apply_max_leaf_storage(prestige_resources_coins);
            variable_struct_set(prestige_resources, global.resources.blc.key, prestige_resources_coins);
        }
        return prestige_resources;
    }
    else if (arg1 == global.prestige_levels.ulc.level)
    {
        var value = get_prestige_points(arg1);
        value = get_bm_value(value, undefined, "ulc_value_multiplier", undefined, true);
        value *= (1 + get_prestige_multiplier(arg1));
        value *= (1 + global.upgrade_attributes.ulc_gems_upgrade);
        value *= global.game_settings.ulc_value_multiplier;
        value = apply_max_leaf_storage(rround(value));
        var prestige_resources = 
        {
            ulc: value
        };
        return prestige_resources;
    }
}

function get_prestige_multiplier(arg0)
{
    var multiplier = 0;
    var multiplier_add_value = get_default_struct_value(global.prestige_levels.ulc, "multiplier_add_value", 0);
    if (arg0 == global.prestige_levels.ulc.level)
    {
        var __array = global.ulc_options;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            var points = mitem._get_points();
            if (points <= 0)
            {
                continue;
            }
            multiplier += (get_default_struct_value(o_game.data.ulc_settings, mitem.key, false) ? multiplier_add_value : 0);
        }
    }
    return max(0, multiplier - multiplier_add_value);
}

function get_prestige_points(arg0)
{
    var points = 0;
    if (arg0 == global.prestige_levels.ulc.level)
    {
        points = get_bm_value(global.prestige_levels.ulc.base_points, "ulc_value_adder");
        var __array = global.ulc_options;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (get_default_struct_value(o_game.data.ulc_settings, mitem.key, false))
            {
                points += mitem._get_points();
            }
        }
    }
    return points;
}
