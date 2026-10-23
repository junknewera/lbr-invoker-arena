function can_spawn_enemy()
{
    var max_enemies = o_game.area.max_enemies;
    return instance_number(o_enemy) < max_enemies;
}
