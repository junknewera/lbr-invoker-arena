function draw_resources(arg0, arg1, arg2, arg3 = 1, arg4 = undefined, arg5 = false, arg6 = 2)
{
    if (!is_struct(arg2))
    {
        return 0;
    }
    var y_start = arg1;
    var color = get_default_struct_value(arg4, "color", 16777215);
    var inline = get_default_struct_value(arg4, "inline", false);
    var scale = get_default_struct_value(arg4, "scale", global.gui_sprite_scale);
    var width = get_default_struct_value(arg4, "width", 32);
    var height = get_default_struct_value(arg4, "height", 32);
    var valign = get_default_struct_value(arg4, "valign", 0);
    var show_current_collection_count = get_default_struct_value(arg4, "show_current_collection_count", false);
    var show_resource_name = get_default_struct_value(arg4, "show_resource_name", false);
    var show_tooltip = get_default_struct_value(arg4, "show_tooltip", arg5);
    var font = get_default_struct_value(arg4, "font", f_gui_default);
    var collection = get_default_struct_value(arg4, "collection", global.resources);
    var display_rarity = get_default_struct_value(arg4, "display_rarity", false);
    var header_text = get_default_struct_value(arg4, "header_text", undefined);
    var inline_padding_x = get_default_struct_value(arg4, "inline_padding_x", gui_col_x(4));
    var inline_padding_y = get_default_struct_value(arg4, "inline_padding_y", gui_col_y(1.25));
    var insufficient_indicator = get_default_struct_value(arg4, "insufficient_indicator", false);
    var inventory_full = get_default_struct_value(arg4, "inventory_full");
    var leafscend_level = get_default_struct_value(arg4, "leafscend_level", 0);
    var max_width = get_default_struct_value(arg4, "max_width", gui_col_x(22));
    var prefix = get_default_struct_value(arg4, "prefix", undefined);
    var prefix_resource_text = get_default_struct_value(arg4, "prefix_resource_text", undefined);
    var prefix_value = get_default_struct_value(arg4, "prefix_value", undefined);
    var resource_name = get_default_struct_value(arg4, "resource_name", "name");
    var skip_zero = get_default_struct_value(arg4, "skip_zero", false);
    var suffix_resource_text = get_default_struct_value(arg4, "suffix_resource_text", undefined);
    var suffix_value = get_default_struct_value(arg4, "suffix_value", undefined);
    var text_above = get_default_struct_value(arg4, "text_above", undefined);
    var text_width = get_default_struct_value(arg4, "text_width", gui_col_x(16));
    var mini = get_default_struct_value(arg4, "mini", false);
    if (mini)
    {
        width = 16;
        height = 16;
        font = f_gui_small;
    }
    var resources_sorted = get_struct_keys(arg2);
    if (collection == global.resources)
    {
        array_sort(resources_sorted, sort_func_resources_index);
    }
    else
    {
        array_sort(resources_sorted, default_sort_func);
    }
    if (is_string(header_text))
    {
        arg1 += draw_heading(arg0, arg1, header_text, undefined, undefined, undefined, 0);
    }
    if (is_string(text_above))
    {
        arg1 += draw_description(arg0, arg1, text_above);
    }
    set_default_font(font, 0, valign, color);
    var text_x_add = -2;
    if (leafscend_level > 0)
    {
        text_x_add = 2;
    }
    var col_x = 0;
    var col_y = 0;
    var count = 0;
    var res_x = 0;
    var res_y = 0;
    var __array = resources_sorted;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        var _value = variable_struct_get(arg2, mitem);
        var _key = mitem;
        if (skip_zero && _value == 0)
        {
            continue;
        }
        var i = __i;
        var resource = variable_struct_get(collection, _key);
        var resource_is_struct = is_struct(resource);
        res_x = arg0;
        res_y = arg1 + (count * height);
        if (inline)
        {
            res_x = arg0 + (col_x * inline_padding_x);
            res_y = arg1 + (col_y * inline_padding_y);
            if (res_x > (arg0 + max_width))
            {
                col_x = 0;
                col_y++;
                res_x = arg0 + (col_x * inline_padding_x);
                res_y = arg1 + (col_y * inline_padding_y);
            }
        }
        if (!is_bignum(_value))
        {
            _value *= arg3;
            if (is_infinity(_value))
            {
                _value = bignum_multiply(_value, arg3);
            }
        }
        var value_text = number_format(_value, arg6, false, true, get_default_struct_value(resource, "decimal", true));
        if (display_rarity)
        {
            var rarity_color = get_default_struct_value(arg4, "rarity_color", 16777215);
            if (resource_is_struct && is_struct(struct_get_from_hash(resource, variable_get_hash("rarity"))) && !is_undefined(struct_get_from_hash(resource.rarity, variable_get_hash("color"))))
            {
                rarity_color = resource.rarity.color;
            }
            else if (is_string(_key) && !is_undefined(variable_struct_get(global.rarity_colors, _key)))
            {
                rarity_color = variable_struct_get(global.rarity_colors, _key);
            }
            var rw = mini ? 6 : 8;
            var rh = mini ? 12 : 32;
            draw_rect(res_x, res_y + (rh / 10), res_x + rw, res_y + rh, undefined, rarity_color);
            res_x += (rw * 3);
        }
        var suffix_resource_text_other = "";
        if (is_struct(inventory_full) && get_default_struct_value(inventory_full, resource.key, false))
        {
            suffix_resource_text_other = " *";
        }
        if (!is_undefined(prefix))
        {
            draw_text(res_x - 2, arg1 + (i * width * scale), string(prefix));
            res_x += (string_width(prefix) + 8);
        }
        var sprite_x = res_x - 9;
        var sprite_y = res_y - 2;
        if (resource_is_struct)
        {
            if (is_array(struct_get_from_hash(resource, variable_get_hash("stacked_sprites"))))
            {
                var __array2 = resource.stacked_sprites;
                var __prop_len2 = array_length(__array2);
                for (var __i2 = 0; __i2 < __prop_len2; __i2++)
                {
                    var mitem2 = __array2[__i2];
                    var s_sprite = get_default_struct_value(mitem2, "sprite", mitem2);
                    var s_blend_color = get_default_struct_value(mitem2, "blend_color", 16777215);
                    var s_scale = get_default_struct_value(mitem2, "scale", 1);
                    var s_offset_x = get_default_struct_value(mitem2, "offset_x", 0);
                    var s_offset_y = get_default_struct_value(mitem2, "offset_y", 0);
                    draw_sprite_stretched_ext(s_sprite, 0, sprite_x + s_offset_x, sprite_y + s_offset_y, width * s_scale, height * s_scale, s_blend_color, 1);
                }
            }
            else
            {
                draw_sprite_stretched_ext(resource.sprite, 0, sprite_x, sprite_y, width, height, c_white, 1);
            }
        }
        if (show_tooltip && !instance_exists(o_tooltip) && mouse_in_gui_range(sprite_x, sprite_y, sprite_x + width, sprite_y + height))
        {
            draw_tooltip((res_x + (width / 2)) - 9, (res_y + (height / 2)) - 2, width, height, resource.name);
        }
        var color_row = color;
        if (insufficient_indicator)
        {
            var insufficient_indicator_base_value = get_default_struct_value(arg4, "insufficient_indicator_base_value", resource.data.count);
            var insufficient_indicator_check_value = get_default_struct_value(arg4, "insufficient_indicator_check_value", _value);
            color_row = (insufficient_indicator_base_value >= insufficient_indicator_check_value) ? 16777215 : global.colors.insufficient_indicator;
        }
        var resource_text = string(value_text);
        if (is_string(prefix_value))
        {
            resource_text = prefix_value + value_text;
        }
        if (is_string(suffix_value))
        {
            resource_text = value_text + suffix_value;
        }
        if (show_resource_name)
        {
            resource_text += (" " + string(get_default_struct_value(resource, resource_name, "")));
        }
        if (show_current_collection_count)
        {
            resource_text = sprintf("%s/%s", number_format(resource.data.count), resource_text);
        }
        if (!is_undefined(prefix_resource_text))
        {
            resource_text = string(prefix_resource_text) + resource_text;
        }
        if (!is_undefined(suffix_resource_text))
        {
            resource_text = resource_text + string(suffix_resource_text);
        }
        if (is_string(suffix_resource_text_other))
        {
            resource_text = resource_text + suffix_resource_text_other;
        }
        draw_description(res_x + width + text_x_add, res_y - 2, resource_text, text_width, 0, valign, undefined, undefined, font, color_row);
        count++;
        if (leafscend_level > 0)
        {
            set_default_font(f_gui_small);
            draw_text_shadow((res_x + width) - 12, arg1 - 4, leafscend_level);
        }
        col_x++;
    }
    var y_height = count * 14 * scale;
    if (inline)
    {
        y_height = (res_y - y_start) + gui_col_y(1.75);
    }
    if (mini)
    {
        y_height /= 2;
    }
    return rround(y_height);
}

