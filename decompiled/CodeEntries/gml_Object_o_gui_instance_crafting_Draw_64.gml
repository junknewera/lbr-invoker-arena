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
draw_set_color(#8D653C);
draw_rectangle(x, y + gui_col_y(1), x + width, y + gui_col_y(2), false);
draw_set_color(c_green);
draw_rectangle((x + (width / 2)) - 3, y + gui_col_y(0.5), x + (width / 2) + 7, y + gui_col_y(2.5), false);
var ubx = x + (width / 2) + ((sin(ub) * width) / 2);
draw_set_color(c_white);
draw_rectangle(ubx - 2, y + gui_col_y(0.5), ubx + 2, y + gui_col_y(2.5), false);
if (crafted)
{
    var craft_quality = (1 - abs(sin(ub))) * 100;
    draw_description(ubx, y - gui_col_y(0.5), number_format_percent(craft_quality / 100, 0), undefined, 1);
}
