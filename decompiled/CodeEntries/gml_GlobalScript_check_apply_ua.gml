function check_apply_ua(arg0, arg1, arg2 = false, arg3 = undefined, arg4 = undefined, arg5 = undefined)
{
    var __benchmark_t;
    if (!is_undefined(arg5))
    {
        log("UA performance", arg5);
        __benchmark_t = current_time;
    }
    if (is_undefined(arg3))
    {
        arg3 = function(arg0, arg1, arg2)
        {
            apply_upgrade_attributes(arg0, arg1, arg2);
        };
    }
    var upgrade_section = variable_struct_get(global.upgrade_sections, arg1);
    if (variable_struct_get(global.upgrade_sections_cache_refresh, arg1))
    {
        log("refresh ua cache", arg1);
        if (is_struct(arg0))
        {
            var __struct = arg0;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                if (arg2 && is_struct(mitem))
                {
                    var __struct2 = mitem;
                    var __prop_names2 = struct_get_names(__struct2);
                    var __prop_len2 = array_length(__prop_names2);
                    for (var __i2 = 0; __i2 < __prop_len2; __i2++)
                    {
                        var mkey2 = __prop_names2[__i2];
                        var mitem2 = variable_struct_get(__struct2, mkey2);
                        if (!is_undefined(arg4) && !arg4(mitem2))
                        {
                            continue;
                        }
                        arg3(mitem2, false, upgrade_section);
                    }
                }
                else if (!is_undefined(arg4) && !arg4(mitem))
                {
                }
                else
                {
                    arg3(mitem, false, upgrade_section);
                }
            }
        }
        else if (is_array(arg0))
        {
            var __array = arg0;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                if (arg2 && is_struct(mitem))
                {
                    var __struct2 = mitem;
                    var __prop_names2 = struct_get_names(__struct2);
                    var __prop_len2 = array_length(__prop_names2);
                    for (var __i2 = 0; __i2 < __prop_len2; __i2++)
                    {
                        var mkey2 = __prop_names2[__i2];
                        var mitem2 = variable_struct_get(__struct2, mkey2);
                        if (!is_undefined(arg4) && !arg4(mitem2))
                        {
                            continue;
                        }
                        arg3(mitem2, false, upgrade_section);
                    }
                }
                else if (!is_undefined(arg4) && !arg4(mitem))
                {
                }
                else
                {
                    arg3(mitem, false, upgrade_section);
                }
            }
        }
        variable_struct_set(global.upgrade_sections_cache, arg1, variable_struct_get(global.upgrade_sections_values, arg1));
        variable_struct_set(global.upgrade_sections_cache_refresh, arg1, false);
    }
    else
    {
        apply_upgrade_attributes_cache(variable_struct_get(global.upgrade_sections_cache, arg1));
    }
    if (!is_undefined(arg5))
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
    }
}
