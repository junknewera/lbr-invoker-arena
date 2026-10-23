function build_string_from_struct_keys(arg0, arg1, arg2, arg3 = ", ")
{
    var output = [];
    if (is_struct(arg1))
    {
        var __struct = arg1;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var item = variable_struct_get(arg0, mitem);
            if (is_undefined(item))
            {
                continue;
            }
            array_push(output, get_value_ext(item, variable_struct_get(item, arg2)));
        }
    }
    else if (is_array(arg1))
    {
        var __array = arg1;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            var item = variable_struct_get(arg0, mitem);
            if (is_undefined(item))
            {
                continue;
            }
            array_push(output, get_value_ext(item, variable_struct_get(item, arg2)));
        }
    }
    return implode(arg3, output);
}
