function gui_item_equipment_wrapper(arg0, arg1)
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
    gui_item_collectable_list(arg0, arg1 - gui_col_y(1), 
    {
        display_count: true,
        items_array: global.equipment_array,
        columns: global.is_mobile ? 6 : 8,
        is_unlocked_func: has_item_collected,
        selection_key: "equipment",
        width: gui_col_x(12)
    });
    draw_selected_item(arg0 + gui_col_x(13), arg1, struct_get_from_hash(global.selected_inventory_item, variable_get_hash("equipment")), gui_col_x(10), undefined, draw_selected_item_actions, undefined, has_item_collected, undefined, 
    {
        draw_use_button: false,
        draw_below_func: gui_item_equipment
    });
}

function gui_item_equipment(arg0, arg1, arg2, arg3, arg4, arg5)
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
        exit;
    }
    var y_start = arg1;
    if (arg2.is_unlocked())
    {
        var res = 
        {
            materials: arg2.get_display_materials(),
            resources: arg2.get_display_resources()
        };
        draw_result(arg0, arg1, res);
    }
    else if (arg2.buy_unlock && is_struct(arg2.unlock_cost))
    {
        var mini = get_struct_length(arg2.unlock_cost.resources) >= 3;
        var mini_mats = get_struct_length(arg2.unlock_cost.materials) >= 3;
        if (is_struct(arg2.input_resources_options))
        {
            arg2.input_resources_options.mini = mini;
        }
        var add_y_res = 0;
        add_y_res += draw_resources(arg0, arg1, arg2.unlock_cost.resources, 1, arg2.input_resources_options, true);
        add_y_res += draw_materials(arg0, arg1, arg2.unlock_cost.materials, 1, 
        {
            insufficient_indicator: true,
            mini: mini_mats,
            show_tooltip: true
        }, true);
        arg1 += add_y_res;
    }
    var pos_button_use_x = arg0;
    if (arg2.buy_unlock)
    {
        if (gui_button(pos_button_use_x, arg1 + gui_col_y(0.5), __("Unlock"), arg2._can_unlock(), gui_col_x(1.5)))
        {
            arg2._unlock();
        }
    }
    arg2.add_draw(arg0, arg1);
    arg1 += gui_col_y(1);
    arg1 += gui_draw_buy_upgrades(arg0 + gui_col_x(7), arg1, arg2, false);
    return arg1 - y_start;
}

function gui_item_equipment_add_draw()
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
    if (gui_button_tl(add_button_base_x_tl + gui_col_x(20), add_button_base_y, __("Upgrade all"), undefined, gui_col_x(3)))
    {
        confirm_dialog_current_nav(__("Do you want to upgrade all items?"), upgrade_all_equipment);
    }
}
