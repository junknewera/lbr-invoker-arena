function gui_item_game_borb_claw_machine(arg0, arg1, arg2)
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
    var can_play = can_play_borb_claw_machine();
    var autoplay = get_option(global.options.claw_auto_play) && can_play_borb_claw_machine() && (!instance_exists(o_minigame_borb_claw_machine) || (instance_exists(o_minigame_borb_claw_machine) && o_minigame_borb_claw_machine.visible));
    if (gui_button_tl(arg0, arg1, __("Play"), can_play, gui_col_x(3), undefined, 
    {
        resources_mini: global.costs.borb_claw_machine
    }) || (can_play && keyboard_check_pressed(vk_space)) || autoplay)
    {
        play_borb_claw_machine(arg0, arg1 + 50);
    }
    var has_background_claw = has_bought_shop_item_safe(global.shops.mulch.claw_offline_play);
    if (has_background_claw)
    {
        var sy = arg1;
        draw_description(arg0 + gui_col_x(5), sy, __s("Total plays: %s", number_format(o_game.data.stats.borb_claw_machine.played)));
        var text = "";
        if (!is_empty(o_game.data.stats.borb_claw_machine.last_offline_win))
        {
            text += __s("Last play: %s", o_game.data.stats.borb_claw_machine.last_offline_win);
        }
        if (get_option(global.options.claw_auto_play_closed))
        {
            var claw_autoplay_time = format_remaining_time(get_timeout_data("claw_autoplay"), undefined, true, "-");
            text += ("\n" + __s("Next passive play: %s", claw_autoplay_time));
        }
        draw_description(arg0 + gui_col_x(11), sy, text);
    }
}

function gui_item_game_borb_claw_machine_add_draw()
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
    global.options.claw_auto_play.draw(add_button_base_x, add_button_base_y);
    if (has_bought_shop_item_safe(global.shops.mulch.claw_offline_play))
    {
        global.options.claw_auto_play_closed.draw(add_button_base_x + gui_col_x(6), add_button_base_y);
    }
}
