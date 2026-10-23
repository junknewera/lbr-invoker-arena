restrict_position_to_room();
bounce_room_edges();
if (dead || disappearing)
{
    image_alpha = lerp(image_alpha, 0, 0.2);
    image_xscale = lerp(image_xscale, 0, 0.2);
    image_yscale = lerp(image_yscale, 0, 0.2);
    if (image_alpha <= 0)
    {
        instance_destroy();
    }
    if (dead)
    {
        exit;
    }
}
expire_timer += global.dtf;
if (expire_timer >= expire_duration)
{
    if (is_boss && !enemy.is_infinite)
    {
        if (damage_timer == 0 && o_game.area.type.enemy_damage_player)
        {
            damage_timer++;
        }
    }
    else
    {
        disappearing = true;
    }
}
if (damage_timer > 0 && o_game.data.stats.time_elapsed >= damage_blower_timer)
{
    var raw_damage = o_game.area.get_damage_timer(damage_timer);
    var damage_resistance = get_player_damage_resistance();
    var damage = (raw_damage - global.upgrade_attributes.damage_resistance_absolute) * (1 - damage_resistance);
    damage = max(1, damage);
    hit_blower(damage, name, enemy);
    damage_timer++;
    damage_blower_timer = o_game.data.stats.time_elapsed + sec(1);
}
if (hp <= 0)
{
    var drop_resource = array_random_item(o_game.area.resources_droppable);
    if (array_length(drop_resources) > 0)
    {
        drop_resource = array_random_item(drop_resources);
    }
    if (is_current_area(global.areas.celestial_plane))
    {
        drop_resource = global.resources.celestial;
    }
    if (!drop_resource.data.unlocked)
    {
        drop_resource = global.resources.leaves;
    }
    var drop_value_divider = max(1, drop_resource.prestige_value);
    var res_multiplier = ((level * 50) / drop_value_divider) * random_range(0.5, 1.5);
    var enemy_drop_multiplier = drop_multiplier * (1 + global.upgrade_attributes.enemy_drop_multiplier) * (1 + global.upgrade_attributes.enemy_drop_multiplier_cards) * (1 + global.upgrade_attributes.enemy_drop_multiplier_dice);
    var res = undefined;
    check_drop_equipment(x, y);
    if (o_game.area.type.count_defeated_enemies)
    {
        global.current_tower_floor_enemies_defeated++;
    }
    if (o_game.area.type.key == global.area_types.tower.key)
    {
        res = get_enemy_tower_reward(is_boss);
        if (is_boss)
        {
            check_drop_gem_leaf(x, y);
            check_drop_scroll();
            tower_advance_floor();
        }
    }
    else if (o_game.area.type.key == global.area_types.dungeon.key)
    {
        res = {};
        if (is_boss)
        {
            dungeon_clear();
        }
    }
    else if (o_game.area.type.key == global.area_types.boss.key)
    {
        o_game.area.boss_spawned = false;
        o_game.area.set_boss_delay();
        enemy.add_reward(soul_boost, false);
        if (!soul_boost)
        {
            var soul_boost_level = enemy.data.db_souls_chance_level;
            if (soul_boost_level > 0)
            {
                var pity_counter_inc_value = enemy.get_pity_counter_inc();
                enemy.data.db_souls_pity_counter += pity_counter_inc_value;
            }
        }
        else
        {
            enemy.data.db_souls_pity_counter = 0;
        }
    }
    else
    {
        res = get_leaf_reward(drop_resource, res_multiplier, enemy_drop_multiplier);
        if (get_upgrade_count(global.shops.mythical.enemy_offline_rewards) > 0)
        {
            var enemy_offline_multiplier = get_upgrade_count(global.shops.mythical.enemy_offline_rewards) * 0.001;
            var enemy_offline_rewards = multiply_struct_values(res, enemy_offline_multiplier);
            add_resources_to_avg(enemy_offline_rewards);
        }
    }
    if (is_unlocked_cards())
    {
        enemy_drop_card(x, y, enemy);
    }
    var __struct = global.upgrade_attributes.enemy_add_reward;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (mitem == 0)
        {
            continue;
        }
        if (!percent_chance(variable_struct_get(global.upgrade_attributes.enemy_add_reward_chance, mkey)))
        {
            continue;
        }
        add_to_struct_value(res, mkey, mitem);
    }
    if (!is_undefined(res))
    {
        add_resources(res, 2, false, true);
    }
    enemy._die();
    if (enemy.is_infinite)
    {
        infinite_counter++;
        init();
    }
    else
    {
        dead = true;
        snd_play(choose(snd_enemy_death_01, snd_enemy_death_02, snd_enemy_death_03));
    }
    o_game.area.enemy_dies(self);
    global.check_milestones_flag = true;
}
if (hit_fx > 0)
{
    hit_fx--;
}
if (!dead && !disappearing)
{
    image_xscale = lerp(image_xscale, xscale, 0.2);
    image_yscale = lerp(image_yscale, yscale, 0.2);
}
