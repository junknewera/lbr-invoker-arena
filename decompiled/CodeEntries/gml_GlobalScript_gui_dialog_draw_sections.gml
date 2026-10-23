function gui_dialog_draw_sections()
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
    var section_button_width = round(gui_bg_width / 7);
    if (array_length(sections_sorted) > 1)
    {
        var sections_shown = 0;
        var visible_sections = [];
        var __array = sections_sorted;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (!is_undefined(struct_get_from_hash(mitem, variable_get_hash("is_visible"))) && !get_value_ext(mitem, mitem.is_visible))
            {
                continue;
            }
            array_push(visible_sections, mitem);
        }
        var sections_count = array_length(visible_sections);
        var sections_total_width = sections_count * section_button_width;
        if (sections_total_width > gui_bg_width)
        {
            section_button_width = round(gui_bg_width / sections_count);
        }
        __array = visible_sections;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            var is_obfuscated = false;
            if (!is_undefined(struct_get_from_hash(mitem, variable_get_hash("is_obfuscated"))))
            {
                is_obfuscated = get_value_ext(mitem, mitem.is_obfuscated);
            }
            var section_button_x = gui_bg_x + (section_button_width * sections_shown);
            var section_button_y = gui_y_start + gui_height;
            var name = is_obfuscated ? "???" : mitem.name;
            if (current_section.value == mitem.value)
            {
                name = sprintf("[%s]", name);
            }
            if (gui_button_tl(section_button_x, section_button_y, name, !is_obfuscated, section_button_width, undefined, global.static_structs.center))
            {
                global.disable_gui_close_tmp = true;
                set_dialog_section(mitem, true);
            }
            sections_shown++;
        }
    }
}

function draw_button_sections(arg0, arg1, arg2 = [], arg3 = select_button_section, arg4 = gui_col_x(24), arg5 = undefined, arg6 = "unknown")
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
    if (!is_array(arg2) || array_length(arg2) == 0)
    {
        return 0;
    }
    var button_width = arg4 / array_length(arg2);
    button_width = clamp(button_width, gui_col_x(2), gui_col_x(4));
    var __array = arg2;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (get_default_struct_value_ext(mitem, "is_obfuscated", false))
        {
            continue;
        }
        if (!get_default_struct_value_ext(mitem, "is_visible", true))
        {
            continue;
        }
        var selected = false;
        var key = get_default_struct_value(mitem, "key", get_default_struct_value(mitem, "text", undefined));
        if (!is_undefined(key) && key == arg5)
        {
            selected = true;
        }
        var button_options = get_default_struct_value(mitem, "button_options", undefined);
        if (selected)
        {
            if (!is_struct(button_options))
            {
                button_options = {};
            }
            button_options.selected = selected;
        }
        if (gui_button_tl(arg0, arg1, get_default_struct_value(mitem, "text", mitem), get_default_struct_value(mitem, "enabled", true), button_width, undefined, button_options))
        {
            arg3(mitem, key, arg6);
        }
        arg0 += button_width;
    }
    return gui_col_y(2.75);
}

function select_button_section(arg0, arg1, arg2)
{
    variable_struct_set(global.selected_inventory_item, arg2, arg1);
}
