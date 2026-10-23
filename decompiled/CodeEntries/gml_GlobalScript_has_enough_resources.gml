function has_enough_materials(arg0, arg1 = 1)
{
    var return_value = false;
    var __struct = arg0;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        var material = variable_struct_get(global.materials, mkey);
        if (is_undefined(material))
        {
            return false;
        }
        if (variable_struct_get(global.materials, mkey).data.count < (mitem * arg1))
        {
            return false;
        }
    }
    return true;
}

function has_enough_materials_single(arg0, arg1)
{
    return arg0.data.count >= arg1;
}

function has_enough_resources(arg0, arg1 = 0, arg2 = 1)
{
    var return_value = false;
    var __struct = arg0;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        var _value = mitem;
        var _key = mkey;
        if (arg1 <= 0)
        {
            if (variable_struct_get(global.resources, _key).data.count < (_value * arg2))
            {
                return false;
            }
        }
        else
        {
            var leafscend_count = floor(get_default_struct_value(variable_struct_get(global.resources, _key).data.leafscend_count, arg1, 0));
            if (leafscend_count < (floor(_value) * arg2))
            {
                return false;
            }
        }
    }
    return true;
}

function has_enough_leafscended_leaves(arg0, arg1 = 1)
{
    var return_value = false;
    var __struct = arg0;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        var resource = variable_struct_get(global.resources, mkey);
        if (!is_struct(resource))
        {
            return false;
        }
        var __struct2 = mitem;
        var __prop_names2 = struct_get_names(__struct2);
        var __prop_len2 = array_length(__prop_names2);
        for (var __i2 = 0; __i2 < __prop_len2; __i2++)
        {
            var mkey2 = __prop_names2[__i2];
            var mitem2 = variable_struct_get(__struct2, mkey2);
            var _value = mitem2;
            var _key = mkey;
            var _level = mkey2;
            var leafscend_count = get_default_struct_value(resource.data.leafscend_count, _level, 0);
            if (leafscend_count < (_value * arg1))
            {
                return false;
            }
        }
    }
    return true;
}

function has_enough_resources_single(arg0, arg1)
{
    return arg0.data.count >= arg1;
}
