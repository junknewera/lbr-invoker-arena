function gui_item_areas(arg0, arg1)
{
    var items = variable_struct_get(global.areas_sections, current_section.key);
    if (is_undefined(items))
    {
        exit;
    }
    var y_height = 0;
    if (current_section.key == global.dialog_sections.areas.favorites.key)
    {
        items = [];
        __array = global.areas_array;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (mitem.data.fav)
            {
                array_push(items, mitem);
            }
        }
    }
    var __array = items;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        var y_item_height = gui_item_area(arg0, arg1 + y_height, mitem);
        y_height += (y_item_height + global.gui_items_default_height);
    }
    return y_height;
}
