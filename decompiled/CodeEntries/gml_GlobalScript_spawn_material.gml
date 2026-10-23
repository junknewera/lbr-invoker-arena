function spawn_material(arg0, arg1 = undefined, arg2 = undefined)
{
    arg1 = is_undefined(arg1) ? random_range(50, room_width - 50) : arg1;
    arg2 = is_undefined(arg2) ? random_range(50, room_height - 50) : arg2;
    var o = instance_create_layer(arg1, arg2, global.layers.equipment, o_material);
    o.item = arg0;
    o.sprite_index = arg0.sprite;
    with (o)
    {
        init();
    }
    return o;
}
