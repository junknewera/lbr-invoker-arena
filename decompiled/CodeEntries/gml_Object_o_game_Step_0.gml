steam_update();
check_hotkeys();
leaf_step_current_frame++;
if (leaf_step_current_frame >= 60)
{
    leaf_step_current_frame = 0;
}
if (can_elapse_time)
{
    if ((global.dt * 60) < 30)
    {
        o_game.data.stats.time_elapsed_delta += global.dt;
        o_game.data.stats.time_elapsed_delta_max = max(global.dt, o_game.data.stats.time_elapsed_delta_max);
    }
    o_game.data.stats.time_elapsed += global.dtf;
    o_game.data.stats.prestige_time_current += global.dtf;
}
o_game.area.step();
if (o_game.data.stats.time_elapsed >= game_loop_timer)
{
    check_game_loop();
    game_loop_timer = o_game.data.stats.time_elapsed + sec(1);
}
if (o_game.data.stats.time_elapsed >= converter_timer)
{
    check_converters();
    converter_timer = o_game.data.stats.time_elapsed + get_converter_delay();
}
if (o_game.data.stats.time_elapsed >= spawn_interval)
{
    leaves += spawn_count;
    if (can_spawn_leaves())
    {
        var _spawn_count = min(spawn_count, global.max_leaves - instance_number(o_leaf));
        spawn_leaves(_spawn_count);
    }
    if (global.game_settings.custom_leaf_spawn_settings.enabled)
    {
        spawn_count = global.game_settings.custom_leaf_spawn_settings.count;
        spawn_interval_duration = max(1, global.game_settings.custom_leaf_spawn_settings.interval);
    }
    else
    {
        spawn_count = 10 + (get_upgrade_attribute_value(global.upgrade_attributes.trees) * 4);
        spawn_interval_duration = max(1, sec(5) - sec(global.shops.environment.fertilizer.data.count * 0.05));
    }
    spawn_interval = o_game.data.stats.time_elapsed + spawn_interval_duration;
}
combo -= max(0.001, combo_decrease_step);
combo = clamp(combo, 0, combo_max);
combo_multiplier = get_combo_multiplier(combo);
o_game.data.stats.combo_high = max(combo, o_game.data.stats.combo_high);
if (global.is_mobile)
{
    vstick_step(0);
}
o_game.data.stats.time_elapsed_frames++;
