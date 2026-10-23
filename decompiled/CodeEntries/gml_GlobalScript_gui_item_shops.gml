function gui_item_shops(arg0, arg1, arg2)
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
    var shops = arg2.shops;
    var y_height = 0;
    var y_start = arg1;
    if (arg2.has_general_page && is_current_dialog_section(arg2.sections.general))
    {
        arg1 += draw_description(arg0, arg1, __("Welcome to the event shop! Here, you can purchase upgrades that are available to events exclusively."));
        arg1 += gui_col_y(1);
        __array = global.events_sorted;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            arg1 += (draw_heading(arg0, arg1, mitem.name) - gui_col_y(0.5));
            var d1 = date_date_string(get_date_from_object(mitem.date_start));
            var d2 = date_date_string(get_date_from_object(mitem.date_end));
            var desc = mitem.description + "\n" + "\n" + __s("Event date") + sprintf(": %s - %s", d1, d2);
            arg1 += draw_description(arg0, arg1, desc);
            arg1 += gui_col_y(1);
        }
        return arg1 - y_start;
    }
    var __array = shops;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (is_current_dialog_section(mitem.section))
        {
            y_height = gui_item_shop(arg0, arg1, 
            {
                shop_items: mitem.shop,
                shop_key: mitem.shop_key
            });
            return y_height;
        }
    }
    return y_height;
}
