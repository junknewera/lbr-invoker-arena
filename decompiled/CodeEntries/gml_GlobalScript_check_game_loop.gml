function check_game_loop()
{
    var b = 1;
    var benchmark_enabled = false;
    if (!global.debug)
    {
        benchmark_enabled = false;
    }
    var __benchmark_total;
    if (benchmark_enabled)
    {
        __benchmark_total = 0;
    }
    var __benchmark_t;
    if (benchmark_enabled)
    {
        log($"check game loop - {b++}");
        __benchmark_t = current_time;
    }
    check_mobile_review();
    if (get_option(global.options.afk_mode_lost_focus) && !window_has_focus())
    {
        global.options.afk_mode.change(true);
    }
    add_leaf_reward_cache();
    variable_struct_set_post(data.stats.areas_time, o_game.area.key, variable_struct_get(data.stats.areas_time, o_game.area.key) + 1);
    if (room_speed != 60 || game_get_speed(gamespeed_fps) != 60)
    {
        data.cchk++;
        room_speed = 60;
        game_set_speed(60, gamespeed_fps);
    }
    if (global.debug)
    {
        data.dbgchk = 1;
    }
    o_game.data.stats.max_damage = max(1, get_blower_enemy_damage(1));
    if (benchmark_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
        log($"check game loop - {b++}");
        __benchmark_t = current_time;
    }
    check_events();
    get_daily_data_today();
    check_auto_collect_resources();
    check_auto_craft();
    check_auto_pet_pets();
    check_borbventures();
    check_banks();
    check_booster();
    check_candle_game();
    check_cards();
    if (benchmark_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
        log($"check game loop - {b++}");
        __benchmark_t = current_time;
    }
    check_dice();
    check_enemies();
    if (is_unlocked_fishing())
    {
        check_fish();
    }
    if (is_unlocked_mines())
    {
        check_mines();
    }
    if (benchmark_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
        log($"check game loop - {b++}");
        __benchmark_t = current_time;
    }
    check_mirrors();
    if (benchmark_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
        log($"check game loop - {b++}");
        __benchmark_t = current_time;
    }
    check_quarks();
    if (benchmark_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
        log($"check game loop - {b++}");
        __benchmark_t = current_time;
    }
    soul_forge_inc();
    if (benchmark_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
        log($"check game loop - {b++}");
        __benchmark_t = current_time;
    }
    check_spawn_artifacts();
    check_spawn_material();
    check_spawn_unique_leaf();
    if (benchmark_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
        log($"check game loop - {b++}");
        __benchmark_t = current_time;
    }
    var __struct = global.events;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (is_event_active(mitem))
        {
            mitem._game_loop_second();
        }
    }
    if (o_game.area.type.key == global.area_types.idle.key)
    {
        offline_reward_counter++;
        if (offline_reward_counter >= 60)
        {
            add_offline_rewards(60, "", true, false, false, false, true);
            offline_reward_counter = 0;
        }
    }
    else if (o_game.area.type.check_spawn_enemy)
    {
        o_game.area.check_spawn_enemy();
    }
    else
    {
        check_spawn_borbs();
        o_game.area.check_spawn_enemy();
        check_spawn_fruit();
        check_spawn_seeds();
    }
    check_achievements();
    check_artifacts();
    check_auto_crunch();
    check_autofuse_crafted_leaves();
    if (benchmark_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
        log($"check game loop - {b++}");
        __benchmark_t = current_time;
    }
    check_harbor();
    check_leaf_printer();
    check_leafscenders();
    if (global.check_milestones_flag)
    {
        global.check_milestones_flag = false;
        check_milestones();
    }
    check_quests();
    check_recipes();
    check_scrolls();
    check_shadow_crystal();
    check_time_cheat();
    check_trades();
    var __array = global.resources_leaves;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        variable_struct_set(data.stats.resources_collected_avg, mitem.key, max(variable_struct_get(data.stats.resources_collected_count, mitem.key), variable_struct_get(data.stats.resources_collected_avg, mitem.key)));
        variable_struct_set(data.stats.resources_collected_count, mitem.key, 0);
    }
    o_game.area._func_second();
    if (benchmark_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
    }
    if (!is_playing_tavern_games())
    {
        init_game_vars();
    }
}