function draw_resources_array(arg0, arg1, arg2, arg3 = global.gui_resources_inline_padding, arg4 = 0)
{
    var __array = arg2;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (arg4 > 0 && __i >= arg4)
        {
            break;
        }
        draw_sprite_stretched(mitem.sprite, 0, arg0 + (__i * arg3), arg1, 32, 32);
    }
}

function draw_resources_current_amount(arg0, arg1, arg2, arg3 = undefined, arg4 = 2, arg5 = "left")
{
    if (is_struct(arg2))
    {
        return draw_resources(arg0, arg1, build_resource_cost(arg2, arg2.data.count), undefined, arg3, undefined, arg4);
    }
    else if (is_array(arg2))
    {
        draw_resources_current_amount_lite_array(arg0, arg1, arg2, false);
    }
    else if (is_string(arg2))
    {
        var res = variable_struct_get(global.resources, arg2);
        return draw_resources(arg0, arg1, build_resource_cost(res, res.data.count), undefined, arg3, undefined, arg4);
    }
    return 0;
}

function draw_resources_current_amount_lite(arg0, arg1, arg2, arg3 = true, arg4 = global.resources)
{
    var resource = arg2;
    if (is_string(arg2))
    {
        resource = variable_struct_get(arg4, arg2);
    }
    if (is_array(arg2))
    {
        return draw_resources_current_amount_lite_array(arg0, arg1, arg2, arg3, arg4);
    }
    if (!is_struct(resource))
    {
        exit;
    }
    if (!resource.data.unlocked)
    {
        exit;
    }
    if (arg3)
    {
        draw_description(arg0, arg1 + gui_col_y(0.25), resource.name_plural, gui_col_x(2), 2, 1);
    }
    if (mouse_in_gui_range(arg0 + 9, arg1 - 3, arg0 + 43, arg1 + 24))
    {
        draw_tooltip(arg0 + 40, arg1 + 4, 100, 50, resource.name);
    }
    set_default_font(f_gui_small, 0);
    draw_text_icon(arg0 + gui_col_x(0.3), arg1, resource.sprite, number_format(resource.data.count), 32);
}

