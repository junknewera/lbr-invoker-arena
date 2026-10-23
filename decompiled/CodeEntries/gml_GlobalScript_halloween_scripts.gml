function get_halloween_cursed_cheese_reward()
{
    var reward = 
    {
        resources: {},
        stats: {}
    };
    var drop_borb_count = 1 + get_upgrade_count(global.shops.event.borb_o_lantern_drop_count);
    var multi_drop_chance = get_upgrade_count(global.shops.event.borb_o_lantern_drop_chance);
    drop_borb_count += multi_chance(multi_drop_chance);
    reward.resources.borb_o_lantern = drop_borb_count;
    var drop_leafscended_leaves_chance = 0.1 + get_upgrade_attribute_value(global.upgrade_attributes.cursed_cheese_leafscended_leaves_drop_chance);
    if (percent_chance(drop_leafscended_leaves_chance * 100))
    {
        var res = array_random_item(global.resources_leaves);
        var leafscension_level_min = 1;
        var leafscension_level_max = 1 + get_upgrade_attribute_value(global.upgrade_attributes.cursed_cheese_leafscended_leaves_max_level);
        var leafscension_level = irandom_range(leafscension_level_min, leafscension_level_max);
        reward.resources_leafscended = {};
        variable_struct_set(reward.resources_leafscended, res.key, {});
        variable_struct_set(variable_struct_get(reward.resources_leafscended, res.key), leafscension_level, irandom_range(1, 3));
    }
    var curses_count = 1000000;
    var curses = _clamp(curses_count, 10, o_game.data.stats.cursed_count);
    curses *= (1 + get_upgrade_attribute_value(global.upgrade_attributes.cursed_cheese_curses_multiplier));
    reward.stats.cursed_count = curses;
    return reward;
}
