function gui_item_game_curse(arg0, arg1, arg2)
{
    if (live_auto_call_1())
    {
        var lac_argc = argument_count;
        var lac_args = array_create(lac_argc);
        var lac_argk = 0;
        repeat (lac_argc)
        {
            lac_args[lac_argk] = argument[lac_argk];
            lac_argk++;
        }
        if (live_auto_call_2(lac_args))
        {
            return global.live_result;
        }
    }
    var can_play = can_play_curse();
    if (!instance_exists(o_minigame_curse))
    {
        instance_create_layer(arg0, arg1 + 50, global.layers.gui_items, o_minigame_curse);
    }
    if (gui_button_tl(arg0, arg1, __("Play"), can_play, gui_col_x(3)) || (can_play && keyboard_check_pressed(vk_space)))
    {
        play_curse();
    }
    if (gui_button_tl(arg0 + gui_col_x(4), arg1, __("Choose curse"), undefined, gui_col_x(3)))
    {
        o_npc_curse_machine.open();
    }
}

function gui_item_game_curse_select_stage(arg0, arg1)
{
    if (live_auto_call_1())
    {
        var lac_argc = argument_count;
        var lac_args = array_create(lac_argc);
        var lac_argk = 0;
        repeat (lac_argc)
        {
            lac_args[lac_argk] = argument[lac_argk];
            lac_argk++;
        }
        if (live_auto_call_2(lac_args))
        {
            return global.live_result;
        }
    }
    var col_x = 0;
    var col_y = 0;
    for (var i = 1; i <= global.tavern_games_curse_count; i++)
    {
        var course_id = i;
        var bx = arg0 + (gui_col_x(6) * col_x);
        var by = arg1;
        var can_play = true;
        var course_id_stats = course_id - 1;
        if (i > 1 && variable_struct_get(o_game.data.stats.curse_game, course_id_stats).won == 0)
        {
            can_play = false;
        }
        var stats = variable_struct_get(o_game.data.stats.curse_game, course_id);
        if (!is_struct(stats))
        {
            return "-";
        }
        var hit_min = (stats.hit_min == -1) ? "-" : stats.hit_min;
        var time_min = (stats.time_min == -1) ? "-" : format_time(secr(stats.time_min), true, true);
        var text_below = __s("Best: %s | %s", hit_min, time_min);
        if (gui_button_tl(bx, by, __s("Curse %s", "#" + string(i)), can_play, gui_col_x(5), undefined, 
        {
            text_below: text_below
        }))
        {
            global.tavern_games_curse_level = course_id;
            actions_dialog_simple(gui_item_game_curse, 
            {
                title: __("Curse Machine")
            });
        }
        col_x++;
        if (col_x >= 4)
        {
            col_x = 0;
            arg1 += global.ui_gaps.xxl;
        }
    }
    var fastest_sum = _sum(o_game.data.stats.curse_game, function(arg0)
    {
        return (arg0.time_min == -1) ? 0 : arg0.time_min;
    });
    var completed_count = _sum(o_game.data.stats.curse_game, function(arg0)
    {
        return (arg0.won > 0) ? 1 : 0;
    });
    var stats_text = __s("Completed: %s/%s | Total time: %s", completed_count, global.tavern_games_curse_count, (fastest_sum == 0) ? "-" : format_time(secr(fastest_sum), true, true));
    arg1 += draw_description(arg0, arg1, stats_text);
    if (mp_is_season())
    {
        arg1 += draw_description(arg0, arg1, __("Note: your progress will not be saved automatically while playing mini games. Please double-check your last uploaded save in the settings menu."));
    }
    arg1 += global.ui_gaps.md;
    draw_option(global.options.minigame_cursed_upgrades_enabled, arg0 + gui_col_x(0.5), arg1, undefined, undefined, 5);
}
