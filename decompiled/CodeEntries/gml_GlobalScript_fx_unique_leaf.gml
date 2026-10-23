function fx_unique_leaf(arg0)
{
    var o = instance_create_layer(room_width / 2, room_height / 2, global.layers.fx, o_fx_portal_sprite);
    with (o)
    {
        part_type_sprite(part_particle, spr_leaf, 0, false, 1);
        part_type_size(part_particle, 0.04, 3, 0, 0);
        part_type_scale(part_particle, 1, 1);
        part_type_color_mix(part_particle, 3631920, 7763323);
        part_type_alpha3(part_particle, 0.08, 0.1, 0.2);
        part_type_speed(part_particle, 0, 5, 0, 0);
        part_type_direction(part_particle, 0, 360, 0, 0);
        part_type_gravity(part_particle, 0, 126);
        part_type_orientation(part_particle, 180, 180, 1, 0, 1);
        part_type_blend(part_particle, 1);
        part_type_life(part_particle, 434, 500);
        fade = true;
        is_stream = true;
        part_number = 3;
        o.sprite_index = arg0.sprite;
        o.image_xscale = 2;
        o.image_yscale = 2;
        var lifetime = sec(6);
        init(lifetime);
    }
}
