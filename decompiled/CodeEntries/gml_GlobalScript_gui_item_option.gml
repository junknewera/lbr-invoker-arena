function gui_item_option(arg0, arg1, arg2)
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
    var add_padding = 0;
    var option = arg2;
    if (!is_struct(option))
    {
        return 0;
    }
    set_default_font(f_gui_default);
    var name = option.get_name();
    var desc = option.get_description();
    draw_heading(arg0 + gui_col_x(1), arg1 + gui_col_y(0.4), name, gui_col_x(12));
    if (!is_empty(desc))
    {
        gui_button(arg0 + gui_col_x(0.4), arg1 + gui_col_y(0.45), "?", true, 38, false, 
        {
            tooltip: desc,
            halign: 0,
            force_show_tooltip: true
        });
    }
    if (is_numeric(option.sprite))
    {
        draw_sprite_contain(option.sprite, 0, arg0 + 18, arg1 + 13, 32);
    }
    if (option.has_checkbox)
    {
        set_default_font(f_gui_small);
        draw_text(arg0 + gui_col_x(10), arg1 + gui_col_y(0.25), get_value_ext(option, option.checkbox_text, false));
        if (gui_button_toggle(arg0 + gui_col_x(12), arg1 + gui_col_y(0.5), option.data.checked, true))
        {
            option.data.checked = !option.data.checked;
            option._change();
        }
    }
    else if (option.has_clear_button)
    {
        if (gui_button(arg0 + gui_col_x(12), arg1 + gui_col_y(0.5), "CLR", true, undefined, undefined, 
        {
            tooltip: __("Clear hotkey")
        }))
        {
            if (option.is_hotkey)
            {
                option.data.value = "";
                option.func();
            }
            else
            {
                option.reset();
            }
        }
    }
    var action_button_options = undefined;
    if (option.has_options)
    {
        var option_row = get_option_row(option);
        var has_special_chars = get_default_struct_value(option_row, "has_special_chars", false);
        if (has_special_chars)
        {
            action_button_options = 
            {
                font_type: variable_struct_get(global.fonts.alt, f_gui_small)
            };
        }
    }
    var button_text = get_value_ext(option, option._button_text, false);
    var can_click = option.check();
    if (gui_button(arg0 + gui_col_x(16), arg1 + gui_col_y(0.5), button_text, can_click, gui_col_x(2.5), undefined, action_button_options))
    {
        option._func(true);
    }
    if (option.has_slider)
    {
        if (gui_button(arg0 + gui_col_x(14), arg1 + gui_col_y(0.5), "-", true, gui_col_x(1)))
        {
            option._func(true, -1);
            option.click();
        }
        if (gui_button(arg0 + gui_col_x(18), arg1 + gui_col_y(0.5), "+", true, gui_col_x(1)))
        {
            option._func(true, 1);
            option.click();
        }
    }
    if (!is_undefined(struct_get_from_hash(option, variable_get_hash("add_draw"))))
    {
        var option_add_draw = method(option, option.add_draw);
        option_add_draw(arg0, arg1);
    }
    var padding = global.is_mobile ? 2.5 : 1.75;
    return gui_col_y(padding + add_padding);
}
