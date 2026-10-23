function gui_item_shop(arg0, arg1, arg2)
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
    var shop_items = arg2.shop_items;
    var shop_items_custom = get_default_struct_value(arg2, "shop_items_custom", false);
    var shop_key = arg2.shop_key;
    var check_fav = false;
    var y_height = 0;
    if (is_struct(variable_struct_get(global.dialog_sections, shop_key)) && is_struct(struct_get_from_hash(variable_struct_get(global.dialog_sections, shop_key), variable_get_hash("favorites"))) && current_section.key == variable_struct_get(global.dialog_sections, shop_key).favorites.key)
    {
        check_fav = true;
    }
    y_height += gui_draw_shop_items(arg0, arg1, shop_items, check_fav);
    if (global.debug && keyboard_check(vk_control))
    {
        arg1 += y_height;
        if (gui_button_tl(arg0, arg1, "max all"))
        {
            var __array = shop_items;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                var max_count = get_shop_item_max_count(mitem.item);
                if (max_count == -1)
                {
                    mitem.item.data.count = 100;
                }
                else
                {
                    mitem.item.data.count = max_count;
                }
                add_resources(get_item_cost(mitem.item));
                buy_item(mitem.item);
            }
        }
        if (gui_button_tl(arg0 + gui_col_x(2), arg1, "all=0"))
        {
            var __array = shop_items;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                mitem.item.data.count = 0;
            }
        }
        if (gui_button_tl(arg0 + gui_col_x(4), arg1, "level=0"))
        {
            var __array = shop_items;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                mitem.item.data.level = 0;
            }
        }
    }
    return y_height;
}
