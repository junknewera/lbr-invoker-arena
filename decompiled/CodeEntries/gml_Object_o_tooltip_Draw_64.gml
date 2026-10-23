if (!global.draw_hud)
{
    exit;
}
var v = 2;
if (v == 1)
{
    var padding = 10;
    draw_sprite_stretched(spr_textbox_9s2, 0, x1 - padding, y1 - 40 - padding, w + (padding * 2), h + (padding * 2));
    draw_description(text_x, (y1 + (h / 2)) - 40, tooltip_text, w, halign, valign);
}
else
{
    var rx1 = x1;
    var rx2 = x2;
    var ry1 = y1;
    var ry2 = y2;
    draw_set_alpha(0.93);
    draw_set_color(c_black);
    draw_rectangle(rx1, ry1 - 40, rx2, ry2 - 40, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
    set_default_font(f_gui_small);
    draw_set_valign(valign);
    draw_set_halign(halign);
    draw_text_ext(text_x, text_y, tooltip_text, line_spacing, w);
    if (is_struct(struct_get_from_hash(options, variable_get_hash("result"))))
    {
        draw_result(x1 + 20, (y1 + text_height) - 20, options.result, undefined, 
        {
            mini: true
        }, false, gui_col_x(5));
    }
}
if (global.debug && keyboard_check(vk_shift))
{
    draw_set_color(c_red);
    draw_rectangle(orig_x1, orig_y1, orig_x2, orig_y2, true);
}
