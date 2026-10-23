if (!can_draw_leaf_flag)
{
    exit;
}
image_draw_xscale = image_xscale * base_scale;
image_draw_yscale = image_yscale * base_scale;
draw_sprite_ext(sprite_index, _image_index, x, y, image_draw_xscale, image_draw_yscale, image_angle, c_white, 1);
