function gui_item_borb_jones_prison(arg0, arg1)
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
    if (instance_exists(o_npc_borb_jones_prison))
    {
        o_npc_borb_jones_prison.check_generate_solution();
    }
    var y_start = arg1;
    arg1 += draw_description(arg0, arg1, __("Hot, hot, hot! Hey, you! Yes, you! Please decipher the prison!"));
    var has_borbcipherer = o_game.data.stats.borbcipherer > 0;
    var hints_count = get_upgrade_count(global.shops.coal.ff_prison_hints);
    var xcol = 0;
    for (var i = 0; i < global.game_settings.ff_prison_length; i++)
    {
        var raw_value = get_default_struct_value(o_game.data.flags.ff_prison_values, i, 0);
        if (is_string(raw_value) && raw_value == "")
        {
            raw_value = 0;
        }
        var borb_value = real(raw_value);
        var borb_text = string(borb_value);
        var sprite_color = 16777215;
        if (hints_count > i)
        {
            borb_text += sprintf("%s[%s]", "\n", string_char_at(o_game.data.flags.ff_prison_solution, i + 1));
        }
        if (!has_borbcipherer)
        {
            borb_value = 0;
            borb_text = "?";
            sprite_color = 0;
        }
        if (i > 0 && (i % 6) == 0)
        {
            xcol = 0;
            arg1 += gui_col_y(3);
        }
        if (gui_button_sprite(arg0 + gui_col_x(1) + (xcol * gui_col_x(2.5)), arg1 + gui_col_y(1), spr_borb, undefined, undefined, 
        {
            _image_index: borb_value,
            text: borb_text,
            sprite_color: sprite_color
        }))
        {
            if (!has_borbcipherer)
            {
                exit;
            }
            var click_dir = get_click_dir();
            var value = wrap(borb_value, click_dir, 0, 9);
            variable_struct_set(o_game.data.flags.ff_prison_values, i, value);
            with (o_npc_borb_jones_prison)
            {
                check_solution();
            }
        }
        xcol++;
    }
    if (has_borbcipherer && hints_count >= global.game_settings.ff_prison_length)
    {
        if (gui_button_tl(arg0, arg1 + gui_col_y(4), __("Auto decipher"), undefined, gui_col_x(4)))
        {
            var solution_string = string(o_game.data.flags.ff_prison_solution);
            for (var i = 0; i < min(hints_count, global.game_settings.ff_prison_length); i++)
            {
                variable_struct_set(o_game.data.flags.ff_prison_values, i, string_char_at(solution_string, i + 1));
            }
            with (o_npc_borb_jones_prison)
            {
                check_solution();
            }
        }
    }
    return arg1 - y_start;
}
