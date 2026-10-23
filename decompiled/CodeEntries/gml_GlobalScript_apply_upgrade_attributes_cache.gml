function apply_upgrade_attributes_cache(arg0)
{
    if (!is_struct(arg0))
    {
        exit;
    }
    var __struct = arg0;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        var _upgrade_value = mitem;
        var _upgrade_key = mkey;
        if (is_struct(_upgrade_value) && !is_method(_upgrade_value))
        {
            var __struct2 = _upgrade_value;
            var __prop_names2 = struct_get_names(__struct2);
            var __prop_len2 = array_length(__prop_names2);
            for (var __i2 = 0; __i2 < __prop_len2; __i2++)
            {
                var mkey2 = __prop_names2[__i2];
                var mitem2 = variable_struct_get(__struct2, mkey2);
                var _upgrade_res_value = mitem2;
                var _upgrade_res_key = mkey2;
                if (is_undefined(variable_struct_get(global.upgrade_attributes, _upgrade_key)))
                {
                    continue;
                }
                if (!is_numeric(_upgrade_res_value))
                {
                    continue;
                }
                variable_struct_set(variable_struct_get(global.upgrade_attributes, _upgrade_key), _upgrade_res_key, variable_struct_get(variable_struct_get(global.upgrade_attributes, _upgrade_key), _upgrade_res_key) + _upgrade_res_value);
            }
        }
        else if (is_undefined(variable_struct_get(global.upgrade_attributes, _upgrade_key)))
        {
        }
        else if (!is_numeric(_upgrade_value))
        {
        }
        else
        {
            variable_struct_set(global.upgrade_attributes, _upgrade_key, variable_struct_get(global.upgrade_attributes, _upgrade_key) + _upgrade_value);
        }
    }
}
