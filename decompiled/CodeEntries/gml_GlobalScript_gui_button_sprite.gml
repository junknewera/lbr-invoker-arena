function gui_button_sprite(arg0, arg1, arg2, arg3 = true, arg4 = false, arg5 = undefined)
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
    var _enabled = get_value_ext(self, arg3, false);
    var _image_index = get_default_struct_value(arg5, "_image_index", 0);
    var display_count = get_default_struct_value(arg5, "display_count", false);
    var is_gui = get_default_struct_value(arg5, "is_gui", true);
    var item = get_default_struct_value(arg5, "item");
    var mouse_click_check_func = global.is_mobile ? mouse_check_button_released : mouse_check_button_pressed;
    var mb_check = get_default_struct_value(arg5, "mb_check", 1);
    var sprite_scale_size = get_default_struct_value(arg5, "sprite_scale_size", global.gui_sprite_scale);
    var text = get_default_struct_value(arg5, "text", undefined);
    var text_before = get_default_struct_value(arg5, "text_before", undefined);
    var text_below = get_default_struct_value(arg5, "text_below", undefined);
    var text_inside = get_default_struct_value(arg5, "text_inside", undefined);
    var timeout = get_default_struct_value(arg5, "timeout", undefined);
    var timeout_end = get_default_struct_value(arg5, "timeout_end", undefined);
    var scale_size = (16 * sprite_scale_size) + 8;
    var scale_size_half = scale_size * 0.5;
    var alpha = get_default_struct_value(arg5, "alpha", 1);
    var btn_bg_color = get_default_struct_value(arg5, "btn_bg_color", is_empty(_enabled) ? 13158600 : 16777215);
    if (is_undefined(btn_bg_color))
    {
        btn_bg_color = 16777215;
    }
    var btn_bg_sprite = get_default_struct_value(arg5, "btn_bg_sprite", spr_textbox_9s);
    var sprite_color = get_default_struct_value(arg5, "sprite_color", 16777215);
    var selected = get_default_struct_value(arg5, "selected", false);
    var add_width = 0;
    var x_resources = arg0 - gui_col_x(0.2);
    var x_padding_resources = global.is_mobile ? -0.1 : 0;
    var y_padding_resources = global.is_mobile ? 1.25 : 0.9;
    var materials = get_default_struct_value(arg5, "materials", undefined);
    var materials_mini = get_default_struct_value(arg5, "materials_mini", undefined);
    var materials_options = get_default_struct_value(arg5, "materials_options", undefined);
    var resources = get_default_struct_value(arg5, "resources", undefined);
    var resources_mini = get_default_struct_value(arg5, "resources_mini", undefined);
    var resources_options = get_default_struct_value(arg5, "resources_options", undefined);
    var result_mini = get_default_struct_value(arg5, "result_mini", undefined);
    if (is_struct(result_mini))
    {
        if (is_struct(struct_get_from_hash(result_mini, variable_get_hash("materials"))))
        {
            materials_mini = result_mini.materials;
        }
        if (is_struct(struct_get_from_hash(result_mini, variable_get_hash("resources"))))
        {
            resources_mini = result_mini.resources;
        }
    }
    var res_y = arg1;
    if (is_numeric(timeout_end) && timeout_end > o_game.data.stats.time_elapsed)
    {
        timeout = secr(timeout_end - o_game.data.stats.time_elapsed);
    }
    if (is_numeric(timeout) && timeout > 0)
    {
        var timeout_text = format_time(timeout, false, true);
        if (!is_string(text_below))
        {
            text_below = timeout_text;
        }
        else
        {
            text_below += ("\n" + timeout_text);
        }
    }
    var is_in_content = mouse_in_gui_content_range();
    var is_dialog_item_button_enabled = true;
    if ((global.is_dialog_item_button && !is_in_content) || !is_gui)
    {
        is_dialog_item_button_enabled = false;
    }
    var mx1 = arg0 - scale_size_half;
    var my1 = arg1 - scale_size_half;
    var mx2 = arg0 + scale_size_half;
    var my2 = arg1 + scale_size_half;
    var mx1o = mx1;
    var my1o = my1;
    var mx2o = mx2;
    var my2o = my2;
    if (is_struct(arg5))
    {
        if (!is_undefined(struct_get_from_hash(arg5, variable_get_hash("mouse_offset"))))
        {
            mx1 += get_default_value(struct_get_from_hash(arg5.mouse_offset, variable_get_hash("_x")), 0);
            mx2 += get_default_value(struct_get_from_hash(arg5.mouse_offset, variable_get_hash("_x")), 0);
            my1 += get_default_value(struct_get_from_hash(arg5.mouse_offset, variable_get_hash("_y")), 0);
            my2 += get_default_value(struct_get_from_hash(arg5.mouse_offset, variable_get_hash("_y")), 0);
        }
        if (selected)
        {
            btn_bg_color = 16728128;
        }
    }
    if (!is_undefined(text_inside))
    {
        add_width += (string_width(string(text_inside)) + 16);
    }
    var in;
    if (is_gui)
    {
        in = mouse_in_gui_range(mx1, my1, mx2, my2 + scale_size_half);
    }
    else
    {
        in = mouse_in_range(mx1, my1, mx2, my2);
    }
    if (!selected)
    {
        if (is_empty(_enabled))
        {
        }
        else if (in)
        {
            btn_bg_color = merge_color(btn_bg_color, global.colors.button_bg_hover, 0.8);
        }
    }
    if (is_undefined(btn_bg_color))
    {
        btn_bg_color = global.colors.white;
    }
    var check_mwheelup = get_default_struct_value(arg5, "check_mwheelup", false) ? mouse_wheel_up() : false;
    var check_mwheeldown = get_default_struct_value(arg5, "check_mwheeldown", false) ? mouse_wheel_down() : false;
    var mouse_click_triggered = mouse_click_check_func(1) || mouse_click_check_func(2) || mouse_click_check_func(3) || check_mwheelup || check_mwheeldown;
    if (arg4)
    {
        mouse_click_triggered = global.mouse_click_triggered;
    }
    if (!global.dialog_click_delay)
    {
        mouse_click_triggered = false;
    }
    draw_sprite_stretched_ext(btn_bg_sprite, -1, arg0 - scale_size_half - 4, arg1 - scale_size_half - 4, scale_size + 8 + add_width, scale_size + 8, btn_bg_color, alpha);
    var spr_x = (arg0 - (sprite_get_width(arg2) / 2)) + sprite_get_xoffset(arg2);
    var spr_y = (arg1 - (sprite_get_height(arg2) / 2)) + sprite_get_yoffset(arg2);
    var contain_size = get_default_struct_value(arg5, "sprite_contain") ? 32 : 0;
    gui_draw_sprite(spr_x, spr_y, arg2, sprite_color, undefined, alpha, undefined, _image_index, undefined, undefined, contain_size);
    if (display_count && is_struct(item) && is_struct(struct_get_from_hash(item, variable_get_hash("data"))))
    {
        set_default_font(f_gui_small, 1, 0);
        draw_text_shadow(mx1 + ((mx2 - mx1) / 2), my2 + 4, number_format(get_default_struct_value(item.data, "count", 0)), 16777215);
    }
    if (is_struct(arg5))
    {
        if (in && is_dialog_item_button_enabled)
        {
            if (!is_undefined(struct_get_from_hash(arg5, variable_get_hash("tooltip_func"))))
            {
                arg5.tooltip_func(arg0, arg1);
            }
            else if (!is_undefined(struct_get_from_hash(arg5, variable_get_hash("tooltip"))))
            {
                draw_tooltip(mx1 + scale_size_half, my1 + scale_size_half, scale_size, scale_size + 36, struct_get_from_hash(arg5, variable_get_hash("tooltip")), arg5);
            }
        }
    }
    if (is_string(text_before))
    {
        set_default_font(f_gui_small, 2, 1);
        draw_text(arg0 - scale_size_half - 16, arg1 - 1, string(text_before));
    }
    if (!is_undefined(text_inside))
    {
        set_default_font(f_gui_small, 0, 1, 0);
        draw_text(mx2 + 5, arg1 - 1, string(text_inside));
        mx2o += string_width(string(text_inside));
    }
    if (!is_undefined(text))
    {
        set_default_font(f_gui_small, 0, 1);
        draw_text(mx2 + 12, arg1, string(text));
    }
    if (!is_undefined(text_below))
    {
        set_default_font(f_gui_small, 1, 1);
        draw_text(mx1 + ((mx2 - mx1) / 2), my2 + 16, string(text_below));
        res_y += (global.is_mobile ? 30 : 20);
    }
    if (!is_undefined(materials))
    {
        draw_materials(x_resources + gui_col_x(x_padding_resources), res_y + gui_col_y(y_padding_resources), materials, 1, materials_options);
    }
    else if (!is_undefined(materials_mini))
    {
        draw_materials_mini(x_resources + gui_col_x(x_padding_resources), res_y + gui_col_y(y_padding_resources), materials_mini, 1, materials_options);
    }
    else if (!is_undefined(resources))
    {
        draw_resources(x_resources + gui_col_x(x_padding_resources), res_y + gui_col_y(y_padding_resources), resources, 1, resources_options);
    }
    else if (!is_undefined(resources_mini))
    {
        draw_resources_mini(x_resources + gui_col_x(x_padding_resources), res_y + gui_col_y(y_padding_resources), resources_mini, 1, resources_options);
    }
    if (global.debug && keyboard_check(vk_control))
    {
        var c = in ? 16711680 : 255;
        draw_set_color(c);
        draw_rectangle(mx1o, my1o, mx2o, my2o, true);
        draw_set_color(c_white);
    }
    var active = !is_empty(_enabled) && in && mouse_click_triggered;
    if (active && is_dialog_visible() && !is_dialog_item_button_enabled)
    {
        return false;
    }
    return active;
}

