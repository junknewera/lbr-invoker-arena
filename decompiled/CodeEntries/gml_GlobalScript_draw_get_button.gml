function draw_get_button(arg0, arg1, arg2, arg3 = -1, arg4 = -1, arg5 = true, arg6 = true, arg7 = false, arg8 = undefined)
{
    arg0 = floor(arg0);
    arg1 = floor(arg1);
    arg3 = floor(arg3);
    arg4 = floor(arg4);
    var is_in_content = mouse_in_gui_content_range();
    var is_dialog_item_button_enabled = true;
    if (global.is_dialog_item_button && !is_in_content)
    {
        is_dialog_item_button_enabled = false;
    }
    var _enabled = get_value_ext(self, arg6, false);
    var _w_start = arg3;
    var mouse_click_check_func = get_default_struct_value(arg8, "mouse_click_check_func", global.is_mobile ? mouse_check_button_released : mouse_check_button_pressed);
    var bg_sprite = get_default_struct_value(arg8, "btn_bg_sprite", spr_textbox_9s);
    var btn_bg_color = is_empty(_enabled) ? 13158600 : 16777215;
    var col1 = btn_bg_color;
    var col2 = btn_bg_color;
    var col3 = 0;
    var font_type = get_default_struct_value(arg8, "font_type");
    var header_text = get_default_struct_value(arg8, "header_text");
    var mouse_click_triggered = mouse_click_check_func(1) || mouse_click_check_func(2);
    var min_width = get_default_struct_value(arg8, "min_width");
    var materials = get_default_struct_value(arg8, "materials");
    var materials_mini = get_default_struct_value(arg8, "materials_mini");
    var materials_options = get_default_struct_value(arg8, "materials_options");
    var resources = get_default_struct_value(arg8, "resources");
    var resources_mini = get_default_struct_value(arg8, "resources_mini");
    var resources_options = get_default_struct_value(arg8, "resources_options");
    var result_mini = get_default_struct_value(arg8, "result_mini");
    var scale_text_width = false;
    var text_below = get_default_struct_value(arg8, "text_below");
    set_default_font(f_gui_button, undefined, undefined, undefined, font_type);
    var text_width = string_width(arg2);
    if (arg3 == -1)
    {
        arg3 = (text_width * 1.5) + 20;
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
            arg3 += 60;
        }
    }
    arg3 = rround(arg3);
    arg4 = rround(arg4);
    var w = arg3 / 2;
    var h = arg4 / 2;
    if (arg2 != "")
    {
        arg4 += 16;
        w = max(arg3 / 2, (text_width / 2) + 15);
        h = max(arg4 / 2, (string_height(arg2) / 2) + 8);
    }
    w = rround(w);
    h = rround(h);
    var prev_color = draw_get_color();
    var prev_alpha = draw_get_alpha();
    var bl = floor(arg0 - w);
    var br = floor(arg0 + w);
    var bt = floor(arg1 - h);
    var bb = floor(arg1 + h);
    var mx1 = bl;
    var my1 = bt;
    var mx2 = br;
    var my2 = bb;
    if (is_struct(arg8) && !is_undefined(struct_get_from_hash(arg8, variable_get_hash("mouse_offset"))))
    {
        mx1 += get_default_value(struct_get_from_hash(arg8.mouse_offset, variable_get_hash("_x")), 0);
        mx2 += get_default_value(struct_get_from_hash(arg8.mouse_offset, variable_get_hash("_x")), 0);
        my1 += get_default_value(struct_get_from_hash(arg8.mouse_offset, variable_get_hash("_y")), 0);
        my2 += get_default_value(struct_get_from_hash(arg8.mouse_offset, variable_get_hash("_y")), 0);
    }
    var in;
    if (arg5)
    {
        in = mouse_in_gui_range(mx1, my1, mx2, my2);
    }
    else
    {
        in = mouse_in_range(mx1, my1, mx2, my2);
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
    }
    draw_set_alpha(1);
    draw_sprite_stretched_ext(spr_textbox_9s, -1, bl, bt, arg3, arg4, btn_bg_color, 1);
    if (!is_undefined(text_below))
    {
        var text_below_final = get_value_ext(arg8, text_below);
        set_default_font(f_gui_small, 1);
        draw_text(arg0, arg1 + h + 10, string(text_below_final));
    }
    if (!is_undefined(icon))
    {
        var icon_pos = 
        {
            x: arg0 - (text_width / 2) - 8,
            y: arg1
        };
        if (!is_undefined(struct_get_from_hash(arg8, variable_get_hash("position"))))
        {
            if (arg8.position == "left")
            {
                icon_pos.x = bl + 36;
            }
        }
        draw_sprite_contain(icon, 0, icon_pos.x, icon_pos.y, 32, 0, 16777215, 1);
        arg0 += 12;
    }
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    if (is_string(header_text))
    {
        draw_set_color(c_white);
        draw_text(arg0, arg1 - h - 14, header_text);
    }
    draw_set_color(text_color);
    if (scale_text_width && text_width >= (arg3 - 30))
    {
        var scale = (arg3 - 30) / text_width;
        scale = clamp(scale, 0.4, 1);
        draw_text_transformed(arg0, arg1, string(arg2), scale, scale, 0);
    }
    else
    {
        draw_text(arg0, arg1, string(arg2));
    }
    draw_set_color(prev_color);
    if (arg7)
    {
        mouse_click_triggered = mouse_click_triggered || global.mouse_click_triggered;
    }
    if (!global.dialog_click_delay)
    {
        mouse_click_triggered = false;
    }
    if (is_struct(arg8))
    {
        if (in && is_string(struct_get_from_hash(arg8, variable_get_hash("tooltip"))) && is_dialog_item_button_enabled)
        {
            draw_tooltip(arg0, arg1, arg3, arg4, struct_get_from_hash(arg8, variable_get_hash("tooltip")), arg8);
        }
    }
    if (instance_exists(o_mouse) && o_mouse.dragging)
    {
        mouse_click_triggered = false;
    }
    if (get_default_struct_value(arg8, "outline", false))
    {
        draw_set_color(c_red);
        draw_rectangle(mx1, my1, mx2, my2, true);
    }
    var x_padding_resources = global.is_mobile ? -0.5 : -0.35;
    var y_padding_resources = global.is_mobile ? 1.05 : 1;
    if (is_struct(materials))
    {
        draw_materials(arg0 + gui_col_x(x_padding_resources), arg1 + gui_col_y(y_padding_resources), materials, 1, materials_options);
    }
    else if (is_struct(materials_mini))
    {
        draw_materials_mini(arg0 + gui_col_x(x_padding_resources), arg1 + gui_col_y(y_padding_resources), materials_mini, 1, materials_options);
    }
    else if (is_struct(resources))
    {
        draw_resources(arg0 + gui_col_x(x_padding_resources), arg1 + gui_col_y(y_padding_resources), resources, 1, resources_options);
    }
    else if (is_struct(resources_mini))
    {
        draw_resources_mini(arg0 + gui_col_x(x_padding_resources), arg1 + gui_col_y(y_padding_resources), resources_mini, 1, resources_options);
    }
    else if (is_struct(result_mini))
    {
        draw_result(arg0 + gui_col_x(x_padding_resources), arg1 + gui_col_y(y_padding_resources), result_mini, undefined, 
        {
            mini: true
        });
    }
    var active = !is_empty(_enabled) && in && mouse_click_triggered;
    if (global.debug && ((keyboard_check(vk_shift) && _w_start == -1) || (keyboard_check(vk_shift) && keyboard_check(vk_control))))
    {
        var debugw = sprintf("DEFcx=%s", arg3 / gui_col_x(1));
        draw_text(arg0, arg1 - 30, debugw);
    }
    if (active && is_dialog_visible() && !is_dialog_item_button_enabled)
    {
        return false;
    }
    return active;
}
