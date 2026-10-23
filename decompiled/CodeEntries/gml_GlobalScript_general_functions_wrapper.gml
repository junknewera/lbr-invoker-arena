function _any(arg0, arg1, arg2 = undefined)
{
    if (is_array(arg0))
    {
        var __array = arg0;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (arg1(mitem, __i, arg2))
            {
                return true;
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
            if (arg1(mitem, __i, arg2))
            {
                return true;
            }
        }
    }
    return false;
}

function pluck(arg0, arg1 = "key", arg2 = undefined)
{
    if (is_undefined(arg0) || is_undefined(arg1) || is_empty(arg1))
    {
        exit;
    }
    var arr = [];
    if (is_struct(arg0))
    {
        var __struct = arg0;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            if (!is_struct(mitem))
            {
                continue;
            }
            if (is_undefined(variable_struct_get(mitem, arg1)))
            {
                continue;
            }
            var value = get_value_ext(mitem, variable_struct_get(mitem, arg1));
            array_push(arr, value);
        }
    }
    else if (is_array(arg0))
    {
        var __array = arg0;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (!is_struct(mitem))
            {
                continue;
            }
            if (is_undefined(variable_struct_get(mitem, arg1)))
            {
                continue;
            }
            var value = get_value_ext(mitem, variable_struct_get(mitem, arg1));
            array_push(arr, value);
        }
    }
    else
    {
        log("=== INVALID PLUCK TYPE ===");
    }
    return arr;
}

function pluck_data(arg0, arg1 = "key")
{
    if (is_undefined(arg0) || is_undefined(arg1) || is_empty(arg1))
    {
        exit;
    }
    var arr = [];
    if (is_struct(arg0))
    {
        var __struct = arg0;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            if (!is_struct(mitem))
            {
                continue;
            }
            if (!is_struct(struct_get_from_hash(mitem, variable_get_hash("data"))))
            {
                continue;
            }
            var value = variable_struct_get(mitem.data, arg1);
            array_push(arr, value);
        }
    }
    else if (is_array(arg0))
    {
        var __array = arg0;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (!is_struct(mitem))
            {
                continue;
            }
            if (!is_struct(struct_get_from_hash(mitem, variable_get_hash("data"))))
            {
                continue;
            }
            var value = variable_struct_get(mitem.data, arg1);
            array_push(arr, value);
        }
    }
    else
    {
        log("=== INVALID PLUCK TYPE ===");
    }
    return arr;
}

function pluck_implode(arg0, arg1, arg2 = ", ", arg3 = false, arg4 = undefined, arg5 = "", arg6 = "", arg7 = "")
{
    return implode(arg2, pluck(arg0, arg1), arg3, arg4, arg5, arg6, arg7);
}

function pluck_set_result(arg0, arg1)
{
    if (!is_struct(arg0))
    {
        exit;
    }
    var items = {};
    var __struct = arg0;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(items, mkey, arg1);
    }
    return items;
}
