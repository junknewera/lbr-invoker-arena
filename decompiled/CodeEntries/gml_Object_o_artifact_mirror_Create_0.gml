event_inherited();
duration = undefined;
init();
if (instance_exists(o_blower))
{
    sprite_index = o_blower.sprite_index;
    image_xscale = o_blower.image_draw_scale;
    image_yscale = o_blower.image_draw_scale;
    image_alpha = 0.5;
}
