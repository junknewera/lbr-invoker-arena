restrict_position_to_room();
var c_dir = cardinal_direction(direction);
if (c_dir == UnknownEnum.Value_2 || c_dir == UnknownEnum.Value_1)
{
    image_xscale = lerp(image_xscale, base_scale_x, 0.1);
}
else
{
    image_xscale = lerp(image_xscale, -base_scale_x, 0.1);
}
if (distance_to_point(target_x, target_y) < 96)
{
    speed = lerp(speed, 0, 0.15);
}
else
{
    move_towards_point(target_x, target_y, movespeed);
}
image_speed = clamp(speed / 4, 0, 5);

enum UnknownEnum
{
    Value_1 = 1,
    Value_2
}
