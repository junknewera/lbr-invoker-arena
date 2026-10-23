if (live_auto_call_1())
{
    var lac_argc = argument_count;
    var lac_args = array_create(lac_argc);
    var lac_argk = 0;
    repeat (lac_argc)
    {
        lac_args[lac_argk] = argument[lac_argk];
        lac_argk++;
    }
    if (live_auto_call_2(lac_args))
    {
        return global.live_result;
    }
}
if (!global.draw_hud)
{
    exit;
}
if (!surface_exists(surface))
{
    surface = surface_create(width, height, 6);
}
if (refresh_surface)
{
    refresh_surface = false;
    surface_set_target(surface);
    draw_clear_alpha(c_black, 0);
    draw_items();
    surface_reset_target();
}
var yreal = y + 10;
if (!fixed_y && instance_exists(o_dialog))
{
    yreal -= (o_dialog.scroll_y - scroll_y_start);
}
draw_surface_part(surface, 0, 0, width, height, x, yreal);
if (scroll_buttons)
{
    if (gui_button_sprite(x2 + 30, y1 + gui_col_y(1.9), spr_gui_arrow_up_double, true, true))
    {
        scroll_y = 0;
        scroll(-1);
    }
    if (gui_button_sprite(x2 + 30, y1 + gui_col_y(3.9), spr_gui_arrow_up, true, true))
    {
        scroll(-1);
    }
    if (gui_button_sprite(x2 + 30, (y1 + height) - gui_col_y(2), spr_gui_arrow_down, true, true))
    {
        scroll(1);
    }
    if (gui_button_sprite(x2 + 30, y1 + height + 10, spr_gui_arrow_down_double, true, true))
    {
        scroll_y = 99999999999;
        scroll(1);
    }
}
