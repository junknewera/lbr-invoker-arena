function gui_item_leafscension(arg0, arg1, arg2)
{
    var y_start = arg1;
    if (is_current_dialog_section(global.dialog_sections.leafscension.settings))
    {
        arg1 += gui_item_leafscension_settings(arg0, arg1);
    }
    else
    {
        var level = current_section.index;
        var __array = variable_struct_get(global.leafscenders_level, level);
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            var height = gui_item_leafscender(arg0, arg1, mitem);
            arg1 = add_safe(arg1, height);
        }
    }
    return arg1 - y_start;
}

function gui_item_leafscension_settings(arg0, arg1)
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
    var autouse_enabled = can_autouse_leafscenders();
    arg1 += draw_heading_description(arg0, arg1, __("Settings"), __("Manage batch actions and auto leafscend behavior for each level here."), undefined, undefined, undefined, 0);
    arg1 += global.ui_gaps.sm;
    var row_y = arg1;
    arg1 += draw_heading_description(arg0, row_y, __("All levels"), __("Apply actions to every leafscension level."), gui_col_x(9), undefined, undefined, 0);
    if (gui_button_tl(arg0 + gui_col_x(10), row_y + gui_col_y(0.5), __("Start all once"), true, gui_col_x(3.5)))
    {
        start_all_leafscenders();
        notify(__s("All available leafscenders were started once."));
    }
    if (gui_button_tl(arg0 + gui_col_x(16), row_y + gui_col_y(0.5), __("Auto on"), autouse_enabled, gui_col_x(3)))
    {
        gui_item_leafscension_set_all_autouse(true);
    }
    if (gui_button_tl(arg0 + gui_col_x(20), row_y + gui_col_y(0.5), __("Auto off"), autouse_enabled, gui_col_x(3)))
    {
        gui_item_leafscension_set_all_autouse(false);
    }
    arg1 += global.ui_gaps.sm;
    for (var level = 1; level <= global.game_settings.leafscend_max_level; level++)
    {
        var row_x = arg0 + (gui_col_x(4) * (level - 1));
        row_y = arg1;
        row_y += draw_heading(row_x, row_y, __s("Level %s", level), gui_col_x(9.5), undefined, undefined, 0);
        if (gui_button_tl(row_x, row_y, __("Auto on"), autouse_enabled, gui_col_x(3)))
        {
            gui_item_leafscension_set_level_autouse(level, true);
        }
        row_y += global.ui_gaps.button_y;
        if (gui_button_tl(row_x, row_y, __("Auto off"), autouse_enabled, gui_col_x(3)))
        {
            gui_item_leafscension_set_level_autouse(level, false);
        }
        row_y += global.ui_gaps.button_y;
    }
    arg1 = row_y;
    arg1 += global.ui_gaps.sm;
    if (has_bought_shop_item(global.shops.coal.leafscenders_safe_mode))
    {
        arg1 += draw_option(global.options.leafscenders_safe_mode, arg0 + gui_col_x(0.5), arg1, undefined, 
        {
            add_description: true
        }, 5);
    }
    return arg1 - y_start;
}

function gui_item_leafscension_set_all_autouse(arg0)
{
    var __struct = global.leafscenders;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        var __struct2 = mitem;
        var __prop_names2 = struct_get_names(__struct2);
        var __prop_len2 = array_length(__prop_names2);
        for (var __i2 = 0; __i2 < __prop_len2; __i2++)
        {
            var mkey2 = __prop_names2[__i2];
            var mitem2 = variable_struct_get(__struct2, mkey2);
            mitem2.data.autouse = arg0;
        }
    }
    var action_text = arg0 ? __("enabled") : __("disabled");
    notify(__s("%s leafscenders have been %s.", __("All"), action_text));
}

function gui_item_leafscension_set_level_autouse(arg0, arg1)
{
    var __struct = variable_struct_get(global.leafscenders, arg0);
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.data.autouse = arg1;
    }
    var action_text = arg1 ? __("enabled") : __("disabled");
    notify(__s("%s leafscenders have been %s.", sprintf("L%s", arg0), action_text));
}

function gui_item_leafscender(arg0, arg1, arg2)
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
    if (!is_struct(arg2))
    {
        return 0;
    }
    var y_start = arg1;
    var col = iif(arg2.is_unlocked(), 16777215, 0);
    draw_sprite_stretched_ext(arg2.sprite, 0, arg0 + 8, arg1 + 8, 32, 32, col, 1);
    var name = get_value_ext(arg2, arg2.get_name, false);
    arg1 += draw_heading_description(arg0 + gui_col_x(1), arg1, name, arg2.get_description(), gui_col_x(9.5), undefined, undefined, 0);
    if (arg2.is_unlocked())
    {
        var res_x = global.is_mobile ? gui_col_x(9) : gui_col_x(10.5);
        draw_resources(arg0 + res_x, y_start, arg2.get_display_resources(), 1, arg2.input_resources_options, true);
        gui_draw_sprite(arg0 + gui_col_x(13), y_start + gui_col_y(0.5), spr_gui_arrow_right);
        draw_resources(arg0 + gui_col_x(13.75), y_start + gui_col_y(0), arg2.get_output_resources(), 1, arg2.output_resources_options);
    }
    if (arg2.is_unlocked())
    {
        var button_text = __("Leafscend");
        if (arg2.is_active())
        {
            button_text = __("Leafscending...");
        }
        if (gui_button(arg0 + gui_col_x(19), y_start + gui_col_y(0.5), button_text, arg2._can_activate(), gui_col_x(3)))
        {
            arg2._func();
        }
        if (get_value_ext(arg2, arg2._has_autouse) && get_value_ext(arg2, arg2.can_autouse))
        {
            if (gui_button_toggle(arg0 + gui_col_x(22.8), y_start + gui_col_y(0.5), arg2.data.autouse, true, 
            {
                tooltip: arg2.get_autouse_tooltip()
            }))
            {
                arg2.data.autouse = !arg2.data.autouse;
            }
        }
    }
    return arg1 - y_start;
}

function gui_item_leafscension_add_draw()
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
    var autouse_enabled = can_autouse_leafscenders();
    global.options.leafscenders_autouse_bot.draw(add_button_base_x + gui_col_x(21), add_button_base_y_tl, undefined, 
    {
        name_position: "before",
        width: gui_col_x(12)
    }, 5, autouse_enabled);
    if (!is_current_dialog_section(global.dialog_sections.leafscension.settings))
    {
        var level = current_section.index;
        var text = sprintf("%s (L%s)", __s("Start once"), level);
        if (gui_button_tl(add_button_base_x, add_button_base_y, text, undefined, gui_col_x(3.5)))
        {
            var __struct = variable_struct_get(global.leafscenders, level);
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                if (mitem._can_activate())
                {
                    mitem._activate();
                }
            }
        }
    }
}
