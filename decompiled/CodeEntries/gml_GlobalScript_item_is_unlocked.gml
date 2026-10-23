function item_is_unlocked(arg0)
{
    if (is_struct(arg0))
    {
        if (!is_undefined(struct_get_from_hash(arg0, variable_get_hash("unlocked"))))
        {
            return get_value_ext(arg0, arg0.unlocked);
        }
        if (!is_undefined(struct_get_from_hash(arg0, variable_get_hash("data"))))
        {
            return get_default_struct_value(arg0.data, "unlocked", false);
        }
    }
    return arg0;
}

function reset_count(arg0, arg1 = 0)
{
    if (is_struct(arg0))
    {
        var __struct = arg0;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            mitem.data.count = arg1;
        }
    }
    else if (is_array(arg0))
    {
        var __array = arg0;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            mitem.data.count = arg1;
        }
    }
}

function reset_count_max(arg0, arg1 = 0)
{
    if (is_struct(arg0))
    {
        var __struct = arg0;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            mitem.data.count = max(0, min(mitem.data.count, arg1));
        }
    }
    else if (is_array(arg0))
    {
        var __array = arg0;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            mitem.data.count = max(0, min(mitem.data.count, arg1));
        }
    }
}

function reset_level_max(arg0, arg1 = 1)
{
    if (is_struct(arg0))
    {
        var __struct = arg0;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            mitem.data.level = max(1, min(mitem.data.level, arg1));
        }
    }
    else if (is_array(arg0))
    {
        var __array = arg0;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            mitem.data.level = max(1, min(mitem.data.level, arg1));
        }
    }
}
