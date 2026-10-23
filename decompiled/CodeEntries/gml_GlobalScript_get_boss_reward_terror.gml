function get_boss_reward_terror()
{
    var drop_shards_count = get_enemy_drop_shards_count(irandom_range(75, 100));
    var reward = 
    {
        resources: 
        {
            shards: ceil(drop_shards_count)
        }
    };
    var drop_leafscended_leaves_chance = 0.1;
    if (percent_chance(drop_leafscended_leaves_chance * 100))
    {
        var res = array_random_item(global.resources_leaves);
        var leafscension_level = 1;
        reward.resources_leafscended = {};
        variable_struct_set(reward.resources_leafscended, res.key, {});
        variable_struct_set(variable_struct_get(reward.resources_leafscended, res.key), leafscension_level, 1);
    }
    return reward;
}
