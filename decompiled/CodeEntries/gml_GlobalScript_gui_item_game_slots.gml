function gui_item_game_slots(arg0, arg1, arg2)
{
    var can_play = has_enough_resources(global.costs.slots) && !global.tavern_games_playing.slots && (!instance_exists(o_minigame_slots) || (instance_exists(o_minigame_slots) && o_minigame_slots.visible));
    if (gui_button_tl(arg0, arg1, __("Play"), can_play, gui_col_x(3), undefined, 
    {
        resources_mini: global.costs.slots
    }) || (can_play && keyboard_check_pressed(vk_space)))
    {
        play_slots(arg0, arg1 + gui_col_y(2));
    }
    draw_description(arg0 + gui_col_x(5), arg1, __s("Total plays: %s", number_format(o_game.data.stats.slots.played)));
    var has_background_slots = has_bought_shop_item_safe(global.shops.mulch.slots_offline_play);
    if (has_background_slots)
    {
        var sy = arg1;
        var text = "";
        if (!is_empty(o_game.data.stats.slots.last_offline_win))
        {
            text += __s("Last play: %s", o_game.data.stats.slots.last_offline_win);
        }
        if (get_option(global.options.slots_auto_play_closed))
        {
            var slots_autoplay_time = format_remaining_time(get_timeout_data("slots_autoplay"), undefined, true, "-");
            text += ("\n" + __s("Next passive play: %s", slots_autoplay_time));
        }
        draw_description(arg0 + gui_col_x(11), sy, text);
    }
}

function gui_item_game_slots_add_draw()
{
    global.options.slots_auto_play.draw(add_button_base_x, add_button_base_y);
    if (has_bought_shop_item_safe(global.shops.mulch.slots_offline_play))
    {
        global.options.slots_auto_play_closed.draw(add_button_base_x + gui_col_x(6), add_button_base_y);
    }
}
