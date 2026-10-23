function clear_selected_item(arg0, arg1 = undefined)
{
    instance_destroy(o_tooltip);
    if (is_struct(variable_struct_get(global.selected_inventory_item, arg0)))
    {
        var selected_item = variable_struct_get(global.selected_inventory_item, arg0);
        if (selected_item == arg1)
        {
            if (is_struct(selected_item) && is_struct(struct_get_from_hash(selected_item, variable_get_hash("data"))) && is_numeric(struct_get_from_hash(selected_item.data, variable_get_hash("count"))) && selected_item.data.count <= 0)
            {
                variable_struct_set(global.selected_inventory_item, arg0, undefined);
            }
        }
    }
}

function draw_button_array(arg0, arg1, arg2 = [])
{
    if (global.is_mobile)
    {
        _y_padding += 1;
    }
    var col_x = 0;
    var col_y = 0;
    var __array = arg2;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (gui_button_tl(arg0 + gui_col_x(col_x * 4), arg1 + gui_col_y(col_y * 2), get_default_struct_value(mitem, "text", __i), undefined, gui_col_x(3.5)))
        {
            if (is_callable(struct_get_from_hash(mitem, variable_get_hash("func"))))
            {
                mitem.func();
            }
        }
        col_x++;
        if (col_x >= 4)
        {
            col_x = 0;
            col_y++;
        }
    }
    return gui_col_y((col_y + 1) * 2);
}

function draw_button_list(arg0, arg1, arg2, arg3, arg4, arg5 = __return_true, arg6 = 2, arg7 = -1, arg8 = undefined, arg9 = undefined)
{
    if (global.is_mobile)
    {
        arg6 += 1;
    }
    for (var i = 0; i < arg3; i++)
    {
        var enabled = arg5(i);
        var opt = undefined;
        if (is_numeric(arg8) && i == arg8)
        {
            opt = 
            {
                selected: true
            };
        }
        if (!is_undefined(arg9))
        {
            if (gui_button_sprite_tl(arg0, arg1 + gui_col_y(i * arg6), arg9, enabled, undefined, opt))
            {
                arg4(i);
            }
        }
        else if (gui_button_tl(arg0, arg1 + gui_col_y(i * arg6), sprintf(arg2, i + 1), enabled, arg7, undefined, opt))
        {
            arg4(i);
        }
    }
    return gui_col_y((arg3 * arg6) + 1);
}

function draw_button_list_items(arg0, arg1, arg2, arg3 = undefined)
{
    var button_width = get_default_struct_value(arg3, "button_width", gui_col_x(4));
    var height = get_default_struct_value(arg3, "height", global.gui_settings.content_height - gui_col_y(3));
    var items_per_page = get_default_struct_value(arg3, "items_per_page", global.is_mobile ? 5 : 7);
    var paging = get_default_struct_value(arg3, "paging", true);
    var selected_item_name = get_default_struct_value(arg3, "selected_item_name", "unknown");
    var y_padding = global.is_mobile ? 2.25 : 1.5;
    var y_start = arg1;
    var box_padding_x = 15;
    var box_padding_y = 30;
    var box_x1 = arg0 - box_padding_x;
    var box_x2 = arg0 + button_width + box_padding_x;
    var box_y1 = arg1 - box_padding_y;
    var box_y2 = 0;
    var selected_key = "";
    if (is_struct(variable_struct_get(global.selected_inventory_item, selected_item_name)))
    {
        selected_key = get_default_struct_value(variable_struct_get(global.selected_inventory_item, selected_item_name), "key", "");
    }
    var current_guide_page_name = sprintf("%s_%s", "paging", selected_item_name);
    var current_guide_page = get_default_struct_value(global.selected_inventory_item, current_guide_page_name, 0);
    var length = array_length(arg2);
    var page_start = current_guide_page * items_per_page;
    var page_end = min(length, page_start + items_per_page);
    var pages_count = floor(divide_safe(length - 1, items_per_page));
    var paging_text = sprintf("%s/%s", current_guide_page + 1, pages_count + 1);
    if (page_start >= length)
    {
        page_start = 0;
        variable_struct_set(global.selected_inventory_item, current_guide_page_name, 0);
    }
    for (var i = page_start; i < page_end; i++)
    {
        if (i < 0 || i >= length)
        {
            break;
        }
        var item = arg2[i];
        var button_enabled = get_default_struct_value_ext(item, "is_button_enabled", true);
        var button_text = item.get_name();
        if (gui_button_tl(arg0, arg1, button_text, button_enabled, gui_col_x(4), undefined, 
        {
            selected: selected_key == struct_get_from_hash(item, variable_get_hash("key"))
        }))
        {
            variable_struct_set(global.selected_inventory_item, selected_item_name, item);
            if (is_callable(struct_get_from_hash(arg3, variable_get_hash("on_select"))))
            {
                arg3.on_select(item);
            }
        }
        if (get_default_struct_value_data(item, "locked", false))
        {
            gui_draw_sprite(arg0 + gui_col_x(4), arg1 + 2, spr_icon_lock, undefined, 2);
        }
        if (is_callable(struct_get_from_hash(arg3, variable_get_hash("add_draw"))))
        {
            arg3.add_draw(arg0, arg1, item);
        }
        arg1 += gui_col_y(y_padding);
    }
    if (paging && length > items_per_page)
    {
        var paging_y = y_start + (items_per_page * gui_col_y(y_padding)) + gui_col_y(y_padding);
        box_y2 = paging_y + box_padding_y;
        if ((mouse_wheel_down() || mouse_wheel_up()) && mouse_in_gui_range(box_x1, box_y1, box_x2, box_y2))
        {
            var dir = mouse_wheel_down() ? 1 : -1;
            variable_struct_set(global.selected_inventory_item, current_guide_page_name, current_guide_page + (1 * dir * get_key_modifier()));
        }
        if (current_guide_page > 0)
        {
            if (gui_button_sprite(arg0 + gui_col_x(0.5), paging_y, spr_gui_arrow_left))
            {
                variable_struct_set(global.selected_inventory_item, current_guide_page_name, current_guide_page - (1 * get_key_modifier()));
            }
        }
        if (((current_guide_page * items_per_page) + items_per_page) < length)
        {
            if (gui_button_sprite(arg0 + gui_col_x(3.5), paging_y, spr_gui_arrow_right))
            {
                variable_struct_set(global.selected_inventory_item, current_guide_page_name, current_guide_page + (1 * get_key_modifier()));
            }
        }
        draw_text(arg0 + gui_col_x(2), paging_y - gui_col_y(0.25), paging_text);
    }
    if (is_numeric(variable_struct_get(global.selected_inventory_item, current_guide_page_name)))
    {
        variable_struct_set(global.selected_inventory_item, current_guide_page_name, max(variable_struct_get(global.selected_inventory_item, current_guide_page_name), 0));
        variable_struct_set(global.selected_inventory_item, current_guide_page_name, min(variable_struct_get(global.selected_inventory_item, current_guide_page_name), pages_count));
    }
    return arg1 - y_start;
}

