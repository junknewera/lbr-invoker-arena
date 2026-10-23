function has_enough(arg0, arg1 = 1)
{
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("resources"))) && !has_enough_resources(arg0.resources, undefined, arg1))
    {
        return false;
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("leafscended_leaves"))) && !has_enough_leafscended_leaves(arg0.leafscended_leaves, arg1))
    {
        return false;
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("materials"))) && !has_enough_materials(arg0.materials, arg1))
    {
        return false;
    }
    return true;
}

function get_max_result_count(arg0, arg1 = __void)
{
    if (!is_struct(arg0))
    {
        return 0;
    }
    var max_count = global.max_num;
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("materials"))))
    {
        var __struct = arg0.materials;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var material = variable_struct_get(global.materials, mkey);
            if (!is_struct(material))
            {
                return 0;
            }
            max_count = min(max_count, arg1(divide_safe(material.data.count, mitem)));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("resources"))))
    {
        var __struct = arg0.resources;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var resource = variable_struct_get(global.resources, mkey);
            if (!is_struct(resource))
            {
                return 0;
            }
            max_count = min(max_count, arg1(divide_safe(resource.data.count, mitem)));
        }
    }
    return max_count;
}
