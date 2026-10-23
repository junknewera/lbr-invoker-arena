function spawn_random_comm_leaf(arg0 = undefined, arg1 = undefined)
{
    var available_items = array_filter_custom(global.community_leaves_array, "can_spawn");
    if (array_length(available_items) == 0)
    {
        exit;
    }
    return spawn_comm_leaf(array_random_item(available_items));
}
