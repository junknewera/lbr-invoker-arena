function build_current_resource_count()
{
}

function build_current_resource_count_from_array_keys(arg0)
{
    var res = 
    {
        materials: {},
        resources: {}
    };
    var __array = arg0;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        var loop_res = get_resource(mitem);
        if (!loop_res)
        {
            continue;
        }
        var res_type = get_resource_type(mitem);
        variable_struct_set(variable_struct_get(res, res_type), loop_res.key, loop_res.data.count);
    }
    return res;
}
