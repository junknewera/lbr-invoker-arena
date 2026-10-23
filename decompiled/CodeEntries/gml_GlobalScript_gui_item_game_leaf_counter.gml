function gui_item_game_leaf_counter(arg0, arg1, arg2)
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
    var y_start = arg1;
    var can_play = can_play_leaf_counter();
    var autoplay = false;
    var leaf_count = get_leaf_pub_counter_value();
    arg1 += draw_heading(arg0, arg1, sprintf("%s: %s", __("Count"), number_format(floor(o_game.data.stats.leaf_pub_counter)), 0));
    var time_diff = o_game.data.stats.leaf_pub_counter_delay - o_game.data.stats.time_elapsed;
    var time_formatted;
    if (time_diff > 0)
    {
        time_formatted = format_time(secr(time_diff));
    }
    else
    {
        time_formatted = __("Ready");
    }
    arg1 += draw_description(arg0, arg1, sprintf("%s: %s", __("Next available count"), time_formatted));
    arg1 += global.ui_gaps.xs;
    if (gui_button_tl(arg0, arg1, __("Count"), can_play, gui_col_x(4), undefined, 
    {
        text_below: sprintf("+%s", number_format(leaf_count))
    }) || (can_play && keyboard_check_pressed(vk_space)) || autoplay)
    {
        leaf_pub_count(leaf_count);
    }
    if (is_unlocked_resource(global.resources.cheese))
    {
        var bet_multiplier_cheese = 3 + get_upgrade_attribute_value(global.upgrade_attributes.leaf_pub_counter_bet_multiplier);
        var bet_chance_cheese = 0.3 + get_upgrade_attribute_value(global.upgrade_attributes.leaf_pub_counter_bet_chance);
        var bet_resources_cheese = build_resource_cost(global.resources.cheese, 500);
        var can_bet_cheese = can_play && has_enough_resources(bet_resources_cheese);
        var leaf_count_cheese = leaf_count * bet_multiplier_cheese;
        var bet_text_cheese = implode("\n", [__s("Chance: %s", number_format_percent(bet_chance_cheese)), __s("Multiplier: %s", number_format(bet_multiplier_cheese)), __s("Count: %s", number_format(leaf_count_cheese))]);
        if (gui_button_tl(arg0 + gui_col_x(7), arg1, __("Bet"), can_bet_cheese, gui_col_x(4), undefined, 
        {
            center: true,
            resources_mini: bet_resources_cheese
        }))
        {
            dec_resources(bet_resources_cheese);
            if (percent_chance(bet_chance_cheese * 100))
            {
                notify(__("Bet succeeded!"));
                leaf_pub_count(leaf_count_cheese);
            }
            else
            {
                notify(__("Bet failed!"));
                leaf_pub_count_set_timeout();
            }
        }
        draw_description(arg0 + gui_col_x(12), arg1, bet_text_cheese);
        arg1 += (global.ui_gaps.xl * 1.5);
    }
    arg1 += draw_description(arg0, arg1, concatstr_nl(sprintf("%s: %s", __("Bonus damage"), number_format_percent(get_blower_leaf_counter_bonus_damage(o_game.data.stats.leaf_pub_counter))), "", __s("Count value: %s", number_format(get_leaf_pub_counter_value())), __s("Auto count: %s", format_value_time_parts(get_leaf_pub_autocounter_value())), "", sprintf("%s: %s", __("Last Counter"), o_game.data.stats.leaf_pub_last_counter_name)));
    return arg1 - y_start;
}
