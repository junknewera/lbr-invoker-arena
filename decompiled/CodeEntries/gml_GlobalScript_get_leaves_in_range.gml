function get_leaves_in_range(arg0)
{
    var list = ds_list_create();
    var num = collision_circle_list(x, y, arg0, o_leaf_resource, false, true, list, false);
    if (num == 0)
    {
        ds_list_destroy(list);
        return undefined;
    }
    var instance_types = {};
    for (var i = 0; i < num; i++)
    {
        var leaf = ds_list_find_value(list, i);
        if (!leaf.type.merge_check_passive)
        {
            continue;
        }
        if (!is_array(variable_struct_get(instance_types, leaf.type.key)))
        {
            variable_struct_set(instance_types, leaf.type.key, []);
        }
        array_append(variable_struct_get(instance_types, leaf.type.key), leaf.id);
    }
    ds_list_destroy(list);
    return instance_types;
}
