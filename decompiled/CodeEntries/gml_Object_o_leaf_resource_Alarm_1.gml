event_inherited();
if (!can_merge)
{
    exit;
}
if (!type.merge_check_active)
{
    exit;
}
alarm[1] = merge_check_delay;
if (merge_check_timeout)
{
    alarm[2] = sec(0.5);
    exit;
}
instances_in_range = get_leaves_in_range(o_game.leaf_merge_range);
if (!is_struct(instances_in_range))
{
    exit;
}
var __struct = global.leaf_merge;
var __prop_names = struct_get_names(__struct);
var __prop_len = array_length(__prop_names);
for (var __i = 0; __i < __prop_len; __i++)
{
    var mkey = __prop_names[__i];
    var mitem = variable_struct_get(__struct, mkey);
    if (!is_struct(mitem))
    {
        continue;
    }
    var res_to_locked = _any(mitem.to, function(arg0)
    {
        return !arg0.resource.data.unlocked;
    });
    if (res_to_locked)
    {
        continue;
    }
    var merge_result = get_merge_leaves_in_range(instances_in_range, mitem);
    if (!is_array(merge_result))
    {
        continue;
    }
    var instances_length = array_length(merge_result);
    for (var i = 0; i < instances_length; i++)
    {
        destroy_leaf(merge_result[i]);
    }
    destroy_leaf();
    var __array2 = mitem.to;
    var __prop_len2 = array_length(__array2);
    for (var __i2 = 0; __i2 < __prop_len2; __i2++)
    {
        var mitem2 = __array2[__i2];
        var row_count = mitem2.count + global.upgrade_attributes.leaf_merge_count_add;
        repeat (row_count)
        {
            create_leaf(x, y, mitem2.resource);
        }
    }
}
