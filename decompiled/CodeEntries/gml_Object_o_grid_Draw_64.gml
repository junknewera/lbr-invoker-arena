set_default_font(f_gui_small);
draw_set_alpha(0.5);
var col_x = global.gui_width / global.gui_settings.col_size;
var col_y = global.gui_height / global.gui_settings.col_size;
var dialog_x = gui_col_x(3.5);
var dialog_y = gui_col_y(4.1);
for (var _x = 0; _x < col_x; _x++)
{
    var text_x = (draw_type == 0) ? _x : round(gui_col_x(_x));
    draw_text((_x * col_x) + 2, 2, string(text_x));
    draw_line((_x * col_x) + offset_x, 0, (_x * col_x) + offset_x, global.gui_height);
}
for (var _y = 0; _y < col_y; _y++)
{
    var text_y = (draw_type == 0) ? _y : round(gui_col_y(_y));
    draw_text(2, _y * col_y, string(text_y));
    draw_line(0, (_y * col_y) + offset_y, global.gui_width, (_y * col_y) + offset_y);
}
draw_line_color(dialog_x + gui_col_x(8), 0, dialog_x + gui_col_x(8), global.gui_height, c_aqua, c_aqua);
draw_line_color(dialog_x + gui_col_x(16), 0, dialog_x + gui_col_x(16), global.gui_height, c_aqua, c_aqua);
draw_set_alpha(1);
if (dragging)
{
    set_default_font(f_gui_default, 1, 1);
    draw_line(drag_x_start, drag_y_start, o_mouse.x, o_mouse.y);
    var col_w = (o_mouse.x - drag_x_start) / global.gui_settings.col_x;
    var col_h = (o_mouse.y - drag_y_start) / global.gui_settings.col_y;
    if (keyboard_check(vk_alt))
    {
        draw_text(global.gui_width / 2, global.gui_height / 2, sprintf("w=%s %s h=%s", number_format(col_w, 2), "\n", number_format(col_h, 2)));
    }
    else
    {
        draw_text(o_mouse.x + 50, o_mouse.y - 20, sprintf("w=%s %s h=%s", number_format(col_w, 2), "\n", number_format(col_h, 2)));
    }
}
