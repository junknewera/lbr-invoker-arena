function draw_text_table(arg0, arg1, arg2, arg3 = global.gui_text_line_height, arg4 = gui_col_x(24), arg5 = 0)
{
    var y_start = arg1;
    if (!is_array(arg2) || array_length(arg2) == 0)
    {
        return 0;
    }
    var _xpadding = 32;
    if (global.is_mobile)
    {
        arg3 += 6;
    }
    var max_array_length = 0;
    var __array = arg2;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        max_array_length = max(max_array_length, array_length(mitem));
    }
    var column_sizes = _fill([], 0, 0, max_array_length);
    __array = arg2;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        var __array2 = mitem;
        var __prop_len2 = array_length(__array2);
        for (var __i2 = 0; __i2 < __prop_len2; __i2++)
        {
            var mitem2 = __array2[__i2];
            if (arg5 > 0 && string_length(mitem2) > arg5)
            {
                mitem2 = string_copy(mitem2, 0, arg5);
            }
            column_sizes[__i2] = max(column_sizes[__i2], string_width(mitem2) + _xpadding);
        }
    }
    __array = arg2;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        var xloop = 0;
        var __array2 = mitem;
        var __prop_len2 = array_length(__array2);
        for (var __i2 = 0; __i2 < __prop_len2; __i2++)
        {
            var mitem2 = __array2[__i2];
            if (arg5 > 0 && string_length(mitem2) > arg5)
            {
                mitem2 = string_copy(mitem2, 0, arg5) + "...";
            }
            draw_text_ext(arg0 + xloop, arg1 + (__i * arg3), mitem2, arg3, arg4);
            xloop += column_sizes[__i2];
        }
    }
    return array_length(arg2) * arg3;
}

function explode(arg0, arg1)
{
    var str = string(arg1) + string(arg0);
    var len = string_length(arg0);
    var ind = 0;
    var arr;
    repeat (string_count(arg0, str))
    {
        var pos = string_pos(arg0, str) - 1;
        arr[ind] = string_copy(str, 1, pos);
        str = string_delete(str, 1, pos + len);
        ind++;
    }
    return arr;
}

function format_text_numbers(arg0, arg1, arg2 = undefined, arg3 = "/", arg4 = true)
{
    var text_template = "%s (%s)";
    var text_template2 = "%s (%s" + string(arg3) + "%s)";
    var value1_final = arg1;
    var value2_final = arg2;
    if (arg4)
    {
        if (is_numeric(arg1))
        {
            value1_final = number_format(arg1);
        }
        if (is_numeric(arg2))
        {
            value2_final = number_format(arg2);
        }
    }
    if (!is_undefined(arg2))
    {
        return sprintf(text_template2, arg0, value1_final, value2_final);
    }
    return sprintf(text_template, arg0, value1_final);
}

function format_value_time_parts(arg0, arg1 = ", ", arg2 = true, arg3 = true, arg4 = true, arg5 = true)
{
    var value_m = arg0 * 60;
    var value_h = value_m * 60;
    var nf = arg2 ? number_format : __void;
    var suffix_s = arg3 ? __("s") : __("second");
    var suffix_m = arg3 ? __("m") : __("minute");
    var suffix_h = arg3 ? __("h") : __("hour");
    var text = [sprintf("%s/%s", nf(arg0), suffix_s)];
    if (arg4)
    {
        array_push(text, sprintf("%s/%s", nf(value_m), suffix_m));
    }
    if (arg5)
    {
        array_push(text, sprintf("%s/%s", nf(value_h), suffix_h));
    }
    return implode(arg1, text);
}

function get_general_description(arg0 = self)
{
    var desc_array = [];
    var prefix = get_default_struct_value(arg0, "description_prefix", "");
    if (!is_empty(prefix))
    {
        array_push(desc_array, prefix);
    }
    var upgrade_attributes = get_default_struct_value(arg0, "upgrade_attributes", undefined);
    var upgrade_attributes_default = upgrade_attributes;
    if (!is_undefined(struct_get_from_hash(arg0, variable_get_hash("get_upgrade_attributes"))))
    {
        upgrade_attributes = arg0.get_upgrade_attributes();
    }
    var upgrade_text = format_upgrade_text(upgrade_attributes, undefined, undefined, undefined, undefined, undefined, undefined, get_default_struct_value(arg0, "obfuscate_upgrade_description", true), undefined, get_default_struct_value(arg0, "show_upgrade_description_modifier", false), upgrade_attributes_default);
    if (!is_empty(upgrade_text))
    {
        array_push(desc_array, upgrade_text);
    }
    var suffix = get_default_struct_value(arg0, "description_suffix", "");
    if (!is_empty(suffix))
    {
        array_push(desc_array, suffix);
    }
    var text = string_trim(implode("\n", desc_array));
    return text;
}

function get_general_name(arg0, arg1 = -1, arg2 = -1)
{
    var name = arg0;
    if (arg1 >= 0)
    {
        name = sprintf("%s [%s]", arg0, number_format(arg1));
    }
    if (arg2 > 0)
    {
        name = sprintf("%s [%s/%s]", arg0, number_format(arg1), number_format(arg2));
    }
    return name;
}

function get_general_upgrade_attributes_text(arg0)
{
    if (!is_struct(arg0))
    {
        return "";
    }
    return format_upgrade_text(arg0, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, 1);
}

