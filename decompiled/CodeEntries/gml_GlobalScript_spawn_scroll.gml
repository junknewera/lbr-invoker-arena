function spawn_scroll(arg0, arg1 = undefined, arg2 = undefined)
{
    arg1 = is_undefined(arg1) ? random_range(20, room_width - 20) : arg1;
    arg2 = is_undefined(arg2) ? random_range(20, room_height - 20) : arg2;
    var o = instance_create_layer(arg1, arg2, global.layers.equipment, o_scroll);
    o.item = arg0;
    with (o)
    {
        init();
    }
    return o;
}