function draw_content_section(arg0, arg1, arg2 = gui_col_y(5))
{
    draw_rect(arg0 - 16, arg1 - 16, arg0 + global.gui_settings.content_width + 16, arg1 + arg2, false, global.colors.content_section_background);
}

function draw_converter_lite(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7 = 1, arg8 = gui_col_x(3), arg9 = undefined, arg10 = false)
{
    var clicked = false;
    var arrow_x = arg0 + gui_col_x(3.5);
    var button_x = arg0 + gui_col_x(7);
    var result_x = arg0 + gui_col_x(5.5);
    var padding_y = gui_col_y(global.is_mobile ? 4 : 3);
    draw_result(arg0, arg1, arg2, arg7, 
    {
        insufficient_indicator: true
    });
    if (arg10)
    {
        if (gui_button_sprite(arrow_x, arg1 + gui_col_y(0.45), spr_icon_transmute, arg5, undefined, arg9))
        {
            clicked = true;
        }
    }
    else
    {
        gui_draw_sprite(arrow_x, arg1 + gui_col_y(0.5), spr_gui_arrow_right);
        if (gui_button_tl(button_x, arg1, arg4, arg5, arg8, undefined, arg9))
        {
            clicked = true;
        }
    }
    draw_result(result_x, arg1, arg3);
    if (clicked)
    {
        if (arg6 == convert_lite)
        {
            convert_lite(arg2, arg3, get_default_struct_value(arg9, "timeout_key", undefined), get_default_struct_value(arg9, "convert_timeout", undefined), arg7);
        }
        else
        {
            arg6(arg7);
        }
    }
    return padding_y;
}

function draw_description(arg0, arg1, arg2, arg3 = gui_col_x(22), arg4 = 0, arg5 = 0, arg6 = false, arg7 = "\n", arg8 = f_gui_small, arg9 = 16777215, arg10 = false)
{
    var text_final = convert_to_string(arg2, arg7);
    set_default_font(arg8, arg4, arg5, arg9);
    var y_height = string_height_ext(text_final, global.gui_text_line_height, arg3) + global.gui_items_padding;
    var width = string_width_ext(text_final, global.gui_text_line_height, arg3);
    if (arg10)
    {
        draw_set_color(c_black);
        draw_text_ext(arg0 + 1, arg1 + 1, text_final, global.gui_text_line_height, arg3);
        draw_set_color(arg9);
    }
    draw_text_ext(arg0, arg1, text_final, global.gui_text_line_height, arg3);
    if (arg6)
    {
        return width;
    }
    return y_height;
}

function draw_heading(arg0, arg1, arg2, arg3 = gui_col_x(20), arg4 = f_gui_default, arg5 = 0, arg6 = 1, arg7 = true)
{
    var line_height = global.gui_text_line_height;
    if (arg4 == f_gui_default)
    {
        line_height += 6;
    }
    var text_final = convert_to_string(arg2);
    set_default_font(arg4, arg5, arg6);
    draw_text_ext(arg0, arg1, text_final, line_height, arg3);
    var y_height = string_height_ext(text_final, line_height, arg3);
    if (arg7)
    {
        y_height += global.gui_items_padding;
    }
    return y_height;
}

function draw_heading_description(arg0, arg1, arg2 = "", arg3 = "", arg4 = gui_col_x(20), arg5 = f_gui_default, arg6 = 0, arg7 = 1, arg8 = false)
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
    arg1 += draw_heading(arg0, arg1, arg2, arg4, arg5, arg6, arg7, false);
    arg1 += draw_description(arg0, arg1, arg3, arg4, arg6, 0);
    return arg1 - y_start;
}

