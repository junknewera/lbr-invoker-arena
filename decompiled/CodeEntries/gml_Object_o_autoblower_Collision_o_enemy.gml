if (state == UnknownEnum.Value_2 || state == UnknownEnum.Value_5)
{
    exit;
}
if (!can_bump_enemies)
{
    exit;
}
var inst = instance_exists(other) ? other.enemy : undefined;
enemy_damage = get_alb_enemy_damage(inst);
knockback_dir = point_direction(other.x, other.y, x, y);
knockback_power = 6;
set_unit_state(UnknownEnum.Value_5);
hit_enemy(other, enemy_damage);

enum UnknownEnum
{
    Value_2 = 2,
    Value_5 = 5
}
