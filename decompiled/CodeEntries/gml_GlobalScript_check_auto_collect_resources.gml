function check_auto_collect_resources()
{
    add_resources(global.game_settings.resources_auto_collect, undefined, undefined, undefined, undefined, undefined, __return_arg);
    add_resources(global.upgrade_attributes.resources_auto_collect, undefined, undefined, undefined, undefined, undefined, __return_arg);
    add_result(global.upgrade_attributes.result_auto_collect, undefined, undefined, true, true);
    var curse_autocollect = get_autocollect_curses();
    if (curse_autocollect > 0)
    {
        o_game.data.autocollect_counters.curses++;
        if (o_game.data.autocollect_counters.curses >= 60)
        {
            var curses = floor(curse_autocollect * 60);
            o_game.data.autocollect_counters.curses = 0;
            o_game.data.stats.cursed_count += curses;
            notify(sprintf(__("Auto curse: %s"), number_format(curses)));
        }
    }
    var material_autocollect = get_upgrade_attribute_value(global.upgrade_attributes.material_autocollect);
    if (material_autocollect > 0)
    {
        o_game.data.autocollect_counters.materials++;
        if (o_game.data.autocollect_counters.materials >= 60)
        {
            var materials = floor(material_autocollect * 60);
            o_game.data.autocollect_counters.materials = 0;
            if (materials > 0)
            {
                var materials_collected = {};
                repeat (materials)
                {
                    var material = get_random_droppable_material();
                    material.collect();
                    add_to_struct_value(materials_collected, material.key, 1);
                }
                if (get_option(global.options.show_autocollected_materials))
                {
                    notify(sprintf(__("Materials auto collected: %s"), format_materials_text(materials_collected)));
                }
                else
                {
                    notify(sprintf(__("%s Materials auto collected."), number_format(materials)));
                }
            }
        }
    }
    var leaf_pub_counter_autocount = get_leaf_pub_autocounter_value();
    if (leaf_pub_counter_autocount > 0)
    {
        var leaf_pub_count_before = o_game.data.stats.leaf_pub_counter;
        o_game.data.stats.leaf_pub_counter += leaf_pub_counter_autocount;
        if (floor(o_game.data.stats.leaf_pub_counter) > floor(leaf_pub_count_before))
        {
            var random_leaf_counter = array_random_item(global.community_leaves_array);
            o_game.data.stats.leaf_pub_last_counter_name = random_leaf_counter.name;
        }
    }
    if (get_option(global.options.slots_auto_play_closed) && has_bought_shop_item_safe(global.shops.mulch.slots_offline_play))
    {
        var slots_autoplay_key = "slots_autoplay";
        if (!has_timeout_data(slots_autoplay_key))
        {
            set_timeout_data(slots_autoplay_key, sec(60));
            play_slots_round(true);
        }
    }
    if (get_upgrade_count(global.shops.mulch.claw_offline_play) > 0 && get_option(global.options.claw_auto_play_closed))
    {
        var claw_autoplay_key = "claw_autoplay";
        if (!has_timeout_data(claw_autoplay_key))
        {
            set_timeout_data(claw_autoplay_key, sec(60));
            play_borb_claw_machine_round(true);
        }
    }
    check_death_book();
    check_soul_forge_count();
}
