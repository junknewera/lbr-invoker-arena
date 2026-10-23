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
event_inherited();
var y_start = y;
var _y = y;
_y += draw_heading(x, y, text, width);
var h = _y - y_start;
if (mouse_click_in_gui_range(x, y, x + string_width_ext(text, -1, width), y + h, [1, 2]))
{
    click();
}
