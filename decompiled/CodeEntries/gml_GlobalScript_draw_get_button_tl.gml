function draw_get_button_tl(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7 = false, arg8 = undefined)
{
    var is_in_content = mouse_in_gui_content_range();
    var is_dialog_item_button_enabled = true;
    if (global.is_dialog_item_button && !is_in_content)
    {
        is_dialog_item_button_enabled = false;
    }
    var _enabled = get_value_ext(self, arg6, false);
    var _w_start = arg3;
    var mouse_click_check_func = global.is_mobile ? mouse_check_button_released : mouse_check_button_pressed;
    var res_y = arg1;
    var x_resources = arg0;
    var x_padding_resources = global.is_mobile ? 0.5 : 0.25;
    var y_padding_resources = global.is_mobile ? 2 : 1.5;
    set_default_font(f_gui_button);
    var button_text_prefix = get_default_struct_value(arg8, "button_text_prefix");
    var button_text_suffix = get_default_struct_value(arg8, "button_text_suffix");
    var button_text_affix_brackets = get_default_struct_value(arg8, "button_text_affix_brackets", true);
    if (is_string(button_text_prefix))
    {
        if (button_text_affix_brackets)
        {
            button_text_prefix = "(" + button_text_prefix + ") ";
        }
        arg2 = button_text_prefix + arg2;
    }
    if (is_string(button_text_suffix))
    {
        if (button_text_affix_brackets)
        {
            button_text_suffix = " (" + button_text_suffix + ")";
        }
        arg2 += button_text_suffix;
    }
    var btn_bg_color = is_empty(_enabled) ? global.colors.button_bg_disabled : 16777215;
    var center = get_default_struct_value(arg8, "center", true);
    var header_text = get_default_struct_value(arg8, "header_text");
    var min_width = get_default_struct_value(arg8, "min_width");
    var selected = get_default_struct_value(arg8, "selected", false);
    var text_below = get_default_struct_value(arg8, "text_below");
    var text_right = get_default_struct_value(arg8, "text_right");
    var text_width = string_width(arg2);
    var timeout = get_default_struct_value(arg8, "timeout");
    var timeout_end = get_default_struct_value(arg8, "timeout_end");
    var scale_text_width = false;
    var materials = get_default_struct_value(arg8, "materials");
    var materials_mini = get_default_struct_value(arg8, "materials_mini");
    var materials_options = get_default_struct_value(arg8, "materials_options");
    var resources = get_default_struct_value(arg8, "resources");
    var resources_mini = get_default_struct_value(arg8, "resources_mini");
    var resources_options = get_default_struct_value(arg8, "resources_options");
    var result_mini = get_default_struct_value(arg8, "result_mini");
    var result_position = get_default_struct_value(arg8, "result_position", "bottom");
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
    if (arg3 == -1)
    {
        arg3 = text_width + 20;
    }
    else
    {
        scale_text_width = true;
    }
    if (is_numeric(min_width))
    {
        arg3 = max(arg3, min_width);
    }
    var icon = undefined;
    if (is_struct(arg8))
    {
        icon = struct_get_from_hash(arg8, variable_get_hash("icon"));
        if (!is_undefined(icon) && _w_start == -1)
        {
            arg3 += 40;
        }
        if (selected)
        {
            btn_bg_color = global.colors.button_bg_selected;
        }
    }
    arg3 = rround(arg3);
    arg4 = rround(arg4);
    var w = floor(arg3 / 2);
    var h = floor(arg4 / 2);
    if (arg2 != "")
    {
        arg4 += 16;
        h = floor(max(arg4 / 2, (string_height(arg2) / 2) + 8));
    }
    var prev_color = draw_get_color();
    var prev_alpha = draw_get_alpha();
    var bl = floor(arg0);
    var br = floor(arg0 + (w * 2));
    var bt = floor(arg1);
    var bb = floor(arg1 + (h * 2));
    var in;
    if (arg5)
    {
        in = mouse_in_gui_range(bl, bt, br, bb);
    }
    else
    {
        in = mouse_in_range(bl, bt, br, bb);
    }
    var text_color = global.colors.text_default;
    if (is_empty(_enabled))
    {
        text_color = global.colors.text_disabled;
    }
    else if (in)
    {
        btn_bg_color = global.colors.button_bg_hover;
        text_color = global.colors.text_hover;
        if (selected)
        {
            btn_bg_color = global.colors.button_bg_hover_selected;
        }
    }
    draw_set_alpha(1);
    draw_sprite_stretched_ext(global.gui_settings.button_bg_sprite, -1, bl, bt, arg3, arg4, btn_bg_color, 1);
    if (!is_empty(text_below))
    {
        var text_below_final = get_value_ext(arg8, text_below);
        set_default_font(f_gui_small, 1);
        draw_description(bl + (arg3 / 2), bt + arg4 + 5, text_below_final, max(arg3, gui_col_x(2)), 1);
        res_y += (global.is_mobile ? 30 : 20);
    }
    if (!is_empty(text_right))
    {
        draw_description(br + 16, bt + 9, text_right, get_default_struct_value(arg8, "text_right_width", gui_col_x(6)));
    }
    if (result_position == "top")
    {
        res_y = arg1 - gui_col_y(2.5);
    }
    var font_halign = 0;
    var text_x = arg0 + 10;
    var text_y = arg1 + h;
    if (center)
    {
        font_halign = 1;
        text_x = arg0 + w;
        x_resources = text_x - (global.is_mobile ? 48 : 24);
    }
    if (!is_undefined(icon))
    {
        var icon_pos = 
        {
            x: arg0 + 24,
            y: arg1 + h
        };
        if (center)
        {
            icon_pos.x = text_x - (text_width / 2) - 8;
        }
        if (!is_undefined(struct_get_from_hash(arg8, variable_get_hash("position"))))
        {
        }
        draw_sprite_contain(icon, 0, icon_pos.x, icon_pos.y, 32, 0, 16777215, 1);
        text_x += 16;
        arg0 += 16;
        text_width += 64;
    }
    if (is_struct(arg8))
    {
        if (in && is_string(struct_get_from_hash(arg8, variable_get_hash("tooltip"))) && is_dialog_item_button_enabled)
        {
            draw_tooltip(bl + (arg3 / 2), bt + (arg4 / 2), arg3, arg4, struct_get_from_hash(arg8, variable_get_hash("tooltip")), arg8);
        }
    }
    draw_set_halign(font_halign);
    draw_set_valign(fa_middle);
    if (is_string(header_text))
    {
        draw_set_color(c_white);
        draw_text(text_x, text_y - h - 14, header_text);
    }
    draw_set_color(text_color);
    if (scale_text_width && text_width >= (arg3 - 30))
    {
        var scale = (arg3 - 30) / text_width;
        scale = clamp(scale, 0.4, 1);
        draw_text_transformed(text_x, text_y, string(arg2), scale, scale, 0);
    }
    else
    {
        draw_text(text_x, text_y, string(arg2));
    }
    draw_set_color(prev_color);
    draw_set_alpha(prev_alpha);
    var check_mb_middle = get_default_struct_value(arg8, "check_mb_middle", false) ? mouse_click_check_func(3) : false;
    var check_mwheelup = get_default_struct_value(arg8, "check_mwheelup", false) ? mouse_wheel_up() : false;
    var check_mwheeldown = get_default_struct_value(arg8, "check_mwheeldown", false) ? mouse_wheel_down() : false;
    var mouse_click_triggered = mouse_click_check_func(1) || mouse_click_check_func(2) || check_mb_middle || check_mwheelup || check_mwheeldown;
    if (arg7)
    {
        mouse_click_triggered = mouse_click_triggered || global.mouse_click_triggered;
    }
    if (!global.dialog_click_delay)
    {
        mouse_click_triggered = false;
    }
    if (instance_exists(o_mouse) && o_mouse.dragging)
    {
        mouse_click_triggered = false;
    }
    if (!is_undefined(materials))
    {
        draw_materials(x_resources + gui_col_x(x_padding_resources), res_y + gui_col_y(y_padding_resources), materials, 1, materials_options);
        res_y += 32;
    }
    if (!is_undefined(materials_mini))
    {
        draw_materials_mini(x_resources + gui_col_x(x_padding_resources), res_y + gui_col_y(y_padding_resources), materials_mini, 1, materials_options);
        res_y += 24;
    }
    if (!is_undefined(resources))
    {
        draw_resources(x_resources + gui_col_x(x_padding_resources), res_y + gui_col_y(y_padding_resources), resources, 1, resources_options);
        res_y += 32;
    }
    if (!is_undefined(resources_mini))
    {
        draw_resources_mini(x_resources + gui_col_x(x_padding_resources), res_y + gui_col_y(y_padding_resources), resources_mini, 1, resources_options);
        res_y += 24;
    }
    var active = !is_empty(_enabled) && in && mouse_click_triggered;
    if (global.debug && ((keyboard_check(vk_shift) && _w_start == -1) || (keyboard_check(vk_shift) && keyboard_check(vk_control))))
    {
        var debugw = sprintf("TLcx=%s", arg3 / gui_col_x(1));
        draw_text(arg0, arg1 - 15, debugw);
    }
    if (active && is_dialog_visible() && !is_dialog_item_button_enabled)
    {
        return false;
    }
    return active;
}

function gui_button_tl(arg0, arg1, arg2, arg3 = true, arg4 = -1, arg5 = false, arg6 = undefined)
{
    return draw_get_button_tl(arg0, arg1, arg2, arg4, get_default_struct_value(arg6, "height", global.gui_button_height), true, arg3, arg5, arg6);
}
