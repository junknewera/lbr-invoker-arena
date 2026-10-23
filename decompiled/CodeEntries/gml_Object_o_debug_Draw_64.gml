if (variable_global_exists("tmp_sprite") && sprite_exists(global.tmp_sprite))
{
    draw_sprite(global.tmp_sprite, 0, 300, 300);
}
if (!variable_global_exists("cache"))
{
    exit;
}
if (global.pause)
{
    exit;
}
if (portrait)
{
    draw_set_alpha(0.5);
    draw_set_color(c_white);
    draw_line(gui_col_x(10.8), 0, gui_col_x(10.8), global.gui_height);
    draw_line(gui_col_x(21.2), 0, gui_col_x(21.2), global.gui_height);
    draw_set_alpha(1);
}
if (!debug_draw || !global.draw_hud)
{
    exit;
}
var debug_input_prefix = check_input ? "INPUT: " : "";
draw_set_alpha(0.5);
draw_set_color(c_black);
draw_rectangle(0, global.gui_height - 30, global.gui_width, global.gui_height, false);
draw_set_font(f_gui_small);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_set_alpha(1);
draw_set_color(c_white);
draw_text(global.gui_width - 10, global.gui_height + 4, sprintf("%s | dmg=%s/%s | %s%s | %sx%s | xx=%s yy=%s DT=%s | mguix=%s mguiy=%s | mx=%s my=%s mrealx=%s mrealy=%s | fps=%s avg=%s rs=%s | LBR v%s | %s-%s-%s %s:%s | profile: %s", debug_result, number_format(get_blower_enemy_damage(1)), number_format(get_slap_damage()), debug_input_prefix, debug_input, global.gui_width, global.gui_height, global.debug_x, global.debug_y, global.debug_toggle ? 1 : 0, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), mouse_x, mouse_y, o_mouse.x, o_mouse.y, fps, number_format(fps_avg, 2), room_speed, global.game_version, current_year, current_month, current_day, current_hour, current_minute, global.current_profile));
if (instance_exists(o_game))
{
    var pool_size = 0;
    if (instance_exists(o_game))
    {
        var a = ds_list_size(o_game.pool_fx_text_active);
        var b = ds_list_size(o_game.pool_fx_text_inactive);
        pool_size = sprintf("a=%s | i=%s | t=%s", a, b, a + b);
    }
    draw_text(global.gui_width - 10, global.gui_height - 10, sprintf("pool=%s / ic=%s / te=%s / ct=%s / dt=%s / dt2=%s / dtt=%s / dtmax=%s", pool_size, instance_number(o_fx_text), o_game.data.stats.time_elapsed, current_time, delta_time, 1 / (1000000 / delta_time), o_game.data.stats.time_elapsed_delta, o_game.data.stats.time_elapsed_delta_max));
}
if (grid)
{
    draw_set_alpha(0.5);
    for (var _x = 0; _x < (global.gui_width / global.gui_settings.col_size); _x++)
    {
        draw_set_alpha(0.5);
        draw_text(((_x * global.gui_width) / global.gui_settings.col_size) + 2, 2, string(_x));
        draw_line((_x * global.gui_width) / global.gui_settings.col_size, 0, (_x * global.gui_width) / global.gui_settings.col_size, global.gui_height);
        draw_set_alpha(0.5);
        draw_line(((_x * global.gui_width) / global.gui_settings.col_size) + 5, 0, ((_x * global.gui_width) / global.gui_settings.col_size) + 5, global.gui_height);
    }
    for (var _y = 0; _y < (global.gui_height / global.gui_settings.col_size); _y++)
    {
        draw_set_alpha(0.5);
        draw_text(2, (_y * global.gui_height) / global.gui_settings.col_size, string(_y));
        draw_line(0, (_y * global.gui_height) / global.gui_settings.col_size, global.gui_width, (_y * global.gui_height) / global.gui_settings.col_size);
        draw_set_alpha(0.5);
        draw_line(0, ((_y * global.gui_height) / global.gui_settings.col_size) + (_GUI_COL_Y / 2), global.gui_width, ((_y * global.gui_height) / global.gui_settings.col_size) + (global.gui_height / global.gui_settings.col_size / 2));
    }
    draw_set_alpha(1);
}
