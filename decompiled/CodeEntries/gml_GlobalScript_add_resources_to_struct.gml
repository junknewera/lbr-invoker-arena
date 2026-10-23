function add_resources_to_struct(arg0, arg1, arg2)
{
    if (!is_struct(arg0) || !is_struct(arg1))
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
        var add_value = apply_max_number(mitem);
        if (is_callable(arg2))
        {
            add_value = arg2(add_value);
        }
        if (is_undefined(variable_struct_get(arg1, mkey)))
        {
            variable_struct_set(arg1, mkey, 0);
        }
        variable_struct_set(arg1, mkey, bignum_add_safe(variable_struct_get(arg1, mkey), add_value));
    }
}
