function play_borb_claw_machine(arg0, arg1, arg2 = false)
{
    if (!arg2 && (!has_enough_resources(global.costs.borb_claw_machine) || global.tavern_games_playing.claw))
    {
        exit;
    }
    dec_resources(global.costs.borb_claw_machine);
    instance_destroy(o_minigame_borb_claw_machine);
    var o = instance_create_layer(arg0, arg1, global.layers.gui, o_minigame_borb_claw_machine);
    o_game.data.stats.borb_claw_machine.played++;
}

function play_borb_claw_machine_round(arg0 = false)
{
    if (!has_enough_resources(global.costs.borb_claw_machine) || global.tavern_games_playing.claw)
    {
        return undefined;
    }
    dec_resources(global.costs.borb_claw_machine);
    var win_data = get_random_borb_claw_machine_win_item();
    var win_result = get_borb_win_result(win_data.value, win_data.item, arg0);
    if (arg0)
    {
        if (win_result.win)
        {
            o_game.data.stats.borb_claw_machine.last_offline_win = win_result.text;
        }
        else
        {
            o_game.data.stats.borb_claw_machine.last_offline_win = __("No win.");
        }
        o_game.data.stats.borb_claw_machine.played++;
    }
    return win_result;
}

function get_random_borb_claw_machine_win_item()
{
    var is_halloween = is_event_active(global.events.halloween);
    var item = undefined;
    var value = 4;
    var item_count_min = global.game_settings.borb_claw_machine_items_min + get_upgrade_attribute_value(global.upgrade_attributes.claw_items_min);
    var item_count_max = global.game_settings.borb_claw_machine_items_max + get_upgrade_attribute_value(global.upgrade_attributes.claw_items_max);
    var item_count = irandom_range(item_count_min, item_count_max);
    if (irandom((2 + item_count) - 1) < 2)
    {
        return 
        {
            value: 4,
            item: undefined
        };
    }
    var r = random(100);
    if (percent_chance(25) && is_halloween)
    {
        value = 10000;
    }
    else if (percent_chance(0.1) && !in_challenge() && has_locked_items(global.community_leaves))
    {
        var comm_leaf = get_random_locked_item(global.community_leaves);
        value = 101;
        item = comm_leaf;
    }
    else if (percent_chance(0.3) && !in_challenge())
    {
        var chest = get_random_chest([global.chests.rare, global.chests.uncommon, global.chests.common]);
        value = 102;
        item = chest;
    }
    else if (percent_chance(global.game_settings.borb_claw_machine_spawn_chances.curse + (get_upgrade_attribute_value(global.upgrade_attributes.borb_claw_machine_spawn_chances_curse) * 100)))
    {
        value = 1;
    }
    else if (percent_chance(20))
    {
        value = 5;
    }
    else if (percent_chance(30))
    {
        var scroll = array_random_item(global.scrolls_sorted);
        value = 100;
        item = scroll;
    }
    else if (percent_chance(40) && get_upgrade_count(global.shops.blc.unlock_materials))
    {
        var claw_item = array_random_item(global.materials_spawnable);
        value = 103;
        item = claw_item;
    }
    else if (percent_chance(50) && is_unlocked_equipment())
    {
        var claw_item = get_random_droppable_equipment();
        value = 104;
        item = claw_item;
    }
    else
    {
        value = 6;
    }
    return 
    {
        value: value,
        item: item
    };
}