function draw_resources_current_amount_lite_array(arg0, arg1, arg2, arg3 = true, arg4 = "left", arg5 = global.resources, arg6 = 2)
{
    if (!is_array(arg2))
    {
        exit;
    }
    var padding_x = gui_col_x(arg6);
    if (global.is_mobile)
    {
        padding_x += 0.5;
    }
    var dir_sign = (arg4 == "left") ? -1 : 1;
    var __array = arg2;
    var __prop_len = array_length(__array);
    var __i = __prop_len - 1;
    while (__i >= 0)
    {
        var mitem = __array[__i];
        var __ireal = __prop_len - 1 - __i;
        draw_resources_current_amount_lite(arg0 + (dir_sign * __ireal * padding_x), arg1, mitem, arg3, arg5);
        __i--;
    }
}

function draw_resources_mini(arg0, arg1, arg2, arg3 = 1, arg4 = undefined)
{
    if (!is_struct(arg4))
    {
        arg4 = {};
    }
    arg4.mini = true;
    arg4.show_tooltip = true;
    draw_resources(arg0, arg1, arg2, arg3, arg4);
}

function draw_materials(arg0, arg1, arg2, arg3 = 1, arg4 = undefined, arg5 = false)
{
    if (!is_struct(arg4))
    {
        arg4 = {};
    }
    arg4.collection = global.materials;
    return draw_resources(arg0, arg1, arg2, arg3, arg4, arg5);
}

function draw_materials_array(arg0, arg1, arg2, arg3 = global.gui_resources_inline_padding)
{
    var __array = arg2;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        gui_draw_item_sprite(arg0 + (__i * arg3), arg1, mitem);
    }
}

function draw_materials_current_amount(arg0, arg1, arg2, arg3 = undefined, arg4 = 2)
{
    if (is_struct(arg2))
    {
        return draw_materials(arg0, arg1, build_resource_cost(arg2, arg2.data.count), undefined, arg3, true);
    }
    else if (is_string(arg2))
    {
        var res = variable_struct_get(global.materials, arg2);
        return draw_materials(arg0, arg1, build_resource_cost(res, res.data.count), undefined, arg3, true);
    }
    return 0;
}

function draw_materials_current_amount_lite(arg0, arg1, arg2, arg3 = true)
{
    var material = arg2;
    if (is_string(arg2))
    {
        material = variable_struct_get(global.materials, arg2);
    }
    if (is_array(arg2))
    {
        return draw_resources_current_amount_lite_array(arg0, arg1, arg2, arg3, global.materials);
    }
    if (!is_struct(material))
    {
        exit;
    }
    if (arg3)
    {
        draw_description(arg0, arg1 + gui_col_y(0.25), material.name_plural, gui_col_x(2), 2, 1);
    }
    if (mouse_in_gui_range(arg0 + 9, arg1 - 3, arg0 + 43, arg1 + 24))
    {
        draw_tooltip(arg0 + 40, arg1 + 4, 100, 50, material.name);
    }
    set_default_font(f_gui_small, 0);
    draw_text_icon(arg0 + gui_col_x(0.3), arg1, material.sprite, number_format(material.data.count), 32);
}

function draw_materials_mini(arg0, arg1, arg2, arg3 = 1, arg4 = {}, arg5 = true)
{
    arg4.mini = true;
    return draw_materials(arg0, arg1, arg2, arg3, arg4, arg5);
}
