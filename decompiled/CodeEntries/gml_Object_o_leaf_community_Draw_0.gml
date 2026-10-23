image_draw_xscale = image_xscale * base_scale;
image_draw_yscale = image_yscale * base_scale;
gpu_set_fog(true, c_blue, 0, 1);
draw_sprite_contain(sprite_index, image_index, x, y, 58, image_angle, 16777215, image_alpha);
gpu_set_fog(0, c_black, 0, 0);
draw_sprite_contain(sprite_index, image_index, x, y, 48, image_angle, 16777215, image_alpha);
