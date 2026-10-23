if (!surface_exists(surface))
{
    surface = surface_create(global.gui_width, global.gui_height);
    refresh_surface = true;
}
set_default_font(f_game_small, 1);
var max_charges = global.season_pass.nature.get_max_vial_charges();
draw_text(x, y - (sprite_height / 2) - 40, sprintf("%s/%s", o_game.data.nature_season.vial_charges, max_charges));
var progress_bar_amount = o_game.data.nature_season.vial_timer * 100;
draw_healthbar(x - (sprite_width / 2), y - (sprite_height / 2) - 15, x + (sprite_width / 2), y - (sprite_height / 2) - 12, progress_bar_amount, c_white, c_blue, c_blue, 0, true, false);
draw_self();
var time_left = (1 - o_game.data.nature_season.vial_timer) / global.season_pass.nature.get_vial_progress_value();
var time_left_f = format_time(time_left, false, true);
if (o_game.data.nature_season.vial_charges >= max_charges)
{
    time_left_f = "-";
}
draw_text(x, y + (sprite_height / 2) + 10, time_left_f);
surface_set_target(surface);
if (refresh_surface)
{
    draw_clear_alpha(c_black, 0);
    var __array = plants;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        draw_sprite_ext(mitem.item.sprite, -1, mitem.x, mitem.y, mitem.scale, mitem.scale, mitem.rot, c_white, 1);
    }
}
surface_reset_target();
draw_surface_ext(surface, 0, 0, 1, 1, 0, c_white, 1);
refresh_surface = false;
