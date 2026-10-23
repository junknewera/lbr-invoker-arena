x = lerp(x, target_x, 0.03);
y = lerp(y, target_y, 0.03);
_speed = abs(target_x - x) + abs(target_y - y);
image_angle = lerp(image_angle, target_rotation, 0.03);
image_alpha = lerp(image_alpha, 1, 0.1);
image_xscale = lerp(image_xscale, target_xscale, 0.1);
image_yscale = lerp(image_yscale, target_yscale, 0.1);
if (instance_exists(o_intro_autoblower) && distance_to_object(o_intro_autoblower) < (o_intro_autoblower.size * 8))
{
    var blower = instance_nearest(x, y, o_intro_autoblower);
    var dir = point_direction(blower.x, blower.y, x, y);
    target_xscale *= choose(1, -1);
    if (target_xscale == image_xscale)
    {
        target_yscale *= choose(1, -1);
    }
    var damage = 128;
    target_x = x + lengthdir_x(damage, dir);
    target_y = y + lengthdir_y(damage, dir);
    target_rotation += random_range(5, 30);
}
if (x < -8 || x > (room_width - 8) || y < -8 || y > (room_height - 8))
{
    instance_destroy();
}
