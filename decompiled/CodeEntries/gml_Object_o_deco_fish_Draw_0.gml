event_inherited();
scale_x = (cardinal_direction(direction, true) == UnknownEnum.Value_2) ? -1 : 1;
scale_x_final = lerp(scale_x_final, scale_x, 0.1);
draw_sprite_ext(sprite_index, image_index, x, y + (sin(t / 30) * 3), scale_x_final, scale_y, 0, c_black, alpha);

enum UnknownEnum
{
    Value_2 = 2
}
