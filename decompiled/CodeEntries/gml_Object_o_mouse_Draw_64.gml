var _image_index = image_index;
if (sprite_image_index != -1)
{
    _image_index = sprite_image_index;
}
draw_sprite_ext(sprite_index, _image_index, x + 1, y + 2, scale, scale, 0, c_black, 0.2);
draw_sprite_ext(sprite_index, _image_index, x, y, scale, scale, 0, c_white, 1);