function get_item_collect_name(arg0, arg1 = 1)
{
    if (is_string(arg0))
    {
        return $"{number_format(arg1)} {arg0}";
    }
    if (!is_struct(arg0))
    {
        return arg1;
    }
    return $"{number_format(arg1)} {arg0.name}";
}

function get_item_count_text(arg0, arg1)
{
    var name = number_format(arg0);
    if (arg1 > 0)
    {
        name = sprintf("%s/%s", number_format(arg0), number_format(arg1));
    }
    return name;
}

function implode(arg0, arg1, arg2 = false, arg3 = undefined, arg4 = "", arg5 = "", arg6 = "")
{
    if (!is_array(arg1) || array_length(arg1) == 0)
    {
        return arg4;
    }
    var len = array_length(arg1);
    var out = "";
    if (arg2)
    {
        var __array = arg1;
        var __prop_len = array_length(__array);
        var __i = __prop_len - 1;
        while (__i >= 0)
        {
            var mitem = __array[__i];
            var __ireal = __prop_len - 1 - __i;
            var txt = string(arg5) + string(mitem) + string(arg6);
            txt = string_replace_all(txt, "{{n}}", string(__i + 1));
            if (!is_undefined(arg3))
            {
                txt = arg3(txt);
            }
            if (__i != (len - 1))
            {
                out += arg0;
            }
            out += txt;
            __i--;
        }
    }
    else
    {
        var __array = arg1;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            var txt = string(arg5) + string(mitem) + string(arg6);
            txt = string_replace_all(txt, "{{n}}", string(__i + 1));
            if (!is_undefined(arg3))
            {
                txt = arg3(txt);
            }
            out += txt;
            if (__i != (len - 1))
            {
                out += arg0;
            }
        }
    }
    return out;
}

function sprintf()
{
    var str = argument[0];
    var i = 1;
    while (string_pos("%s", str) != 0 && i < argument_count)
    {
        str = string_replace(str, "%s", string(argument[i++]));
    }
    return str;
}

function string_lpad(arg0, arg1, arg2)
{
    var s = string(arg0);
    return string_repeat(arg1, ceil((arg2 - string_length(s)) / string_length(arg1))) + s;
}

function string_wordwrap_width(arg0, arg1, arg2, arg3)
{
    var pos_space = -1;
    var pos_current = 1;
    if (is_real(arg2))
    {
        arg2 = "#";
    }
    var text_output = "";
    while (string_length(arg0) >= pos_current)
    {
        if (string_width(string_copy(arg0, 1, pos_current)) > arg1)
        {
            if (pos_space != -1)
            {
                text_output += (string_copy(arg0, 1, pos_space) + string(arg2));
                arg0 = string_copy(arg0, pos_space + 1, string_length(arg0) - pos_space);
                pos_current = 1;
                pos_space = -1;
            }
            else if (arg3)
            {
                text_output += (string_copy(arg0, 1, pos_current - 1) + string(arg2));
                arg0 = string_copy(arg0, pos_current, string_length(arg0) - (pos_current - 1));
                pos_current = 1;
                pos_space = -1;
            }
        }
        if (string_char_at(arg0, pos_current) == " ")
        {
            pos_space = pos_current;
        }
        pos_current += 1;
    }
    if (string_length(arg0) > 0)
    {
        text_output += arg0;
    }
    return text_output;
}

function text_the(arg0 = "", arg1 = true)
{
    if (!is_string(arg0))
    {
        return arg0;
    }
    if (string_lower(string_copy(string_trim(arg0), 1, 3)) == "the")
    {
        return arg0;
    }
    var ret_text = "the";
    if (arg1)
    {
        ret_text += " ";
    }
    ret_text += arg0;
    return ret_text;
}

function textr(arg0, arg1, arg2 = undefined, arg3 = undefined, arg4 = undefined)
{
    if (!is_struct(arg1))
    {
        return arg0;
    }
    var text_parts = explode("[", arg0);
    var text_parts_length = array_length(text_parts);
    if (text_parts_length <= 1)
    {
        return arg0;
    }
    var __array = text_parts;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        var is_pct = false;
        var tmp_array = explode("]", mitem);
        if (array_length(tmp_array) <= 1)
        {
            continue;
        }
        var tmp_var = @@array_get@@(tmp_array, 0);
        var tmp_var_orig = tmp_var;
        var tmp_var_replace = variable_struct_get(arg1, tmp_var);
        if (string_pos("%", tmp_var) != 0)
        {
            is_pct = true;
            tmp_var = string_replace(tmp_var, "%", "");
            tmp_var_replace = variable_struct_get(arg1, tmp_var);
        }
        if (is_undefined(tmp_var_replace))
        {
            continue;
        }
        if (is_struct(arg4) && is_callable(variable_struct_get(arg4, tmp_var)))
        {
            tmp_var_replace = variable_struct_get(arg4, tmp_var)();
        }
        if (is_pct)
        {
            tmp_var_replace = number_format_percent(tmp_var_replace);
        }
        if (is_struct(arg2) && is_string(variable_struct_get(arg2, tmp_var)))
        {
            tmp_var_replace = sprintf("%s %s", variable_struct_get(arg2, tmp_var), tmp_var_replace);
        }
        if (is_struct(arg3) && is_string(variable_struct_get(arg3, tmp_var)))
        {
            tmp_var_replace = sprintf("%s %s", tmp_var_replace, variable_struct_get(arg3, tmp_var));
        }
        var replace_text_var = "[" + tmp_var_orig + "]";
        arg0 = string_replace(arg0, replace_text_var, string(tmp_var_replace));
    }
    return arg0;
}
