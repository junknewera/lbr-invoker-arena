function get_options_data(arg0 = false)
{
    var result = {};
    var __struct = global.options;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (mitem.is_hotkey)
        {
            continue;
        }
        variable_struct_set(result, mkey, get_option(mitem));
    }
    return result;
}