function draw_inventory_items(arg0, arg1, arg2, arg3, arg4 = gui_col_x(8), arg5 = 64, arg6 = true, arg7 = undefined, arg8 = false, arg9 = 0, arg10 = undefined)
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
    var add_draw = get_default_struct_value(arg10, "add_draw");
    var backpack = get_default_struct_value(arg10, "backpack");
    var backpack_size = get_default_struct_value(arg10, "backpack_size", 1);
    var bg_sprite = get_default_struct_value(arg10, "bg_sprite", global.gui_settings.button_bg_sprite_alt);
    var craft_items_inventory_length = array_length(arg2);
    var display_count = get_default_struct_value(arg10, "display_count", false);
    var func_rightclick = get_default_struct_value(arg10, "func_rightclick", arg7);
    var override_inventory_size = get_default_struct_value(arg10, "override_inventory_size", false);
    if (override_inventory_size)
    {
        arg3 = max(arg3, craft_items_inventory_length);
    }
    var paging_id_selected = get_default_struct_value(arg10, "paging_id_selected", arg9);
    var show_sorting = get_default_struct_value(arg10, "show_sorting", false);
    var func_ctrl_shift = get_default_struct_value(arg10, "func_ctrl_shift");
    var func_ctrl = get_default_struct_value(arg10, "func_ctrl");
    var func_salvage = get_default_struct_value(arg10, "func_salvage", false);
    if (is_undefined(variable_struct_get(global.selected_inventory_item, paging_id_selected)))
    {
        variable_struct_set(global.selected_inventory_item, paging_id_selected, undefined);
    }
    var max_page_backpack = ceil(arg3 / arg5);
    if (is_undefined(variable_struct_get(global.inventory_pages, arg9)))
    {
        variable_struct_set(global.inventory_pages, arg9, 0);
    }
    variable_struct_set(global.inventory_pages, arg9, clamp(variable_struct_get(global.inventory_pages, arg9), 0, max_page_backpack));
    var _paging_x = get_default_struct_value(arg10, "paging_x");
    if (!is_numeric(_paging_x))
    {
        _paging_x = arg0 + gui_col_x(3);
    }
    var _paging_y = get_default_struct_value(arg10, "paging_y");
    if (!is_numeric(_paging_y))
    {
        _paging_y = arg1 - gui_col_y(1.6);
    }
    var _page = variable_struct_get(global.inventory_pages, arg9);
    if (_page > (arg3 * arg5))
    {
        _page = 0;
    }
    if (!arg8)
    {
        _page = 0;
    }
    var x_padding = get_default_struct_value(arg10, "padding_x", 48);
    var y_padding = get_default_struct_value(arg10, "padding_y", 48);
    if (global.is_mobile)
    {
        x_padding += 24;
        y_padding += 24;
    }
    if (display_count)
    {
        y_padding += gui_col_y(1.5);
    }
    var bx = 0;
    var by = 0;
    var columns_per_row = 8;
    var xcol = 0;
    var ycol = 0;
    for (var i = 0; i < min(arg3, arg5); i++)
    {
        bx = (arg0 + (xcol * x_padding)) - 8;
        by = arg1 + (ycol * y_padding);
        if (bx > (arg0 + arg4))
        {
            xcol = 0;
            ycol++;
            bx = (arg0 + (xcol * x_padding)) - 8;
            by = arg1 + (ycol * y_padding);
        }
        var item_index = i + (_page * arg5);
        if (item_index < array_length(arg2))
        {
            var item = arg2[item_index];
            if (!is_struct(item))
            {
                continue;
            }
            var is_selected = get_data_id(variable_struct_get(global.selected_inventory_item, paging_id_selected)) == item.data.id;
            var bg_color = get_default_struct_value_ext(item, "get_bg_color", 16777215);
            var sprite = get_default_struct_value_ext(item, "get_sprite", spr_solid);
            var tip = get_default_struct_value_ext(item, "get_info", "");
            var alpha = 1;
            if (gui_button_sprite(bx + 32, by + 32, sprite, arg6, false, 
            {
                alpha: alpha,
                btn_bg_color: bg_color,
                btn_bg_sprite: bg_sprite,
                selected: is_selected,
                tooltip: tip,
                halign: 0,
                force_show_tooltip: true,
                mb_check: global.inputs.mouse.mb_all
            }))
            {
                if (mouse_lastbutton == 1 || global.is_mobile)
                {
                    variable_struct_set(global.selected_inventory_item, paging_id_selected, is_selected ? -1 : item);
                }
                var rightclick = mouse_lastbutton == 2 && !global.is_mobile;
                var has_lock = is_struct(struct_get_from_hash(item, variable_get_hash("data"))) && !is_undefined(struct_get_from_hash(item.data, variable_get_hash("locked")));
                if (mouse_lastbutton == 3 && has_lock)
                {
                    item.data.locked = !item.data.locked;
                }
                if (keyboard_check(vk_alt) && mouse_lastbutton == 1)
                {
                }
                else if (keyboard_check(vk_alt) && mouse_lastbutton == 2)
                {
                }
                else if (keyboard_check(vk_alt) && mouse_lastbutton == 3)
                {
                }
                else if (keyboard_check(vk_control) && keyboard_check(vk_shift))
                {
                    if (!is_undefined(func_ctrl_shift))
                    {
                        func_ctrl_shift(item);
                    }
                    else if (func_salvage && is_struct(item) && !is_undefined(struct_get_from_hash(item, variable_get_hash("salvage"))))
                    {
                        if (!has_lock || (has_lock && !item.data.locked))
                        {
                            item.salvage(item.data.count);
                            instance_destroy(o_tooltip);
                        }
                    }
                }
                else if (keyboard_check(vk_control))
                {
                    if (!is_undefined(func_ctrl))
                    {
                        func_ctrl(item);
                    }
                    else if (func_salvage && is_struct(item) && !is_undefined(struct_get_from_hash(item, variable_get_hash("salvage"))))
                    {
                        item.salvage_confirm(item.data.count);
                        instance_destroy(o_tooltip);
                    }
                }
                else if (rightclick || keyboard_check(vk_shift))
                {
                    if (!is_undefined(func_rightclick))
                    {
                        func_rightclick(item);
                    }
                    else if (!is_undefined(struct_get_from_hash(item, variable_get_hash("can_equip"))) && !is_undefined(struct_get_from_hash(item, variable_get_hash("equip"))) && item.can_equip())
                    {
                        item.equip();
                        instance_destroy(o_tooltip);
                    }
                }
            }
            if (is_struct(struct_get_from_hash(item, variable_get_hash("data"))) && get_default_struct_value(item.data, "locked", false))
            {
                draw_sprite_ext(spr_icon_lock, 0, bx + 48, by + 8, 2, 2, 0, c_white, 1);
            }
            if (display_count)
            {
                set_default_font(f_gui_small, 1);
                draw_text(bx + gui_col_x(0.55), by + gui_col_y(1.75), string(number_format(item.data.count)));
            }
            if (is_callable(add_draw))
            {
                add_draw(bx, by, item);
            }
        }
        else if (item_index < arg3)
        {
            var alpha = 1;
            gui_button_sprite(bx + 32, by + 32, spr_solid, true, undefined, 
            {
                alpha: alpha,
                btn_bg_sprite: bg_sprite
            });
        }
        xcol++;
    }
    if (arg8)
    {
        if (arg3 > arg5 || _page > 0)
        {
            if (gui_button_tl(_paging_x, _paging_y, "<-", _page > 0))
            {
                variable_struct_set_post(global.inventory_pages, arg9, variable_struct_get(global.inventory_pages, arg9) - 1);
            }
            if (gui_button_tl(_paging_x + gui_col_x(0.75), _paging_y, "->", (_page + 1) < max_page_backpack))
            {
                variable_struct_set_post(global.inventory_pages, arg9, variable_struct_get(global.inventory_pages, arg9) + 1);
            }
            set_default_font(f_gui_small);
            draw_text(_paging_x + gui_col_x(1.5), _paging_y + gui_col_y(0.3), sprintf("%s/%s", _page + 1, max_page_backpack));
        }
    }
    if (show_sorting)
    {
        var sx = arg0 + gui_col_x(8);
        var sort_type = get_option(global.options.borbventures_inventory_sort_type);
        var sort_dir = get_option(global.options.borbventures_inventory_sort_dir);
        var sort_type_text = get_option_text(global.options.borbventures_inventory_sort_type);
        if (gui_button_tl(sx, _paging_y, sort_type_text, undefined, gui_col_x(2), undefined, 
        {
            tooltip: __("Sort by")
        }))
        {
            global.options.borbventures_inventory_sort_type._func();
            sort_array_by(arg2, "get_sort_value", sort_dir == "asc");
            if (is_array(backpack))
            {
                sort_array_by(backpack, "get_sort_value", sort_dir == "asc");
            }
        }
        var sort_dir_sprite = (sort_dir == "asc") ? spr_gui_arrow_up : spr_gui_arrow_down;
        if (gui_button_sprite(sx + gui_col_x(3.5), _paging_y + gui_col_y(0.6), sort_dir_sprite, undefined, undefined, 
        {
            tooltip: __("Sort direction")
        }))
        {
            global.options.borbventures_inventory_sort_dir._func();
            sort_dir = get_option(global.options.borbventures_inventory_sort_dir);
            sort_array_by(arg2, "get_sort_value", sort_dir == "asc");
            if (is_array(backpack))
            {
                sort_array_by(backpack, "get_sort_value", sort_dir == "asc");
            }
        }
    }
    arg1 = by;
    if (display_count)
    {
        arg1 += gui_col_y(0.5);
    }
    if (is_array(backpack))
    {
        var paging_id_backpack = sprintf("%s_backpack", arg9);
        arg1 += (global.ui_gaps.xl + global.ui_gaps.xs);
        arg1 += draw_heading(arg0, arg1, sprintf("%s (%s/%s)", __("Backpack"), array_length(backpack), backpack_size));
        arg1 += draw_inventory_items(arg0, arg1, backpack, backpack_size, arg4, arg5, undefined, undefined, true, paging_id_backpack, 
        {
            display_count: true,
            func_ctrl: func_ctrl,
            func_ctrl_shift: func_ctrl_shift,
            func_salvage: func_salvage,
            override_inventory_size: true,
            paging_id_selected: arg9,
            paging_x: _paging_x
        });
    }
    return arg1 - y_start;
}

