collisions++;
if (other.type.is_gem_leaf || !other.can_damage_enemy)
{
    exit;
}
var damage = get_blower_enemy_damage(other.armor, 1, enemy);
hit_enemy(self, damage);
destroy_leaf(other.id);
