function get_struct_sum(arg0, arg1 = "data", arg2 = "count")
{
    var sum = 0;
    if (is_struct(arg0))
    {
        if (is_empty(arg1) && is_empty(arg2))
        {
            var __struct = arg0;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                if (is_struct(mitem))
                {
                    sum += get_struct_sum(mitem, arg1, arg2);
                }
                else
                {
                    sum += mitem;
                }
            }
        }
        else
        {
            var __struct = arg0;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                if (is_undefined(variable_struct_get(mitem, arg1)) || is_undefined(variable_struct_get(variable_struct_get(mitem, arg1), arg2)))
                {
                    continue;
                }
                sum += variable_struct_get(variable_struct_get(mitem, arg1), arg2);
            }
        }
    }
    else if (is_array(arg0))
    {
        if (is_empty(arg1) && is_empty(arg2))
        {
            var __array = arg0;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                sum += mitem;
            }
        }
        else
        {
            var __array = arg0;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                if (is_undefined(variable_struct_get(mitem, arg1)) || is_undefined(variable_struct_get(variable_struct_get(mitem, arg1), arg2)))
                {
                    continue;
                }
                sum += variable_struct_get(variable_struct_get(mitem, arg1), arg2);
            }
        }
    }
    else
    {
        sum += arg0;
    }
    return sum;
}
