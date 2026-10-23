_x = x;
_y = y;
if (hovering)
{
    _y = y + (sin(t / 25) * 5);
}
if (show_tooltip)
{
    draw_set_alpha(image_alpha);
    draw_sprite_outlined(sprite_index, image_index, _x, _y, image_xscale, image_yscale, image_angle, image_blend, 16777215);
    draw_set_alpha(0.75);
    draw_set_color(c_black);
    draw_rectangle(x - (w / 2), y - (h / 2), x + (w / 2), (y - (h / 2)) + 20, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
    set_default_font(f_gui_small);
    draw_set_valign(fa_middle);
    draw_set_halign(fa_center);
    draw_text(x, (y - (h / 2)) + 10, string(text));
}
else
{
    draw_sprite_ext(sprite_index, image_index, _x, _y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