function draw_item_list_lite(arg0, arg1, arg2, arg3 = gui_col_x(22), arg4 = undefined)
{
    arg0 += gui_col_x(0.5);
    arg1 += gui_col_y(0.5);
    var col_x = 0;
    var col_y = 0;
    var item_width = global.is_mobile ? gui_col_x(7.25) : gui_col_x(5);
    var item_height = gui_col_y(2);
    var width = gui_col_x(24);
    set_default_font(f_gui_small, 0, 1);
    if (is_array(arg2))
    {
        var __array = arg2;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            var cx_next = arg0 + ((item_width + gui_col_x(0.5)) * col_x);
            if ((cx_next + (item_width / 2)) >= width)
            {
                col_x = 0;
                col_y++;
            }
            var cx = arg0 + ((item_width + gui_col_x(0.5)) * col_x);
            var cy = arg1 + ((item_height + gui_col_y(0.5)) * col_y);
            var button_options = get_value_ext(arg4, struct_get_from_hash(arg4, variable_get_hash("button_options")), mitem);
            gui_button_sprite(cx, cy, mitem.item.sprite, undefined, undefined, button_options);
            col_x++;
        }
    }
    var add_y_padding = (col_x > 0 || col_y > 0) ? gui_col_y(1.5) : 0;
    return (col_y * (item_height + gui_col_y(0.5))) + add_y_padding;
}

function draw_item_list_struct(arg0, arg1, arg2, arg3, arg4 = gui_col_x(22), arg5 = undefined)
{
    var items_array = struct_to_array(arg2);
    if (array_length(items_array) == 0)
    {
        return 0;
    }
    if (!is_struct(arg5))
    {
        arg5 = {};
    }
    arg5.collection = arg3;
    arg5.inline = true;
    var y_height = draw_resources(arg0, arg1, arg2, undefined, arg5) - gui_col_y(0.5);
    return y_height;
}

function draw_item_list_struct_rarity(arg0, arg1, arg2, arg3, arg4 = gui_col_x(22), arg5 = undefined)
{
    if (!is_struct(arg2))
    {
        return 0;
    }
    var col_x = 0;
    var col_y = 0;
    var item_x = arg0;
    var item_y = arg1;
    var inline = get_default_struct_value(arg5, "inline", false);
    var inline_padding_x = get_default_struct_value(arg5, "inline_padding_x", gui_col_x(3));
    var inline_padding_y = get_default_struct_value(arg5, "inline_padding_y", gui_col_y(1));
    var inventory_full = get_default_struct_value(arg5, "inventory_full", {});
    var y_start = arg1;
    var __struct = arg2;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        var item = variable_struct_get(arg3, mitem);
        var rarity_key = mkey;
        arg1 += draw_item_list_struct(arg0, arg1, mitem, arg3, arg4, 
        {
            display_rarity: true,
            inline_padding_x: inline_padding_x,
            inline_padding_y: inline_padding_y,
            inventory_full: is_struct(inventory_full) ? variable_struct_get(inventory_full, rarity_key) : undefined,
            rarity_color: variable_struct_get(global.rarity_colors, rarity_key),
            resource_name: get_default_struct_value(arg5, "resource_name", "name"),
            show_resource_name: get_default_struct_value(arg5, "show_resource_name", false),
            show_tooltip: true
        });
    }
    arg1 += gui_col_y(0.5);
    return arg1 - y_start;
}

function draw_item_set(arg0, arg1, arg2, arg3, arg4 = undefined)
{
    if (!is_array(arg2))
    {
        exit;
    }
    if (!is_struct(arg3))
    {
        exit;
    }
    var bx = 0;
    var by = 0;
    var col_x = 0;
    var col_y = 0;
    var dcl_y_add = global.is_pc ? -0.25 : 0;
    var x_padding = global.is_mobile ? 64 : 48;
    var width = get_default_struct_value(arg4, "width");
    var __array = arg2;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        var set_item = variable_struct_get(arg3, mitem);
        if (!is_struct(set_item))
        {
            continue;
        }
        if (is_numeric(width) && bx >= (arg0 + width))
        {
            col_x = 0;
            col_y++;
        }
        var tooltip = set_item.name;
        if (is_struct(arg4) && !is_undefined(struct_get_from_hash(arg4, variable_get_hash("tooltip"))))
        {
            tooltip = get_value_ext(arg4, arg4.tooltip, set_item);
        }
        var item_enabled = false;
        if (!is_undefined(struct_get_from_hash(arg4, variable_get_hash("item_enabled_func"))))
        {
            item_enabled = arg4.item_enabled_func(set_item);
        }
        bx = (arg0 + (col_x * x_padding)) - 8;
        by = arg1 + gui_col_y(dcl_y_add) + gui_col_y(col_y * 1.5);
        if (gui_button_sprite(bx, by, set_item.sprite, item_enabled, false, 
        {
            tooltip: tooltip
        }))
        {
            if (!is_undefined(struct_get_from_hash(arg4, variable_get_hash("item_click_func"))))
            {
                arg4.item_click_func(set_item);
            }
        }
        col_x++;
    }
    return by - arg1;
}

