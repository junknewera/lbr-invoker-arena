function check_spawn_borbs()
{
    if (!o_game.area._can_spawn_borbs())
    {
        exit;
    }
    var n = irandom_range(1, 2);
    var r = random(100);
    if (r < 3)
    {
        for (var i = 0; i < n; i++)
        {
            spawn_borb();
        }
    }
}

function spawn_borb(arg0, arg1)
{
    arg0 = is_undefined(arg0) ? random_range(60, room_width - 60) : arg0;
    arg1 = is_undefined(arg1) ? random_range(60, room_height - 60) : arg1;
    var o = instance_create_layer(arg0, arg1, global.layers.borbs, o_borb);
    o.type = global.resources.borbs;
    o.sprite_index = o.type.sprite;
    o.image_index = irandom_range(0, o.image_number - 1);
    with (o)
    {
        init();
    }
    return o;
}
