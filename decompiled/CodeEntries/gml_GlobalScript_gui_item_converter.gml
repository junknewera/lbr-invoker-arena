function gui_item_converters(arg0, arg1)
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
    var __array = global.converters_array;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        arg1 += gui_item_converter(arg0, arg1, mitem);
    }
    return arg1 - y_start;
}

function gui_item_converter(arg0, arg1, arg2)
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
    var item = arg2;
    var y_start = arg1;
    if (!is_struct(item))
    {
        return 0;
    }
    var name = get_value_ext(item, item.get_name);
    var description = get_value_ext(item, item.get_description);
    var description_width = gui_col_x(9);
    var item_sprite = item.sprite;
    var item_cost = item.cost;
    var item_reward = item.reward;
    var button_enabled = true;
    var is_obfuscated = item.is_obfuscated();
    if (is_obfuscated)
    {
        button_enabled = false;
        name = "?";
        description = "";
        item_sprite = spr_solid;
        item_cost = spr_solid;
        item_reward = spr_solid;
    }
    set_default_font(f_gui_default);
    gui_draw_sprite(arg0 + gui_col_x(0.5), arg1, item_sprite);
    arg1 += (draw_heading(arg0 + gui_col_x(1), arg1, name, undefined, undefined, undefined, undefined, false) - gui_col_y(0.5));
    arg1 += draw_description(arg0 + gui_col_x(1), arg1, description, description_width);
    if (!is_obfuscated)
    {
        set_default_font(f_gui_default);
        var resources_from_to = get_converter_input_resources(item);
        draw_resources(arg0 + gui_col_x(10), y_start, resources_from_to.from);
        gui_draw_sprite(arg0 + gui_col_x(10.15), y_start + gui_col_y(1.5), spr_gui_arrow_right);
        draw_resources(arg0 + gui_col_x(10.75), y_start + gui_col_y(1), resources_from_to.to);
        if (global.upgrade_attributes.converter_crit_chance > 0 && item.can_crit())
        {
            draw_text_ext(arg0 + gui_col_x(13.5), y_start + gui_col_y(1), __("Crit:"), global.gui_text_line_height, gui_col_x(3));
            var converter_crit_output = item.get_crit_resources();
            draw_resources(arg0 + gui_col_x(15), y_start + gui_col_y(1), converter_crit_output);
        }
        var button_icon = iif(item.data.started, spr_icon_cancel, spr_icon_check);
        var button_text = iif(item.data.started, __("Stop"), __("Start"));
        if (gui_button(arg0 + gui_col_x(20), y_start + gui_col_y(1), button_text, button_enabled, gui_col_x(2), undefined, 
        {
            icon: button_icon
        }))
        {
            item.data.started = !item.data.started;
        }
        var button_text_toggle_opt = 
        {
            tooltip: __("Auto start")
        };
        if (gui_button_toggle(arg0 + gui_col_x(22.5), y_start + gui_col_y(1), item.data.auto_start, true, button_text_toggle_opt))
        {
            item.data.auto_start = !item.data.auto_start;
        }
    }
    else
    {
        arg1 += gui_col_y(0.5);
    }
    return (arg1 - y_start) + gui_col_y(0.5);
}

function gui_item_converters_add_draw()
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
    global.options.converter_batch_enabled.draw(add_button_base_x - gui_col_x(1), add_button_base_y);
    if (gui_button_tl(add_button_base_x + gui_col_x(8), add_button_base_y, __("Start selected"), true, gui_col_x(4), undefined, 
    {
        icon: spr_icon_check
    }))
    {
        start_all_converters(true);
    }
    if (gui_button_tl(add_button_base_x + gui_col_x(13), add_button_base_y, __("Stop selected"), true, gui_col_x(4), undefined, 
    {
        icon: spr_icon_cancel
    }))
    {
        stop_all_converters();
    }
}
