function dec_result(arg0, arg1 = 1)
{
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("materials"))))
    {
        dec_materials(arg0.materials, arg1);
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("resources"))))
    {
        dec_resources(arg0.resources, undefined, undefined, undefined, arg1);
    }
}

function dec_materials(arg0, arg1 = 1)
{
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
            continue;
        }
        material.decrease(mitem * arg1);
    }
}

function dec_resources(arg0, arg1 = false, arg2 = false, arg3 = undefined, arg4 = 1)
{
    add_resources(arg0, arg1, true, arg2, undefined, undefined, undefined, arg3, arg4 * -1);
}
