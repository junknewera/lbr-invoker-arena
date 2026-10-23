var img_index = build_data.img_index;
if (item.sprite_animated)
{
    img_index = image_index;
}
draw_sprite_ext(sprite_index, img_index, x, y, item.scale, item.scale, 0, c_white, 1);
