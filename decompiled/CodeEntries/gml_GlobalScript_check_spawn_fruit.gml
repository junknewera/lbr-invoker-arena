function check_spawn_fruit()
{
    if (o_game.data.stats.time_elapsed < sec(60))
    {
        exit;
    }
    if (array_length(o_game.area.resources) == 0)
    {
        exit;
    }
    var max_fruits_spawned = 5;
    max_fruits_spawned += max(0, floor((get_upgrade_count(global.shops.coins.fruit_spawn_chance_multi) - 100) / 50));
    var n = min(max_fruits_spawned, multi_chance(global.upgrade_attributes.fruit_spawn_chance_multi, 0) + 1);
    var r = random(100);
    if (r < (3 + (global.upgrade_attributes.fruit_spawn_chance * 0.5)))
    {
        for (var i = 0; i < n; i++)
        {
            spawn_fruit();
        }
    }
}
