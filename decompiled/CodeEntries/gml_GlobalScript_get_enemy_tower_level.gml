function get_enemy_tower_level(arg0)
{
    var level = 1;
    var boss_bonus = (arg0 % 10) == 0;
    var boss_bonus_value = boss_bonus ? max(1.25, arg0 / 20) : 0;
    level = floor(floor(100 + power(250, 1 + (log10(max(0, arg0 - 8)) * 1.25)) + (arg0 * 900)) * (1 + boss_bonus_value));
    return level;
}
