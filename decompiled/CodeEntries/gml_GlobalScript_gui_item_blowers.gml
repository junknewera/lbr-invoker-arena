function gui_item_blowers(arg0, arg1)
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
    var items = variable_struct_get(global.shop_items_weapons_array_sections, current_section.key);
    if (current_section.key == "favorites" || current_section.key == "all")
    {
        items = global.shop_items_weapons_array;
    }
    arg1 += gui_item_shop(arg0, arg1, 
    {
        shop_items: items,
        shop_key: "shop_blowers"
    });
    return arg1 - y_start;
}

function gui_item_blowers_add_draw(arg0, arg1, arg2)
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
    if (is_unlocked_materials())
    {
        if (gui_button_tl(add_button_base_x_tl + gui_col_x(20), add_button_base_y, __("Upgrade all"), undefined, gui_col_x(3)))
        {
            confirm_dialog_current_nav(__("Do you want to upgrade all items?"), upgrade_all_blowers);
        }
    }
}

function upgrade_all_blowers()
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
    var __array = global.shops_sorted.weapons;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (!mitem.is_upgrade_unlocked())
        {
            mitem.unlock_upgrade();
        }
        mitem.upgrade(mitem.get_max_upgrade_level());
    }
    refresh_ua_section("shops");
}
