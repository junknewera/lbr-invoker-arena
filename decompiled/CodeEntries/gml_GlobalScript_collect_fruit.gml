function collect_fruit()
{
    var fruit_multiply_value = global.game_settings.fruits_base_value * global.upgrade_attributes.fruit_value;
    if (resource.calculate_special)
    {
        fruit_multiply_value = 1;
    }
    var fruit_value = ((global.game_settings.fruits_base_value + fruit_multiply_value) / resource.prestige_value) * (1 + global.upgrade_attributes.fruit_value_multiplier);
    if (get_upgrade_count(global.shops.blc.fruit_leaves_upgrade) == 1)
    {
        var leaf_reward = get_leaf_reward_value(resource, 1, 1);
        var add_leaf_reward_value = power(leaf_reward, 0.5);
        fruit_value += (global.game_settings.fruits_base_value + (((add_leaf_reward_value * (1 + global.upgrade_attributes.fruit_value)) / resource.prestige_value) * (1 + global.upgrade_attributes.fruit_value_multiplier)));
    }
    add_resources_cache(resource, fruit_value);
    add_resources_cache(global.resources.fruits, 1);
    snd_play(choose(snd_pickup_01, snd_pickup_02, snd_pickup_03));
    var fruit_offline_level = get_upgrade_count(global.shops.lava.fruit_offline_rewards);
    if (fruit_offline_level > 0)
    {
        var offline_multiplier = fruit_offline_level * 0.001;
        var offline_value = fruit_value * offline_multiplier;
        add_resources_cache_avg(resource, offline_value);
    }
    if (global.upgrade_attributes.artifact_fruit_seconds_reduction > 0)
    {
        var artifacts_not_spawned = [];
        for (var i = 0; i < array_length(global.artifacts_sorted); i++)
        {
            var _artifact = @@array_get@@(global.artifacts_sorted, i);
            if (_artifact.is_spawned())
            {
                continue;
            }
            array_push(artifacts_not_spawned, _artifact);
        }
        if (array_length(artifacts_not_spawned) > 0)
        {
            var artifact = array_random_item(artifacts_not_spawned);
            artifact.reduce_spawn_time_seconds(global.upgrade_attributes.artifact_fruit_seconds_reduction);
        }
    }
    instance_destroy();
}
