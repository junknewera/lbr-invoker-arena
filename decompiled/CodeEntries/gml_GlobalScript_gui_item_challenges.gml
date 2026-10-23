function gui_item_challenges(arg0, arg1, arg2)
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
    var active_challenge = get_default_value(variable_struct_get(global.challenges, global.globalstats.current_challenge_key), false);
    var active_challenge_name = __("None");
    if (is_struct(active_challenge))
    {
        active_challenge_name = active_challenge.name;
        if (active_challenge.data.current_run_finished)
        {
            active_challenge_name += (" " + sprintf("(%s)", __("completed")));
        }
    }
    draw_text(arg0, arg1, sprintf(__("Active challenge: %s"), active_challenge_name));
    if (!is_struct(active_challenge))
    {
        arg1 += 32;
    }
    else
    {
        if (in_challenge())
        {
            var challenge_time = active_challenge.get_challenge_time();
            if (challenge_time != -1)
            {
                var tmp_text = "";
                if (active_challenge.data.current_run_finished)
                {
                    tmp_text = sprintf(__("Challenge completed in %s"), format_time(active_challenge.data.last_finish_time));
                }
                else
                {
                    tmp_text = sprintf(__("Challenge time: %s"), format_time(challenge_time));
                }
                draw_text(arg0, arg1 + 16, tmp_text);
            }
            if (gui_button(arg0 + gui_col_x(2.5), arg1 + gui_col_y(2), __("Return to main game"), true, gui_col_x(5)))
            {
                change_profile(global.profile_types.def);
            }
        }
        else if (gui_button(arg0 + gui_col_x(2.5), arg1 + gui_col_y(2), __("Resume challenge"), true, gui_col_x(5)))
        {
            active_challenge._resume();
        }
        if (gui_button(arg0 + gui_col_x(8.5), arg1 + gui_col_y(2), __("Stop current challenge"), true, gui_col_x(5)))
        {
            confirm_dialog(__("Do you want to stop the current challenge? You will lose your current challenge progress."), function()
            {
                (variable_struct_get(global.challenges, global.globalstats.current_challenge_key))._stop();
            });
        }
        arg1 += 120;
    }
    if (is_current_dialog_section(global.dialog_sections.challenges.general))
    {
        var __array = global.challenges_sorted;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (mitem.category != "regular")
            {
                continue;
            }
            arg1 += gui_item_challenge(arg0, arg1, mitem);
        }
    }
    return arg1 - y_start;
}
