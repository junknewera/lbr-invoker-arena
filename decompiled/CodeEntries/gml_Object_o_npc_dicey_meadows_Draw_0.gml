event_inherited();
set_default_font(f_game_small, 1);
draw_text(x, y - (sprite_height / 2) - 40, sprintf("%s/%s", floor(charges), max_charges));
var time_left = secr(drop_delay) - (sec(o_game.data.stats.time_elapsed - o_game.data.dice.drop_timer) / drop_delay);
var time_left_f = format_time(time_left, false, true);
if (charges >= max_charges)
{
    time_left_f = "-";
}
draw_text(x, y + (sprite_height / 2) + 10, time_left_f);
