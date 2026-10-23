function spawn_random_tower_enemy()
{
    if (global.current_tower_enemies_floor != global.current_tower_floor)
    {
        global.current_tower_enemies = [];
        var __array = global.enemies_tower;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (global.current_tower_floor >= mitem.tower_level_range[0] && global.current_tower_floor <= mitem.tower_level_range[1])
            {
                array_push(global.current_tower_enemies, mitem);
            }
        }
        global.current_tower_enemies_floor = global.current_tower_floor;
    }
    var enemy_array = global.current_tower_enemies;
    if (array_length(global.current_tower_enemies) == 0)
    {
        enemy_array = global.enemies_tower_mobs;
        if ((global.current_tower_floor % 10) == 0)
        {
            enemy_array = global.enemies_tower_bosses;
        }
    }
    var enemy = array_random_item(enemy_array);
    if (!is_struct(enemy))
    {
        exit;
    }
    if (enemy.is_boss && instance_number(o_enemy_boss) > 0)
    {
        exit;
    }
    if (!enemy.is_boss && (global.current_tower_floor % 10) == 0)
    {
        exit;
    }
    spawn_enemy(enemy);
}
