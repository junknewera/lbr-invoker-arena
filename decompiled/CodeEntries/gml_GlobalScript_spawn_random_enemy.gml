function spawn_random_enemy()
{
    var enemy = array_random_item(global.enemies_sorted);
    spawn_enemy(enemy);
}
