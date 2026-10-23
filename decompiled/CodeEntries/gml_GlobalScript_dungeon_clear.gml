function dungeon_clear()
{
    instance_destroy(o_enemy);
    global.can_teleport = false;
    o_game.area.data.highest_floor = max(o_game.area.data.highest_floor, global.current_tower_floor);
    o_game.area.data.highest_floor_run = max(o_game.area.data.highest_floor_run, global.current_tower_floor);
    o_game.area.data.highest_floor_stats = max(o_game.area.data.highest_floor_stats, global.current_tower_floor);
    var dungeon_floor = global.current_tower_floor;
    var reward = dungeon_get_reward(o_game.area, dungeon_floor);
    global.can_teleport = true;
    var taxi_cost = get_taxi_cost();
    if (is_undefined(variable_struct_get(o_game.data.stats.resources_collected_avg, global.resources.ancient.key)))
    {
        variable_struct_set(o_game.data.stats.resources_collected_avg, global.resources.ancient.key, 0);
    }
    if (!is_undefined(struct_get_from_hash(reward, variable_get_hash("resources"))) && !is_undefined(struct_get_from_hash(reward.resources, variable_get_hash("ancient"))))
    {
        var reward_ancient = floor(reward.resources.ancient / global.game_settings.ancient_offline_div);
        variable_struct_set(o_game.data.stats.resources_collected_avg, global.resources.ancient.key, max(variable_struct_get(o_game.data.stats.resources_collected_avg, global.resources.ancient.key), reward_ancient));
    }
    if (is_current_area(global.areas.inner_pyramid))
    {
        if (check_taxi())
        {
            var reward_text = add_result(reward, "", 
            {
                title: __("Dungeon reward"),
                subtitle: sprintf(__("Floor %s cleared!"), dungeon_floor)
            }, true);
            notify(sprintf(__("Floor %s cleared! Reward: %s"), dungeon_floor, reward_text));
        }
        else
        {
            change_area(global.areas.pyramid);
            add_result(reward, "", 
            {
                title: __("Dungeon reward"),
                subtitle: sprintf(__("Floor %s cleared!"), dungeon_floor)
            });
        }
    }
    else if (is_current_area(global.areas.soul_crypt))
    {
        if (check_taxi())
        {
            var reward_text = add_result(reward, "", 
            {
                title: __("Dungeon reward"),
                subtitle: sprintf(__("Floor %s cleared!"), dungeon_floor)
            }, true);
            notify(sprintf(__("Floor %s cleared! Reward: %s"), dungeon_floor, reward_text));
        }
        else
        {
            change_area(global.areas.soul_temple);
            add_result(reward, "", 
            {
                title: __("Dungeon reward"),
                subtitle: sprintf(__("Floor %s cleared!"), dungeon_floor)
            });
        }
    }
    check_milestones();
}
