function get_leaf_merge_count(arg0, arg1)
{
    var merge_count = variable_struct_get(arg0.from_keys, arg1).count;
    merge_count -= variable_struct_get(global.upgrade_attributes.merge_count_resources, arg1);
    merge_count -= global.upgrade_attributes.merge_count_global;
    merge_count = max(1, merge_count);
    return merge_count;
}
