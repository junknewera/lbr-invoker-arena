function can_place_house_item(arg0, arg1, arg2)
{
    var list = ds_list_create();
    var instances = instance_place_list(x, y, o_house_item, list, false);
    if (ds_list_size(list) == 0)
    {
        return true;
    }
    if (instance_number(o_house_item) > global.max_house_items)
    {
        return false;
    }
    var can_place = true;
    var __dslist = list;
    var __prop_len = ds_list_size(__dslist);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        if (is_undefined(ds_list_find_value(__dslist, __i)))
        {
            continue;
        }
        var mitem = ds_list_find_value(__dslist, __i);
        if (mitem.item.grid_layer == arg2.grid_layer)
        {
            can_place = false;
            break;
        }
    }
    ds_list_destroy(list);
    return can_place;
}
