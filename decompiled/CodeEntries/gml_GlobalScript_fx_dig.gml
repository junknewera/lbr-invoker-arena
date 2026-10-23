function fx_dig()
{
    if (!instance_exists(o_blower))
    {
        exit;
    }
    if (instance_number(o_fx_particle_dirt) > 10)
    {
        exit;
    }
    var o = instance_create_layer(o_blower.x, o_blower.y, global.layers.above_ground, o_fx_particle_dirt);
    with (o)
    {
        part_type_speed(part_particle, 9, 15, random_range(-0.9, -0.7), 0);
        part_type_direction(part_particle, 0, 360, 0, 0);
        part_type_gravity(part_particle, 0, 0);
        part_type_orientation(part_particle, 0, 360, 0, 0, 0);
        part_type_size(part_particle, 0.1, 0.3, 0, 0);
        part_type_scale(part_particle, 1, 1);
        part_type_life(part_particle, sec(1.5), sec(2));
        part_type_blend(part_particle, false);
        part_type_color1(part_particle, 1715301);
        part_type_alpha1(part_particle, 0.77);
        part_type_shape(part_particle, 2);
        is_stream = false;
        part_number = irandom_range(20, 30);
        var lifetime = sec(3);
        init(lifetime);
    }
}
