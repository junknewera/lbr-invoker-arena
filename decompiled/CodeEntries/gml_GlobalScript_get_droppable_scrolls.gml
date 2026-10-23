function get_droppable_scrolls()
{
    var drop_array = [];
    var __struct = global.scrolls;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (mitem._can_drop())
        {
            array_push(drop_array, mitem);
        }
    }
    return drop_array;
}
