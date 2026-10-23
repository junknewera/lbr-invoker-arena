function spawn_fruit(arg0 = undefined, arg1 = undefined)
{
    if (!can_spawn_fruit())
    {
        exit;
    }
    var available_fruits = [];
    _map(global.upgrade_attributes.fruit_unlocked, function(arg0, arg1, arg2, arg3)
    {
        if (!arg0 || !resource_is_unlocked(arg1))
        {
            exit;
        }
        array_push(arg3, variable_struct_get(global.resources, arg1));
    }, available_fruits);
    if (!is_array(available_fruits) || array_length(available_fruits) == 0)
    {
        exit;
    }
    var fruit_resource = array_random_item(available_fruits);
    arg0 = is_undefined(arg0) ? random_range(20, room_width - 20) : arg0;
    arg1 = is_undefined(arg1) ? random_range(20, room_height - 20) : arg1;
    var o = instance_create_layer(arg0, arg1, global.layers.fruits, o_fruit);
    o.resource = fruit_resource;
    with (o)
    {
        init();
    }
    return o;
}
