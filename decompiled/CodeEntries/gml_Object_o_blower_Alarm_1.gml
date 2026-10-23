can_draw_hp = get_upgrade_count(global.areas.volcano) > 0;
can_draw_weapon = get_option(global.options.draw_weapon);
if (instance_exists(o_game))
{
    o_game.data.stats.walked += walked;
}
alarm[1] = sec(0.5);
