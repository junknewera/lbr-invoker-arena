function gui_item_collectable_usable_item_list(arg0, arg1, arg2)
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
    if (!is_array(struct_get_from_hash(arg2, variable_get_hash("items"))))
    {
        return 0;
    }
    var items_section = undefined;
    var sections_key = get_default_struct_value(arg2, "sections_key", undefined);
    var show_fav = get_default_struct_value(arg2, "show_fav", false);
    var y_height = 0;
    var is_fav_section = false;
    if (show_fav && is_string(sections_key) && is_struct(variable_struct_get(global.dialog_sections, sections_key)) && is_struct(struct_get_from_hash(variable_struct_get(global.dialog_sections, sections_key), variable_get_hash("favorites"))))
    {
        is_fav_section = current_section.key == variable_struct_get(global.dialog_sections, sections_key).favorites.key;
    }
    var __array = arg2.items;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (is_fav_section && !get_default_struct_value(mitem.data, "fav", false))
        {
            continue;
        }
        y_height += (gui_item_collectable_usable_item(arg0, arg1 + y_height, arg2, mitem, show_fav) + global.gui_items_margin);
    }
    return y_height;
}
