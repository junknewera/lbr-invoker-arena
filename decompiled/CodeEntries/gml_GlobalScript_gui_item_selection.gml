function gui_item_selection(arg0, arg1, arg2)
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
    if (!is_struct(struct_get_from_hash(arg2, variable_get_hash("list_props"))))
    {
        return log("Invalid GUI item: missing props", debug_get_callstack(10));
    }
    var draw_func = get_default_struct_value(arg2, "draw_func", draw_selected_item);
    var _width = get_default_struct_value(arg2.list_props, "width", gui_col_x(14));
    var selection_width = gui_content_width - _width;
    var selected_item = get_value_ext(arg2, get_default_struct_value(arg2, "selected_item", ""));
    var selection_key = get_default_struct_value(arg2, "selection_key", undefined);
    if (is_string(selection_key))
    {
        selected_item = variable_struct_get(global.selected_inventory_item, selection_key);
        arg2.list_props.selection_key = selection_key;
    }
    if (!is_undefined(struct_get_from_hash(arg2, variable_get_hash("before_draw"))))
    {
        var loop_y = arg2.before_draw(arg0, arg1);
        if (is_numeric(loop_y))
        {
            arg1 += loop_y;
        }
    }
    var y_height_list = gui_item_collectable_list(arg0, arg1, arg2.list_props);
    var y_height_selected_item = 0;
    if (is_struct(selected_item))
    {
        y_height_selected_item = draw_func(arg0 + _width + gui_col_x(1), arg1 + gui_col_y(1), selected_item, global.gui_settings.content_width - _width - gui_col_x(2), undefined, get_default_struct_value(arg2, "selected_item_draw_func", draw_selected_item_actions), get_default_struct_value(arg2, "selected_item_use_func", __void), get_default_struct_value(arg2, "selected_item_is_unlocked_func", __return_true), get_default_struct_value(arg2, "selected_item_draw_locked_func", __void), get_default_struct_value(arg2, "selected_item_draw_props", undefined));
    }
    return max(200, y_height_list, y_height_selected_item);
}

function gui_item_selected_codex_item(arg0, arg1, arg2)
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
    arg1 += draw_heading(arg0, arg1, __("Upgrades"));
    arg1 += draw_description(arg0, arg1, struct_get_from_hash(arg2, variable_get_hash("upgrade_cache_text")), gui_col_x(8));
    return arg1 - y_start;
}

function gui_item_collectable_list(arg0, arg1, arg2, arg3 = gui_col_y(1))
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
    var gui_instance_id = get_default_struct_value(arg2, "gui_instance_id", "tmp");
    var gui_instance = variable_struct_get(global.gui_instance_ids, gui_instance_id);
    var shown_on_hover = get_default_struct_value(arg2, "shown_on_hover", false);
    if (dialog_visible && !instance_exists(gui_instance))
    {
        var list_y = arg1;
        if (get_default_struct_value(arg2, "fixed_y", false))
        {
            list_y = gui_y_start_items;
        }
        var o = instance_create_layer(arg0, list_y + arg3, global.layers.gui, o_gui_scrollable_items_inline);
        o.width = get_default_struct_value(arg2, "width", gui_content_width);
        o.height = get_default_struct_value(arg2, "height", gui_content_height - gui_col_y(3));
        o.btn_bg_color = get_default_struct_value(arg2, "btn_bg_color", undefined);
        o.columns = get_default_struct_value(arg2, "columns", 20);
        o.display_count = get_default_struct_value(arg2, "display_count", false);
        o.places = get_default_struct_value(arg2, "places", 2);
        o.sections_key = get_default_struct_value(arg2, "sections_key");
        o.sections_item_key = get_default_struct_value(arg2, "sections_item_key");
        apply_struct_to_instance(arg2, o);
        o.gui_instance_id = gui_instance_id;
        o.is_unlocked_func = get_default_struct_value(arg2, "is_unlocked_func", undefined);
        o.items = arg2.items_array;
        o.selected_key = get_default_struct_value(arg2, "selected_key", "");
        o.selection_key = get_default_struct_value(arg2, "selection_key");
        o.shown_on_hover = shown_on_hover;
        o.button_force_enable = true;
        with (o)
        {
            init();
        }
        if (is_struct(struct_get_from_hash(arg2, variable_get_hash("items"))) && !shown_on_hover)
        {
            var __struct = arg2.items;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                if (!is_struct(mitem) || !is_struct(struct_get_from_hash(mitem, variable_get_hash("data"))))
                {
                    continue;
                }
                if (mitem.data.count == 0)
                {
                    continue;
                }
                mitem.data.shown = true;
            }
        }
        variable_struct_set(global.gui_instance_ids, gui_instance_id, o);
        return 100;
    }
    else if (instance_exists(gui_instance))
    {
        return gui_instance.height + gui_col_y(1);
    }
    return 0;
}
