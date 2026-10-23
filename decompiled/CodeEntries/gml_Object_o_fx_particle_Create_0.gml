alpha = 1;
alpha_target = 1;
bg_color = 0;
is_active = true;
sys_particle = part_system_create();
part_particle = part_type_create();
part_number = irandom_range(20, 40);
fade = false;
is_stream = false;
sprite = spr_solid;

destroy_func = function()
{
};

init = function(arg0)
{
    alarm[0] = arg0;
    emit_particle = part_emitter_create(sys_particle);
    part_emitter_region(sys_particle, emit_particle, x - 0, x + 0, y - 0, y + 0, 1, 1);
    if (is_active)
    {
        if (is_stream)
        {
            part_emitter_stream(sys_particle, emit_particle, part_particle, part_number);
        }
        else
        {
            part_emitter_burst(sys_particle, emit_particle, part_particle, part_number);
        }
    }
    if (fade)
    {
        global.draw_hud = false;
        alpha = 0;
        alpha_target = 1;
    }
};
