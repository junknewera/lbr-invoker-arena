event_inherited();
if (!is_visible)
{
    exit;
}
if (!surface_exists(text_surf))
{
    text_surf = surface_create(width, height - 20);
}
set_default_font(f_gui_default);
draw_text(x, y, string(title));
surface_set_target(text_surf);
draw_clear_alpha(c_black, 0);
set_default_font(font);
draw_text_ext(padding, -text_position, text, text_seperation, text_width);
surface_reset_target();
draw_surface(text_surf, x, y + 40);
if (scroll_buttons)
{
    if (gui_button_sprite(x1 + (width / 2), y1 - 20, spr_gui_arrow_up, true, true))
    {
        scroll(-1);
    }
    if (gui_button_sprite(x1 + (width / 2), y1 + height + 70, spr_gui_arrow_down, true, true))
    {
        scroll(1);
    }
}
if (global.debug && keyboard_check(vk_shift))
{
    draw_set_color(c_red);
    draw_rectangle(x1, y1, x2, y2, true);
}
