function gui_item_unique_leaves()
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
}

function gui_item_unique_leaf(arg0, arg1, arg2)
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
    var col = iif(arg2.data.count > 0, 16777215, 0);
    draw_sprite_stretched_ext(arg2.sprite, 0, gui_x + 8, gui_y + 8, 32, 32, col, 1);
    set_default_font(f_gui_default);
    var item_name = get_value_ext(arg2, arg2.name, false);
    var name = item_name;
    var description = get_value_ext(arg2.instance, arg2.description, arg2);
    if (get_upgrade_count(arg2) == 0)
    {
        name = "?";
        description = arg2.description_locked;
    }
    draw_text(gui_x + gui_col_x(1), gui_y, name);
    set_default_font(f_gui_small);
    draw_text_ext(gui_x + gui_col_x(1), gui_y + gui_col_y(0.9), description, global.gui_text_line_height, gui_col_x(9));
    if (get_upgrade_count(arg2) > 0)
    {
        if (arg2.is_active())
        {
            var can_do_action = true;
            if (gui_button(gui_x + gui_col_x(14.5), gui_y + gui_col_y(0.5), __("Deactivate"), true, gui_col_x(3)))
            {
                arg2.deactivate();
            }
        }
        else
        {
            var ul_active = _sum(global.unique_leaves_sorted, function(arg0)
            {
                return arg0.is_active();
            });
            var max_unique_leaves = get_max_concurrent_unique_leaves();
            var can_do_action = ul_active < max_unique_leaves;
            if (gui_button(gui_x + gui_col_x(14.5), gui_y + gui_col_y(0.5), __("Activate"), can_do_action, gui_col_x(3)))
            {
                arg2.activate();
            }
        }
    }
}

function gui_item_unique_leaves_add_draw()
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
    var ul_active = _sum(global.unique_leaves_sorted, function(arg0)
    {
        return arg0.is_active();
    });
    set_default_font(f_gui_small);
    draw_text(add_text_base_x, add_text_base_y, sprintf(__("Active: %s/%s"), ul_active, get_max_concurrent_unique_leaves()));
    if (gui_button_tl(add_button_base_x_tl + gui_col_x(4), add_button_base_y, __("Activate all"), undefined, gui_col_x(3)))
    {
        var __array = global.unique_leaves_sorted;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (mitem.can_activate())
            {
                mitem.activate();
            }
        }
    }
    if (gui_button_tl(add_button_base_x_tl + gui_col_x(8), add_button_base_y, __("Deactivate all"), undefined, gui_col_x(3)))
    {
        var __array = global.unique_leaves_sorted;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            mitem.deactivate();
        }
    }
    if (is_unlocked_materials())
    {
        if (gui_button_tl(add_button_base_x_tl + gui_col_x(20), add_button_base_y, __("Upgrade all"), undefined, gui_col_x(3)))
        {
            confirm_dialog_current_nav(__("Do you want to upgrade all items?"), upgrade_all_unique_leaves);
        }
    }
}
