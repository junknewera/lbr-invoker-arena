function tower_advance_floor(arg0 = 1)
{
    var next_floor = global.current_tower_floor + arg0;
    var skip_tower_floors = round(multi_chance(get_tower_floor_skip_chance() * 100, 0, 100));
    if (skip_tower_floors > 0)
    {
        var can_skip_boss = get_upgrade_count(global.shops.gems.skip_tower_floor_bosses) > 0 && global.shops.gems.skip_tower_floor_bosses.data.toggle;
        var next_boss_floor = ceil(next_floor / 10) * 10;
        var next_floor_tmp = next_floor + skip_tower_floors;
        if (!can_skip_boss && next_floor_tmp > next_boss_floor)
        {
            skip_tower_floors = max(0, next_boss_floor - next_floor);
        }
        next_floor += skip_tower_floors;
        o_game.area.data.floors_skipped += skip_tower_floors;
    }
    tower_set_floor(next_floor);
    check_milestones();
}
