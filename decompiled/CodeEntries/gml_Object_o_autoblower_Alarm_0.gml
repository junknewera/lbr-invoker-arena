alarm[0] = chase_enemy_timer;
check_draw();
if (!chase_enemy || !instance_exists(o_enemy))
{
    exit;
}
var enemy = instance_nearest(x, y, o_enemy);
direction = point_direction(x, y, enemy.x, enemy.y);
