function get_available_items(arg0)
{
    var items = [];
    if (is_array(arg0))
    {
        var __array = arg0;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (mitem.data.unlocked)
            {
                array_push(items, mitem);
            }
        }
    }
    else if (is_struct(arg0))
    {
        var __struct = arg0;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            if (mitem.data.unlocked)
            {
                array_push(items, mitem);
            }
        }
    }
    return items;
}