function draw_modal(arg0 = "")
{
    draw_set_alpha(0.7);
    draw_set_color(c_black);
    draw_rectangle(0, 0, global.gui_width, global.gui_height, false);
    set_default_font(f_gui_large, 1, 1);
    draw_set_color(c_white);
    draw_text(global.gui_width / 2, global.gui_height / 2, arg0);
}

function draw_number_slider(arg0, arg1, arg2, arg3 = 0, arg4 = undefined, arg5 = 1, arg6 = true, arg7 = undefined, arg8 = __void, arg9 = true, arg10 = undefined, arg11 = f_gui_small, arg12 = true, arg13 = true)
{
    if (arg9)
    {
        arg5 *= get_key_modifier();
    }
    if (!is_numeric(arg3))
    {
        arg3 = 0;
    }
    if (!is_numeric(arg4))
    {
        arg4 = global.max_num;
    }
    var old_value = arg2;
    var enabled_minus = arg2 > arg3 && arg6 && arg12;
    if (gui_button_sprite(arg0, arg1, spr_gui_minus, enabled_minus))
    {
        var new_value = _clamp(arg2 - arg5, arg3, arg4);
        arg8(new_value, old_value, arg5);
    }
    var description_text;
    if (get_default_struct_value(arg10, "show_max_text", false))
    {
        description_text = sprintf("%s/%s", number_format(arg2), number_format(arg4));
    }
    else
    {
        description_text = number_format(arg2);
    }
    draw_description(arg0 + gui_col_x(1.5), arg1, description_text, gui_col_x(3), 1, 1, undefined, undefined, arg11);
    var enabled_plus = arg2 < arg4 && arg6 && arg13;
    if (gui_button_sprite(arg0 + gui_col_x(2.9), arg1, spr_gui_plus, enabled_plus))
    {
        var new_value = _clamp(arg2 + arg5, arg3, arg4);
        arg8(new_value, old_value, arg5);
    }
    if (is_string(arg7))
    {
        draw_description(arg0 + gui_col_x(4), arg1, arg7, gui_col_x(6), undefined, 1);
    }
    return global.ui_gaps.lg;
}

function _draw_option(arg0, arg1, arg2 = gui_button_tl, arg3 = undefined, arg4 = undefined, arg5 = true)
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
    var add_description = get_default_struct_value(arg3, "add_description", false);
    var btn_options = get_default_struct_value(arg3, "btn_options", {});
    if (!is_struct(btn_options))
    {
        btn_options = {};
    }
    var btn_width = get_default_struct_value(arg3, "btn_width", gui_col_x(2));
    var draw_mode = get_default_struct_value(arg3, "draw_mode", 0);
    var name_position = get_default_struct_value(arg3, "name_position", "after");
    var suffix = get_default_struct_value(arg3, "suffix", "");
    var width = get_default_struct_value(arg3, "width", gui_col_x(5));
    if (!is_undefined(arg4))
    {
        draw_mode = arg4;
    }
    switch (draw_mode)
    {
        case 0:
            set_default_font(f_gui_small);
            var halign = 0;
            name_position = get_default_struct_value(arg3, "name_position", "left");
            var name_width = get_default_struct_value(arg3, "name_width", gui_col_x(18));
            var name = self.get_name();
            name = get_default_struct_value(arg3, "text_prefix", "") + name;
            name = name + get_default_struct_value(arg3, "text_suffix", "");
            var str_width = string_width(name);
            var min_width = global.is_mobile ? gui_col_x(1) : 0;
            var btn_x = arg0 + 8;
            var btn_y = arg1;
            var name_x = arg0;
            var name_y = arg1 + 9;
            switch (name_position)
            {
                case "top":
                    halign = 1;
                    btn_x = arg0;
                    name_x = arg0 + (str_width / 2);
                    name_y = arg1 - gui_col_y(0.8);
                    break;
            }
            var add_x = draw_description(name_x, name_y, name, name_width, halign, undefined, true);
            if (name_position == "left")
            {
                btn_x += add_x;
            }
            if (self.has_slider)
            {
                btn_x += gui_col_x(3);
                if (gui_button(arg0 + str_width + gui_col_x(0.75), arg1 + gui_col_y(0.6), "-", arg5, gui_col_x(1), true))
                {
                    self._func(true, -1);
                    self.click();
                }
                if (gui_button(arg0 + str_width + 8 + gui_col_x(1.75), arg1 + gui_col_y(0.6), "+", arg5, gui_col_x(1), true))
                {
                    self._func(true, 1);
                    self.click();
                }
            }
            btn_options.min_width = min_width;
            if (!is_empty(self.tooltip))
            {
                btn_options.tooltip = self.tooltip;
            }
            if (arg2(btn_x, btn_y, get_value_ext(self, self._button_text, false), arg5, btn_width, false, btn_options))
            {
                self._func();
                self.click();
            }
            break;
        case 1:
            if (array_length(self.options) == 0)
            {
                return 0;
            }
            if (self.data.value >= array_length(self.options))
            {
                self.data.value = 0;
            }
            var mitem = self.options[self.data.value];
            var sprite = get_default_struct_value(mitem, "sprite", spr_placeholder);
            if (gui_button_sprite(arg0, arg1, sprite, undefined, undefined, 
            {
                tooltip: struct_get_from_hash(mitem, variable_get_hash("text")),
                tooltip_refresh: true
            }))
            {
                self._func();
                self.click();
                instance_destroy(o_tooltip);
            }
            break;
        case 2:
        case 3:
            var __array = self.options;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                var is_visible = get_value_ext(mitem, struct_get_from_hash(mitem, variable_get_hash("is_visible")));
                if (!is_bool(is_visible))
                {
                    is_visible = true;
                }
                if (!is_visible)
                {
                    continue;
                }
                var sprite = get_default_struct_value(mitem, "sprite", spr_placeholder);
                if (gui_button_sprite(arg0 + gui_col_x(__i), arg1, sprite))
                {
                    self._func();
                    self.click();
                }
            }
            break;
        case 4:
            var sprite = spr_placeholder;
            if (is_array(self.sprite))
            {
                if (self.toggle)
                {
                    var spr_i = self.data.value ? 0 : 1;
                    sprite = @@array_get@@(self.sprite, spr_i);
                }
            }
            else
            {
                sprite = self.sprite;
            }
            if (gui_button_sprite(arg0, arg1, sprite, undefined, undefined, self.tooltip_struct))
            {
                self._func();
                self.click();
            }
            break;
        case 5:
            var value = self.data.value;
            if (self.has_checkbox)
            {
                value = self.data.checked;
            }
            var sprite = value ? spr_icon_check : spr_icon_cancel;
            if (gui_button_sprite(arg0, arg1, sprite, arg5))
            {
                self._func();
                self.click();
            }
            var name = self.get_name() + suffix;
            var halign = 0;
            var name_x = arg0 + gui_col_x(0.75);
            if (name_position == "before")
            {
                halign = 2;
                name_x = arg0 - gui_col_x(0.75);
            }
            arg1 += draw_description(name_x, arg1, name, width, halign, 1);
            if (add_description)
            {
                arg1 += draw_description(arg0 + gui_col_x(0.75), arg1 - gui_col_y(0.6), self.get_description(), width);
            }
            break;
        case 6:
            var text = sprintf("%s: %s", self.get_name(), number_format(self.data.value));
            arg1 += draw_description(arg0, arg1, text, gui_col_x(8));
            arg1 += gui_col_y(0.4);
            if (gui_button(arg0 + gui_col_x(0.75), arg1, "-", true, gui_col_x(1)))
            {
                self._func(true, -1);
            }
            if (gui_button(arg0 + 8 + gui_col_x(1.75), arg1, "+", true, gui_col_x(1)))
            {
                self._func(true, 1);
            }
            break;
    }
    return gui_col_y(1);
}

