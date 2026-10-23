function spawn_comm_leaf(arg0, arg1 = undefined, arg2 = undefined)
{
    arg1 = is_undefined(arg1) ? random_range(20, room_width - 20) : arg1;
    arg2 = is_undefined(arg2) ? random_range(20, room_height - 20) : arg2;
    var o = instance_create_layer(arg1, arg2, global.layers.leaves, o_leaf_community);
    o.community_leaf = arg0;
    o.sprite_index = arg0.sprite;
    with (o)
    {
        init();
    }
    return o;
}
