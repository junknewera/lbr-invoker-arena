if (!global.draw_hud)
{
    exit;
}
draw_set_alpha(alpha - 0.07);
draw_set_color(bg_color);
draw_rectangle(x1, y1 - padding, x2 + (padding * 2), y2 + padding, false);
draw_set_color(c_white);
set_default_font(f_gui_small);
draw_set_alpha(alpha);
draw_set_valign(valign);
draw_set_halign(halign);
var text_x = x1 + padding;
var text_w = w;
if (!is_undefined(sprite))
{
    draw_sprite_contain(sprite, -1, x1 + padding, y1 + (h / 2), 32);
    text_x += 32;
    text_w -= 32;
}
draw_text_ext(text_x, y1 + (h / 2), text, line_spacing, w);
draw_set_alpha(1);