function draw_option(arg0, arg1, arg2, arg3 = gui_button_tl, arg4 = undefined, arg5 = undefined, arg6 = true)
{
    return arg0.draw(arg1, arg2, arg3, arg4, arg5, arg6);
}

function draw_options_toggle(arg0, arg1, arg2, arg3, arg4 = gui_col_x(18), arg5 = false)
{
    if (!is_array(arg2) || !is_struct(arg3))
    {
        return 0;
    }
    var y_start = arg1;
    var __array = arg2;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        var is_obfuscated = false;
        if (!is_undefined(struct_get_from_hash(mitem, variable_get_hash("is_obfuscated"))))
        {
            is_obfuscated = mitem.is_obfuscated();
        }
        var value = get_default_struct_value(arg3, mitem.key, arg5);
        if (gui_button_toggle(arg0 + gui_col_x(0.4), arg1 + gui_col_y(0.5), value, !is_obfuscated))
        {
            variable_struct_set(arg3, mitem.key, !value);
        }
        var name = is_obfuscated ? "?" : mitem.name;
        arg1 += draw_description(arg0 + gui_col_x(1.15), arg1 + gui_col_y(0.2), name, arg4);
        var description = get_default_struct_value_func(mitem, "description", undefined);
        if (is_string(description))
        {
            if (is_obfuscated)
            {
                description = "?";
            }
            arg1 += draw_description(arg0 + gui_col_x(1.15), arg1 + gui_col_y(0), description, arg4);
        }
        arg1 += gui_col_y(0.25);
    }
    return arg1 - y_start;
}

function draw_rarity(arg0, arg1, arg2, arg3, arg4 = false)
{
    var y_start = arg1;
    var text_x = arg0 + 56;
    var text_y = arg1 + 22;
    var text = sprintf("%s %s", number_format(arg3), arg2.name);
    gui_button_sprite_tl(arg0, arg1 + 18, spr_icon_questionbox, undefined, undefined, 
    {
        btn_bg_color: arg2.color
    });
    arg1 += draw_description(text_x, text_y, text, gui_col_x(4), undefined, undefined, undefined, undefined, f_gui_default);
    arg1 += global.ui_gaps.xs;
    return arg1 - y_start;
}

function draw_rarities(arg0, arg1, arg2, arg3, arg4 = false)
{
    if (!is_struct(arg2) || !is_struct(arg3))
    {
        return 0;
    }
    var y_start = arg1;
    var __struct = arg2;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        var rarity = variable_struct_get(arg3, mkey);
        arg1 += draw_rarity(arg0, arg1, rarity, mitem, arg4);
    }
    return arg1 - y_start;
}

function draw_rect(arg0, arg1, arg2, arg3, arg4 = false, arg5 = 255, arg6 = 1)
{
    var a = draw_get_alpha();
    var c = draw_get_color();
    draw_set_alpha(arg6);
    draw_set_color(arg5);
    draw_rectangle(arg0, arg1, arg2, arg3, arg4);
    draw_set_alpha(a);
    draw_set_color(c);
}

function draw_selected_item(arg0, arg1, arg2, arg3 = gui_col_x(8), arg4 = gui_col_y(14), arg5 = __void, arg6 = __void, arg7 = __return_true, arg8 = __void, arg9 = undefined)
{
    if (!is_struct(arg2))
    {
        return 0;
    }
    var y_start = arg1;
    var height_add_draw = 0;
    var unlocked = arg7(arg2);
    if (get_default_struct_value(arg9, "check_is_unlocked_from_item", false) && is_struct(arg2) && !is_undefined(struct_get_from_hash(arg2, variable_get_hash("is_unlocked"))))
    {
        unlocked = arg2.is_unlocked();
    }
    var name = "?";
    if (unlocked)
    {
        name = arg2.name;
        if (is_callable(struct_get_from_hash(arg2, variable_get_hash("get_name"))))
        {
            name = arg2.get_name();
        }
    }
    arg1 += draw_heading(arg0 + (arg3 / 2), arg1, name, arg3, undefined, 1, 0);
    arg1 += get_default_struct_value(arg9, "name_padding_y", 0);
    var draw_before_sprite = get_default_struct_value(arg9, "draw_before_sprite", __void);
    draw_before_sprite(arg0 + (arg3 / 2), arg1, arg2);
    var img_index = get_default_struct_value(arg9, "img_index", 0);
    var sprite_color = unlocked ? 16777215 : 0;
    var sprite_size = 96;
    if (unlocked && get_default_struct_value(arg2, "blend_color", undefined) != undefined)
    {
        sprite_color = arg2.blend_color;
    }
    draw_sprite_contain(arg2.sprite, img_index, arg0 + (arg3 / 2), arg1 + gui_col_y(1), sprite_size, 0, sprite_color);
    arg1 += (sprite_size + gui_col_y(0.5));
    if (unlocked)
    {
        arg1 = add_safe(arg1, arg5(arg0, arg1, arg2, arg3, arg4, arg6, arg9));
    }
    else
    {
        arg1 = add_safe(arg1, arg8(arg0, arg1, arg2, arg3, arg4, arg6, arg9));
    }
    return max(arg4, arg1 - y_start);
}

