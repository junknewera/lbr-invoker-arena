function get_leaf_reward(arg0, arg1 = 1, arg2 = 1, arg3 = false, arg4 = false)
{
    var add_res_value = 1;
    add_res_value += global.upgrade_attributes.leaf_add;
    add_res_value += variable_struct_get(global.upgrade_attributes.resources_leaf_add, arg0.key);
    if (global.game_settings.combo_enabled)
    {
        add_res_value *= o_game.combo_multiplier;
    }
    add_res_value *= arg1;
    add_res_value *= (1 + global.upgrade_attributes.leaf_multiplier);
    if (arg0.calculate_special)
    {
        var add_res_value_min = 1;
        add_res_value_min += variable_struct_get(global.upgrade_attributes.resources_leaf_add, arg0.key);
        if (variable_struct_get(global.upgrade_attributes.resources_leaf_special_upgrades, arg0.key))
        {
            add_res_value = max(power(add_res_value, 0.2), add_res_value_min);
        }
        else
        {
            add_res_value = add_res_value_min;
        }
    }
    add_res_value *= (1 + variable_struct_get(global.upgrade_attributes.resources_multiplier, arg0.key));
    add_res_value *= (1 + variable_struct_get(global.upgrade_attributes.resources_multiplier_pet, arg0.key));
    add_res_value *= (1 + global.upgrade_attributes.leaf_hard_multiplier);
    add_res_value *= arg2;
    add_res_value *= arg0.reward_value_multiplier;
    if (arg0.key == global.resources.mythical.key)
    {
        add_res_value = irandom_range(1, add_res_value);
    }
    else if (arg0.calculate_single_upgrade)
    {
        add_res_value = 1 + variable_struct_get(global.upgrade_attributes.resources_leaf_add, arg0.key);
        add_res_value *= (1 + variable_struct_get(global.upgrade_attributes.resources_multiplier, arg0.key));
    }
    else if (arg0.calculate_single)
    {
        add_res_value = 1;
    }
    if (arg0.is_gem_leaf)
    {
        add_res_value *= (1 + get_upgrade_attribute_value(global.upgrade_attributes.gem_leaf_multiplier));
        add_res_value *= (1 + get_upgrade_attribute_value(global.upgrade_attributes.gem_leaf_multiplier_cards));
        add_res_value *= (1 + get_upgrade_attribute_value(global.upgrade_attributes.gem_leaf_multiplier_milestone));
        add_res_value *= (1 + get_upgrade_attribute_value(global.upgrade_attributes.gem_leaf_multiplier_pets));
    }
    add_res_value *= (1 + global.upgrade_attributes.leaf_multiplier_borbventure);
    add_res_value *= (1 + global.upgrade_attributes.leaf_multiplier_boost);
    add_res_value *= (1 + global.upgrade_attributes.leaf_multiplier_dice);
    add_res_value *= (1 + global.upgrade_attributes.leaf_multiplier_event);
    add_res_value *= (1 + global.upgrade_attributes.leaf_multiplier_fish);
    add_res_value *= (1 + global.upgrade_attributes.leaf_multiplier_harbor);
    add_res_value *= (1 + global.upgrade_attributes.leaf_multiplier_mine);
    add_res_value *= (1 + global.upgrade_attributes.leaf_multiplier_plants);
    add_res_value *= (1 + global.upgrade_attributes.leaf_multiplier_pets);
    add_res_value *= (1 + get_upgrade_attribute_value(global.upgrade_attributes.leaf_scroll_multiplier));
    add_res_value *= (1 + global.game_settings.leaf_multiplier);
    add_res_value = apply_max_number(ceil(max(1, add_res_value)));
    if (arg4)
    {
        return add_res_value;
    }
    var res_add = {};
    variable_struct_set(res_add, arg0.key, add_res_value);
    return res_add;
}

function get_leaf_reward_value(arg0, arg1 = 1, arg2 = 1)
{
    return get_leaf_reward(arg0, arg1, arg2, false, true);
}

function get_leaf_reward_offline_value(arg0, arg1 = 1)
{
    var add_value_res_upgrades = get_default_struct_value(o_game.data.stats.resources_collected_avg, arg0.key, 0) * arg1;
    var res_add_value = rround((add_value_res_upgrades * (1 + global.upgrade_attributes.offline_multiplier)) / 4);
    res_add_value *= arg0.offline_reward_multiplier;
    res_add_value = apply_max_leaf_storage(res_add_value);
    return res_add_value;
}

function get_available_chest_leaves()
{
    return _filter(global.resources_leaves, function(arg0)
    {
        if (!arg0.data.unlocked || !get_value_ext(arg0, arg0.offline_reward, false) || !get_value_ext(arg0, arg0.available_in_chest, false))
        {
            return false;
        }
        return true;
    });
}

function get_available_offline_reward_leaves()
{
    return _filter(global.resources_leaves, function(arg0)
    {
        if (!arg0.data.unlocked || !get_value_ext(arg0, arg0.offline_reward, false))
        {
            return false;
        }
        return true;
    });
}
