event_inherited();
if (!is_dialog_visible())
{
    exit;
}
if (!surface_exists(surface))
{
    surface = surface_create(global.gui_width, global.gui_height);
}
surface_set_target(surface);
if (refresh_surface)
{
    draw_clear_alpha(c_black, 0);
    var borb_length = array_length(borbs_lose);
    for (var i = 0; i < borb_length; i++)
    {
        var borb = @@array_get@@(borbs_lose, i);
        draw_borb(borb);
    }
    var borb_win_length = array_length(borbs_win);
    for (var i = 0; i < borb_win_length; i++)
    {
        var borb = @@array_get@@(borbs_win, i);
        if (borb._catch)
        {
            continue;
        }
        draw_borb(borb);
    }
}
surface_reset_target();
draw_surface(surface, 0, 0);
refresh_surface = false;
draw_sprite_ext(spr_icon_hook, 0, claw._x, claw._y, 2, 2, 0, c_white, 1);
if (global.debug && keyboard_check(vk_shift))
{
    draw_set_alpha(0.5);
    draw_circle(claw._x, claw._y, win_distance, false);
    draw_set_alpha(1);
}
if (is_struct(claw._catch))
{
    draw_borb(claw._catch);
}
if (claw.state == 4 && win_result.win)
{
    set_default_font(f_gui_small);
    draw_text(x + 20, y + gui_col_y(4), string(win_result.text));
    if (is_struct(win_result.resources))
    {
        draw_resources(x + 20, y + gui_col_y(5), win_result.resources);
    }
    else
    {
        draw_sprite_stretched(win_result.sprite, 0, x + 20, y + gui_col_y(5), 32, 32);
    }
}
