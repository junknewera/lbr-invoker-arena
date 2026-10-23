function gui_item_collectable_usable_item(arg0, arg1, arg2, arg3 = undefined, arg4 = false)
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
    if (is_undefined(arg3))
    {
        arg3 = struct_get_from_hash(arg2, variable_get_hash("__item"));
    }
    if (!is_struct(arg3))
    {
        return global.gui_items_default_height;
    }
    var add_x = 0;
    if (arg4)
    {
        gui_draw_fav(arg0 + gui_col_x(0.3), arg1 + gui_col_y(1), arg3);
        add_x = gui_col_x(1);
    }
    var col = iif(arg3.is_unlocked(), 16777215, 0);
    draw_sprite_stretched_ext(arg3.sprite, 0, arg0 + 8 + add_x, arg1 + 8, 32, 32, col, 1);
    var item_name = get_value_ext(arg3, arg3.get_name, false);
    var name = item_name;
    var description = get_value_ext(arg3, arg3.get_description, false);
    draw_heading(arg0 + gui_col_x(1) + add_x, arg1, name, undefined, undefined, undefined, 0);
    var y_height = gui_col_y(1.5);
    if (get_default_struct_value_ext(arg2, "add_description", true))
    {
        y_height = draw_description(arg0 + gui_col_x(1) + add_x, arg1 + gui_col_y(1), description, gui_col_x(8.75)) + gui_col_y(0.25);
    }
    if (arg3.is_unlocked())
    {
        var display_materials = get_default_struct_value(arg2, "display_materials", false);
        var display_resources = get_default_struct_value(arg2, "display_resources", false);
        if (!is_undefined(display_resources))
        {
            var mini = get_struct_length(arg3.get_display_resources()) > 3;
            if (is_struct(arg3.input_resources_options))
            {
                arg3.input_resources_options.mini = mini;
            }
            draw_resources(arg0 + gui_col_x(10), arg1, arg3.get_display_resources(), 1, arg3.input_resources_options, true);
        }
        if (!is_undefined(display_materials))
        {
            var materials = arg3.get_display_materials();
            if (is_string(materials))
            {
                draw_text_ext(arg0 + gui_col_x(13), arg1, materials, global.gui_text_line_height, gui_col_x(3));
            }
            else if (is_struct(materials))
            {
                var mini_mats = get_struct_length(materials) > 3;
                draw_materials(arg0 + gui_col_x(13), arg1, materials, 1, 
                {
                    insufficient_indicator: true,
                    mini: mini_mats,
                    show_tooltip: true
                }, true);
            }
        }
    }
    else if (arg3.buy_unlock && is_struct(arg3.unlock_cost))
    {
        var mini = get_struct_length(arg3.unlock_cost.resources) > 3;
        var mini_mats = get_struct_length(arg3.unlock_cost.materials) > 3;
        if (is_struct(arg3.input_resources_options))
        {
            arg3.input_resources_options.mini = mini;
        }
        var add_y_res = 0;
        add_y_res += draw_resources(arg0 + gui_col_x(10), arg1, arg3.unlock_cost.resources, 1, arg3.input_resources_options, true);
        add_y_res += draw_materials(arg0 + gui_col_x(13), arg1, arg3.unlock_cost.materials, 1, 
        {
            insufficient_indicator: true,
            mini: mini_mats,
            show_tooltip: true
        }, true);
        y_height += add_y_res;
    }
    var pos_button_use_x = arg0 + get_default_struct_value(arg2, "pos_button_use_x", gui_col_x(17.3));
    var can_do_action = arg3._can_activate();
    if (arg3.is_usable && arg3.is_unlocked())
    {
        var button_text_use = __("Use");
        var button_use_width = get_default_struct_value(arg3, "button_use_width", gui_col_x(2.75));
        var button_use_width_multi = get_default_struct_value(arg3, "button_use_width_multi", gui_col_x(2.75));
        if (!is_undefined(struct_get_from_hash(arg3, variable_get_hash("button_text_use"))))
        {
            button_text_use = get_value_ext(arg3, iif(arg3.is_active(), arg3.button_text_using, arg3.button_text_use));
        }
        if (get_value_ext(arg3, arg3.multiple_use))
        {
            var count = clamp(get_key_modifier(), 1, arg3.data.count);
            var button_text = sprintf("%s %s", button_text_use, number_format(count));
            if (gui_button(pos_button_use_x, arg1 + gui_col_y(0.5), button_text, can_do_action, button_use_width_multi))
            {
                arg3._func(count);
            }
        }
        else
        {
            var button_text = button_text_use;
            if (gui_button(pos_button_use_x, arg1 + gui_col_y(0.5), button_text, can_do_action, button_use_width))
            {
                arg3._func();
            }
        }
        var use_delay_timer = get_default_struct_value(arg3.data, "use_delay_timer", 0);
        var use_delay_diff = use_delay_timer - o_game.data.stats.time_elapsed;
        if (use_delay_diff > 1)
        {
            set_default_font(f_gui_small, 1);
            draw_text(pos_button_use_x, arg1 + gui_col_y(1.5), __s("Cooldown: %s", format_time(secr(use_delay_diff), false, true)));
        }
    }
    else if (arg3.buy_unlock)
    {
        var button_text = __("Unlock");
        can_do_action = arg3._can_unlock();
        if (gui_button(pos_button_use_x, arg1 + gui_col_y(0.5), button_text, can_do_action, gui_col_x(1.5)))
        {
            arg3._unlock();
        }
    }
    if (arg3.cancellable && arg3.is_active())
    {
        var button_text_cancel = __("Cancel");
        var can_cancel = arg3.can_cancel();
        if (gui_button(arg0 + gui_col_x(19.85), arg1 + gui_col_y(0.5), button_text_cancel, can_cancel, gui_col_x(1.9)))
        {
            arg3._cancel();
        }
    }
    if (arg3.is_unlocked() && get_value_ext(arg3, arg3._has_autouse) && get_value_ext(arg3, arg3.can_autouse))
    {
        if (gui_button_toggle(arg0 + gui_col_x(22.8), arg1 + gui_col_y(0.5), arg3.data.autouse, true, 
        {
            tooltip: arg3.get_autouse_tooltip()
        }))
        {
            arg3.data.autouse = !arg3.data.autouse;
        }
    }
    arg3.add_draw(arg0, arg1);
    gui_draw_buy_upgrades(arg0, arg1, arg3);
    y_height += gui_col_y(0.3);
    return y_height;
}
