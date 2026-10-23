function is_tower_boss_floor(arg0)
{
    var next_boss_floor = ceil(arg0 / 10) * 10;
    return arg0 == next_boss_floor;
}
