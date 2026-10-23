function get_bm_value(arg0 = 1, arg1 = undefined, arg2 = undefined, arg3 = undefined, arg4 = false, arg5 = 1)
{
    var base_add_value = 0;
    if (is_string(arg1))
    {
        base_add_value = variable_struct_get(global.upgrade_attributes, arg1);
    }
    var multiplier_value = 1;
    if (is_string(arg2))
    {
        multiplier_value *= (1 + (variable_struct_get(global.upgrade_attributes, arg2) * arg5));
        if (arg4)
        {
            var __array = global.upgrade_sections_upgrades;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                var ua_key = sprintf("%s_%s", arg2, mitem);
                var ua_value = variable_struct_get(global.upgrade_attributes, ua_key);
                if (is_numeric(ua_value))
                {
                    ua_value *= arg5;
                    multiplier_value *= (1 + ua_value);
                }
            }
        }
    }
    else
    {
        base_add_value *= arg5;
    }
    var final_value = (arg0 + base_add_value) * multiplier_value;
    if (!is_undefined(arg3))
    {
        final_value = arg3(final_value);
    }
    return final_value;
}

function get_bm_value2(arg0 = 1, arg1 = undefined, arg2 = undefined, arg3 = undefined, arg4 = false, arg5 = 1)
{
    var base_add_value = 0;
    if (is_string(arg1))
    {
        base_add_value = variable_struct_get(global.upgrade_attributes, arg1);
    }
    var multiplier_value = 1;
    if (is_string(arg2))
    {
        multiplier_value *= (1 + (variable_struct_get(global.upgrade_attributes, arg2) * arg5));
        if (arg4)
        {
            var __array = global.upgrade_sections_upgrades;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                var ua_key = sprintf("%s_%s", arg2, mitem);
                var ua_value = variable_struct_get(global.upgrade_attributes, ua_key);
                if (is_numeric(ua_value))
                {
                    ua_value *= arg5;
                    multiplier_value *= (1 + ua_value);
                }
            }
        }
    }
    else
    {
        base_add_value *= arg5;
    }
    var final_value = (arg0 + base_add_value) * max(1, multiplier_value);
    if (!is_undefined(arg3))
    {
        final_value = arg3(final_value);
    }
    return final_value;
}