function gui_button_sprite_tl(arg0, arg1, arg2, arg3 = true, arg4 = false, arg5 = undefined)
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
    return gui_button_sprite(arg0 + gui_col_x(0.3), arg1 + gui_col_x(0.3), arg2, arg3, arg4, arg5);
}

function gui_button_toggle(arg0, arg1, arg2, arg3 = true, arg4 = undefined)
{
    var sprite = arg2 ? spr_icon_check : spr_icon_cancel;
    return gui_button_sprite(arg0, arg1, sprite, arg3, false, arg4);
}

function gui_button_toggle_lock(arg0, arg1, arg2, arg3 = "locked", arg4 = true, arg5 = undefined)
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
    if (!is_struct(arg2) || !is_struct(struct_get_from_hash(arg2, variable_get_hash("data"))) || is_undefined(variable_struct_get(arg2.data, arg3)))
    {
        exit;
    }
    var status = variable_struct_get(arg2.data, arg3);
    var hotkey = get_default_struct_value(arg5, "hotkey", undefined);
    var sprite = status ? spr_icon_lock : spr_icon_lock_open;
    var button_status = gui_button_sprite(arg0, arg1, sprite, arg4, false, arg5);
    if (!is_undefined(hotkey) && keyboard_check_pressed(hotkey))
    {
        button_status = true;
    }
    if (button_status)
    {
        variable_struct_set(arg2.data, arg3, !variable_struct_get(arg2.data, arg3));
    }
    return button_status;
}

function gui_button_salvage(arg0, arg1, arg2, arg3 = "salvage_confirm", arg4 = 1, arg5 = "locked", arg6 = true, arg7 = undefined, arg8 = true)
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
    if (!is_struct(arg2) || !is_struct(struct_get_from_hash(arg2, variable_get_hash("data"))) || is_undefined(variable_struct_get(arg2.data, arg5)) || is_undefined(variable_struct_get(arg2, arg3)))
    {
        exit;
    }
    if (!is_struct(arg7))
    {
        arg7 = {};
    }
    if (is_undefined(struct_get_from_hash(arg7, variable_get_hash("tooltip"))))
    {
        arg7.tooltip = __("Salvage");
    }
    var can_salvage = arg8 ? (arg6 && !variable_struct_get(arg2.data, arg5)) : arg6;
    if (gui_button_sprite(arg0, arg1, spr_icon_salvage, can_salvage, undefined, arg7))
    {
        variable_struct_get(arg2, arg3)(arg4);
    }
}
