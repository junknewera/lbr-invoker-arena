event_inherited();
set_default_font(f_gui_small);
draw_set_color(c_white);
draw_text(x, y, string(label));
var box_color = has_focus ? 3958157 : 2642297;
draw_set_color(box_color);
draw_rectangle(box_x1, box_y1, box_x2, box_y2, false);
var input_draw = input;
if (obfuscated)
{
    input_draw = string_repeat("*", string_length(input));
}
var add_draw = has_focus ? "|" : "";
draw_set_color(c_white);
draw_text(box_x1 + 6, box_y1 + 5, string(input_draw) + add_draw);
if (show_unmask_option)
{
    if (gui_button_tl(box_x2 + 10, box_y1, __("Toggle"), true))
    {
        obfuscated = !obfuscated;
    }
}
