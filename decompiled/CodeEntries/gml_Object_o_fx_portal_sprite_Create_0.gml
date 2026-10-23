alpha = 1;
alpha_target = 1;
sys_particle = part_system_create();
part_particle = part_type_create();
part_number = irandom_range(20, 40);
fade = false;
is_stream = true;

init = function(arg0)
{
    alarm[0] = arg0;
    emit_particle = part_emitter_create(sys_particle);
    part_emitter_region(sys_particle, emit_particle, x - 0, x + 0, y - 0, y + 0, 1, 1);
    if (is_stream)
    {
        part_emitter_stream(sys_particle, emit_particle, part_particle, part_number);
        part_system_depth(sys_particle, -1);
    }
    else
    {
        part_emitter_burst(sys_particle, emit_particle, part_particle, part_number);
    }
    if (fade)
    {
        global.draw_hud = false;
        alpha = 0;
        alpha_target = 1;
    }
    var o = instance_create_layer(room_width / 2, room_height / 2, global.layers.fx_sprite, o_fx_sprite);
    o.instance = id;
    o.sprite_index = sprite_index;
    o.image_xscale = image_xscale;
    o.image_yscale = image_yscale;
};
