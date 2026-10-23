function remove_house_item(arg0, arg1)
{
    var __array = arg0.data.build_data;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (mitem.item_id != arg1)
        {
            continue;
        }
        array_delete(arg0.data.build_data, __i, 1);
        break;
    }
}