function draw_selected_item_actions(arg0, arg1, arg2, arg3 = gui_col_x(8), arg4 = gui_col_y(14), arg5 = __void, arg6 = undefined)
{
    if (!is_struct(arg2))
    {
        return 0;
    }
    var y_start = arg1;
    arg1 += draw_selected_item_description(arg0, arg1, arg2, arg3);
    if (get_default_struct_value(arg6, "draw_use_button", true))
    {
        var button_text = get_default_struct_value(arg6, "use_button_text", __("Use"));
        var button_width = get_default_struct_value(arg6, "use_button_width", gui_col_x(2));
        if (gui_button(arg0 + (arg3 / 2), arg1, button_text, true, button_width))
        {
            arg5(arg2);
        }
        arg1 += gui_col_y(2);
    }
    var draw_below_func = get_default_struct_value(arg6, "draw_below_func", undefined);
    if (!is_undefined(draw_below_func))
    {
        arg1 = add_safe(arg1, draw_below_func(arg0, arg1, arg2, arg3, arg4, arg6));
    }
    return arg1 - y_start;
}

function draw_selected_item_description(arg0, arg1, arg2, arg3)
{
    if (!is_struct(arg2))
    {
        return 0;
    }
    var y_start = arg1;
    var desc = get_default_struct_value(arg2, "description", "");
    if (is_callable(struct_get_from_hash(arg2, variable_get_hash("get_description"))))
    {
        desc = arg2.get_description();
    }
    if (!is_empty(desc))
    {
        arg1 += draw_description(arg0, arg1, desc, arg3);
    }
    return arg1 - y_start;
}

function draw_sort_button(arg0, arg1, arg2, arg3, arg4 = undefined)
{
    var sort_type = get_option(arg3);
    var sort_dir = get_option(arg2);
    var sort_type_text = get_option_text(arg3);
    if (gui_button_tl(arg0, arg1, sort_type_text, undefined, gui_col_x(2), undefined, 
    {
        tooltip: __("Sort by")
    }))
    {
        arg3._func();
        instance_destroy(o_gui_scrollable_items_inline);
        if (is_array(arg4))
        {
            sort_array_by(global.borbventures.items.inventory, "get_sort_value", sort_dir == "asc");
        }
    }
    var sort_dir_sprite = (sort_dir == "asc") ? spr_gui_arrow_up : spr_gui_arrow_down;
    if (gui_button_sprite(arg0 + gui_col_x(3.5), arg1 + gui_col_y(0.6), sort_dir_sprite, undefined, undefined, 
    {
        tooltip: __("Sort direction")
    }))
    {
        arg2._func();
        sort_dir = get_option(arg2);
        instance_destroy(o_gui_scrollable_items_inline);
        if (is_array(arg4))
        {
            sort_array_by(global.borbventures.items.inventory, "get_sort_value", sort_dir == "asc");
        }
    }
}

function draw_sprite_contain(arg0, arg1 = -1, arg2 = 0, arg3 = 0, arg4 = 64, arg5 = 0, arg6 = 16777215, arg7 = 1, arg8 = undefined, arg9 = true)
{
    if (arg4 <= 0)
    {
        exit;
    }
    if (is_undefined(arg0))
    {
        exit;
    }
    var scale_x = 1;
    var scale_y = 1;
    var spr_width = sprite_get_width(arg0);
    var spr_height = sprite_get_height(arg0);
    var offset_x = sprite_get_xoffset(arg0);
    var offset_y = sprite_get_yoffset(arg0);
    scale_x = get_sprite_scale_to_size(arg4, spr_width);
    scale_y = get_sprite_scale_to_size(arg4, spr_height);
    var scale_final = min(scale_x, scale_y);
    if (arg9)
    {
        var xdiff = abs((spr_width / 2) - offset_x);
        var ydiff = abs((spr_height / 2) - offset_y);
        arg2 -= (xdiff * scale_final);
        arg3 += (ydiff * scale_final);
    }
    if (!is_undefined(arg8))
    {
        gpu_set_fog(true, arg8, 0, 1);
        draw_sprite_ext(arg0, arg1, arg2, arg3, scale_final * 1.1, scale_final * 1.1, arg5, arg6, arg7);
        gpu_set_fog(0, c_black, 0, 0);
        draw_sprite_ext(arg0, arg1, arg2, arg3, scale_final, scale_final, arg5, arg6, arg7);
    }
    else
    {
        draw_sprite_ext(arg0, arg1, arg2, arg3, scale_final, scale_final, arg5, arg6, arg7);
    }
}

