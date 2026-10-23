function dungeon_get_reward(arg0, arg1, arg2 = true)
{
    var reward = 
    {
        chests: {},
        resources: {}
    };
    if (arg0.key == global.areas.inner_pyramid.key)
    {
        reward.resources.ancient = global.game_settings.pyramid_ancient_reward * power(arg1, global.game_settings.pyramid_ancient_reward_exp);
        reward.resources.ancient += floor(get_upgrade_attribute_value(global.upgrade_attributes.resources_leaf_add.ancient) * 0.01);
        reward.resources.ancient *= 1 + get_upgrade_attribute_value(global.upgrade_attributes.resources_multiplier.ancient);
        reward.resources.ancient = rround(reward.resources.ancient);
        var get_chest_chance = global.game_settings.pyramid_chest_spawn_chance + (get_upgrade_attribute_value(global.upgrade_attributes.chest_spawn_chance) * 100);
        if (percent_chance(get_chest_chance))
        {
            var chest = get_dungeon_chest(arg1);
            variable_struct_set(reward.chests, chest.key, 1);
        }
    }
    else if (arg0.key == global.areas.soul_crypt.key)
    {
        var soul_keys_value = get_bm_value(arg1 * 1.5, "soul_keys_crypt_base", "soul_keys_crypt_multiplier");
        soul_keys_value = power(soul_keys_value, 1.25);
        soul_keys_value = max(1, ceil(soul_keys_value));
        var soul_particles_value = get_bm_value(arg1 * 2, "soul_particles_crypt_base", "soul_particles_crypt_multiplier");
        soul_particles_value = power(soul_particles_value, 1.25);
        soul_particles_value = max(1, ceil(soul_particles_value));
        var bonus_reward_chance = global.areas.soul_crypt.get_bonus_reward_chance(arg1);
        if (arg2 && percent_chance(bonus_reward_chance))
        {
            add_struct_to_struct(reward, global.areas.soul_crypt.get_bonus_reward(arg1));
        }
        add_to_struct_value(reward.resources, global.resources.soul_keys.key, soul_keys_value);
        add_to_struct_value(reward.resources, global.resources.soul_particles.key, soul_particles_value);
        if (arg1 > 20)
        {
            var soul_empty_value = max(1, 0.15 * power(arg1 - 20, 1.05));
            add_to_struct_value(reward.resources, global.resources.soul_empty.key, soul_empty_value);
        }
    }
    return reward;
}
