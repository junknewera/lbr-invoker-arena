function fx_slap(arg0 = x, arg1 = y, arg2 = false)
{
    if (!instance_exists(o_blower))
    {
        exit;
    }
    if (instance_number(o_fx_particle_slap) > 20)
    {
        exit;
    }
    var o = instance_create_layer(arg0, arg1, global.layers.above_ground, o_fx_particle_slap);
    var part_color = arg2 ? 255 : 16777215;
    with (o)
    {
        part_type_speed(part_particle, 9, 15, 0, 0);
        part_type_direction(part_particle, 0, 360, 0, 0);
        part_type_gravity(part_particle, 0, 0);
        part_type_orientation(part_particle, 0, 360, 0, 0, 0);
        part_type_size(part_particle, 0.05, 0.15, 0, 0);
        part_type_scale(part_particle, 1, 1);
        part_type_life(part_particle, sec(1.5), sec(2));
        part_type_blend(part_particle, false);
        part_type_color1(part_particle, part_color);
        part_type_alpha1(part_particle, 0.77);
        part_type_shape(part_particle, 2);
        is_stream = false;
        part_number = irandom_range(20, 30);
        var lifetime = sec(3);
        init(lifetime);
    }
}
