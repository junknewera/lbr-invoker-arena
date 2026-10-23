function fx_blow(arg0, arg1)
{
    var o = instance_create_layer(arg0, arg1, global.layers.fx, o_fx_particle);
    with (o)
    {
        part_type_shape(part_particle, 2);
        part_type_size(part_particle, o_blower.blower.damage / 10, o_blower.blower.damage / 10, -0.03, 0);
        part_type_scale(part_particle, 0.075, 0.075);
        part_type_color_mix(part_particle, 16645631, 11842740);
        part_type_alpha3(part_particle, 0.18, 0.44, 0.69);
        part_type_speed(part_particle, 0.01, o_blower.blower.damage * 10, 0.25, 0.01);
        part_type_direction(part_particle, o_blower.image_angle, o_blower.image_angle, 0, 0);
        part_type_gravity(part_particle, 0, 90);
        part_type_orientation(part_particle, 0, 360, -1, 0, 1);
        part_type_blend(part_particle, 1);
        part_type_life(part_particle, 0, 180);
        part_number = o_blower.blower.damage * 4;
        init(sec(0.5));
    }
}
