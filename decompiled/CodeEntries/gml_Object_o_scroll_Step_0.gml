bounce_room_edges();
if (player_has_magnet)
{
    direction = point_direction(x, y, o_blower.x, o_blower.y);
    target_speed = 1;
}
var angle_sign = (direction >= 90 && direction < 270) ? 1 : -1;
angle += (speed * angle_sign);
image_angle = lerp(image_angle, angle, 0.05);
image_xscale = lerp(image_xscale, scale, 0.1);
image_yscale = lerp(image_yscale, scale, 0.1);
speed = lerp(speed, target_speed, 0.03);
