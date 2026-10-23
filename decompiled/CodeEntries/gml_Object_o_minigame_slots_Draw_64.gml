var padding = 80;
var paddingf = padding / 2;
var __array = slots;
var __prop_len = array_length(__array);
for (var __i = 0; __i < __prop_len; __i++)
{
    var mitem = __array[__i];
    var bx = x + gui_col_x(5) + (width * __i) + (padding * __i);
    var by = y + gui_col_y(4);
    draw_rect(bx - paddingf, by - paddingf, bx + width + paddingf, by + height + paddingf, false, hexcolor(9134905));
    draw_sprite_stretched(mitem.sprite, 0, bx, by, width, height);
}
if (play_ended && win_result.win)
{
    set_default_font(f_gui_small);
    draw_text(x, y + height + gui_col_y(4), string(win_result.text));
    if (is_struct(win_result.resources))
    {
        draw_resources(x, y + height + gui_col_y(5), win_result.resources);
    }
    else
    {
        draw_sprite_stretched(win_result.sprite, 0, x, y + height + gui_col_y(2.5), 32, 32);
    }
}