function draw_sprite_outlined(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
{
    gpu_set_fog(true, arg8, 0, 1);
    draw_sprite_ext(arg0, arg1, arg2 - arg4, arg3, arg4, arg5, arg6, c_white, 1);
    draw_sprite_ext(arg0, arg1, arg2 + arg4, arg3, arg4, arg5, arg6, c_white, 1);
    draw_sprite_ext(arg0, arg1, arg2, arg3 - arg5, arg4, arg5, arg6, c_white, 1);
    draw_sprite_ext(arg0, arg1, arg2, arg3 + arg5, arg4, arg5, arg6, c_white, 1);
    gpu_set_fog(0, c_black, 0, 0);
    draw_sprite_ext(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, 1);
}

function draw_sprite_outlined_ext(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9 = 1.2)
{
    gpu_set_fog(true, arg8, 0, 1);
    draw_sprite_ext(arg0, arg1, arg2, arg3, arg4 * arg9, arg5 * arg9, arg6, c_white, 1);
    gpu_set_fog(0, c_black, 0, 0);
    draw_sprite_ext(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, 1);
}

function draw_text_icon(arg0, arg1, arg2, arg3, arg4 = undefined)
{
    var spr_width = sprite_get_width(arg2);
    var spr_height = sprite_get_height(arg2);
    var spr_offset_x = sprite_get_xoffset(arg2);
    var spr_offset_y = sprite_get_yoffset(arg2);
    if (is_undefined(arg4))
    {
        arg4 = spr_width;
    }
    draw_sprite_contain(arg2, 0, arg0 + spr_offset_x, arg1 + spr_offset_y, arg4);
    draw_text(arg0 + arg4 + 4, arg1 - 2, arg3);
    return gui_col_y(1);
}

function draw_text_list(arg0, arg1, arg2, arg3, arg4 = 2, arg5 = undefined, arg6 = false)
{
    if (global.is_mobile)
    {
        arg4 += 1;
    }
    for (var i = 0; i < arg3; i++)
    {
        var text_loop = "";
        if (is_struct(arg2))
        {
            text_loop = get_default_struct_value(arg2, i + 1, "");
        }
        else
        {
            text_loop = get_value_ext(arg2, arg2);
        }
        if (arg6)
        {
            text_loop = sprintf("#%s: %s", i + 1, text_loop);
        }
        draw_text_ext_default(arg0, arg1 + gui_col_y(i * arg4), sprintf(text_loop, i + 1));
    }
    return gui_col_y((arg3 * arg4) + 1);
}

function draw_text_shadow(arg0, arg1, arg2 = "", arg3 = 16777215)
{
    draw_set_colour(c_black);
    draw_set_alpha(0.7);
    draw_text(arg0, arg1 + 1, string_hash_to_newline(arg2));
    draw_set_colour(arg3);
    draw_set_alpha(1);
    draw_text(arg0, arg1, string_hash_to_newline(arg2));
    draw_set_colour(c_white);
}

function draw_transmuter(arg0, arg1, arg2, arg3 = true, arg4 = true, arg5 = undefined)
{
    if (!is_struct(arg2))
    {
        return 0;
    }
    var count = get_key_modifier();
    if (!arg4)
    {
        count = 1;
    }
    var button_text = (count > 1) ? __s("Transmute %s", count) : __("Transmute");
    var key = sprintf("transmuter_%s", arg2.key);
    var y_add = draw_transmuter_single(arg0, arg1, arg2, count, arg5);
    if (arg3 && arg2.has_reverse)
    {
        var tx2 = arg0 + gui_col_x(13);
        var ty2 = arg1;
        if (get_default_struct_value(arg5, "below", false))
        {
            tx2 = arg0;
            ty2 += gui_col_y(3);
            y_add += gui_col_y(4);
        }
        var transmuter_reverse = variable_struct_get(global.transmuters, arg2.key_reverse);
        draw_transmuter_single(tx2, ty2, transmuter_reverse, count, arg5);
    }
    return y_add;
}

function draw_transmuter_single(arg0, arg1, arg2, arg3, arg4 = undefined)
{
    if (!is_struct(arg2))
    {
        return 0;
    }
    var arrow_x = arg0 + gui_col_x(3.5);
    var button_x = arg0 + gui_col_x(7);
    var padding_y = gui_col_y(global.is_mobile ? 4 : 3);
    draw_result(arg0, arg1, arg2.input, arg3, 
    {
        insufficient_indicator: true
    });
    if (gui_button_sprite(arg0 + gui_col_x(3.25), arg1 + gui_col_y(0.45), spr_icon_transmute, arg2.can_transmute(arg3), undefined, 
    {
        timeout_end: arg2.data.timeout,
        text_below: arg3
    }))
    {
        arg2.transmute(arg3);
    }
    if (gui_button_sprite(arg0 + gui_col_x(4.75), arg1 + gui_col_y(0.45), spr_icon_transmute, arg2.can_transmute(arg3), undefined, 
    {
        timeout_end: arg2.data.timeout,
        text_below: __("Max")
    }))
    {
        arg2.transmute_max();
    }
    draw_result(arg0 + gui_col_x(6.25), arg1, arg2.output, arg3);
    var has_toggle = has_bought_shop_item_safe(global.shops.mines.unlock_auto_transmute);
    if (has_toggle)
    {
        if (gui_button_toggle(arg0 + gui_col_x(9.25), arg1 + gui_col_y(0.45), arg2.data.auto, undefined, 
        {
            text_below: __("Auto")
        }))
        {
            arg2.toggle_auto();
        }
    }
    return padding_y;
}

function draw_transmuters_section(arg0, arg1, arg2)
{
    if (!is_array(variable_struct_get(global.transmuters_sections, arg2)))
    {
        return 0;
    }
    var y_start = arg1;
    var __array = variable_struct_get(global.transmuters_sections, arg2);
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        arg1 += draw_transmuter(arg0, arg1, mitem);
    }
    return arg1 - y_start;
}

function draw_value_change_buttons(arg0, arg1, arg2, arg3, arg4, arg5 = undefined)
{
    var y_start = arg1;
    var button_width = gui_col_x(1.5);
    var dec_button_enabled = get_default_struct_value_ext(arg5, "dec_button_enabled", arg3 > 0);
    var inc_button_enabled = get_default_struct_value_ext(arg5, "inc_button_enabled", true);
    var inc_value = get_default_struct_value(arg5, "inc_value", 1);
    var key_modifier = get_default_struct_value(arg5, "key_modifier", true);
    var text_width = get_default_struct_value(arg5, "text_width", gui_col_x(8));
    if (key_modifier)
    {
        inc_value *= get_key_modifier();
    }
    arg1 += draw_description(arg0, arg1, arg2, text_width);
    arg1 += gui_col_y(0.4);
    if (gui_button(arg0 + gui_col_x(0.75), arg1, sprintf("-%s", number_format(inc_value)), true, button_width))
    {
        arg4(-inc_value);
    }
    if (gui_button(arg0 + (button_width / 2) + gui_col_x(1.75), arg1, sprintf("+%s", number_format(inc_value)), true, button_width))
    {
        arg4(inc_value);
    }
    arg1 += gui_col_y(1.5);
    return arg1 - y_start;
}

function get_sprite_scale_to_size(arg0, arg1)
{
    if (arg1 == 0)
    {
        return 0;
    }
    return arg0 / arg1;
}
