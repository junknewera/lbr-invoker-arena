if (!instance_exists(o_blower) || is_dialog_visible())
{
    exit;
}
if (!o_blower.blower.can_damage_enemy)
{
    exit;
}
if (distance_to_object(o_blower) > 48)
{
    exit;
}
if (bouncing)
{
    exit;
}
bouncing = true;
direction = point_direction(o_blower.x, o_blower.y, x, y);
speed = 10;
alarm[1] = sec(1.5);
o_game.data.stats.borb_slapped++;
