function get_merge_leaves_in_range(arg0, arg1)
{
    if (!is_struct(arg0))
    {
        exit;
    }
    var instances_merge = [];
    var from_array_length = array_length(arg1.from);
    for (var i = 0; i < from_array_length; i++)
    {
        var res_key = @@array_get@@(arg1.from, i).resource.key;
        if (is_undefined(res_key))
        {
            return false;
        }
        if (is_undefined(variable_struct_get(arg0, res_key)))
        {
            return false;
        }
        var from_res_count = get_leaf_merge_count(arg1, res_key);
        if (array_length(variable_struct_get(arg0, res_key)) < from_res_count)
        {
            return false;
        }
        for (var r = 0; r < from_res_count; r++)
        {
            array_push(instances_merge, @@array_get@@(variable_struct_get(arg0, res_key), r));
        }
    }
    return instances_merge;
}
