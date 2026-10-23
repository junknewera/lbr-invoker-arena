function fx_black_leaf_hole()
{
    var o = instance_create_layer(room_width / 2, room_height / 2, global.layers.fx, o_fx_particle);
    var _bg_color = 0;
    var _sprite = spr_resource_shards;
    var _part_number = 10;
    with (o)
    {
        part_type_sprite(part_particle, _sprite, 0, false, 1);
        part_type_size(part_particle, 0.04, 3, 0, 0);
        part_type_scale(part_particle, 1, 1);
        part_type_color_mix(part_particle, 3631920, 7763323);
        part_type_alpha3(part_particle, 0.08, 0.29, 0.41);
        part_type_speed(part_particle, 0, 4, 0, 0);
        part_type_direction(part_particle, 0, 360, 0, 0);
        part_type_gravity(part_particle, 0, 126);
        part_type_orientation(part_particle, 180, 180, 1, 0, 1);
        part_type_blend(part_particle, 1);
        part_type_life(part_particle, 434, 500);
        bg_color = _bg_color;
        fade = true;
        is_stream = true;
        part_number = _part_number;
        var lifetime = sec(5);
        init(lifetime);
        
        destroy_func = function()
        {
            global.draw_hud = true;
        };
    }
}
