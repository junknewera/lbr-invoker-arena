function spawn_random_area_enemy(arg0 = 1)
{
    if (array_length(o_game.area.enemy) == 0)
    {
        exit;
    }
    repeat (arg0)
    {
        spawn_enemy(array_random_item(o_game.area.enemy));
    }
}
