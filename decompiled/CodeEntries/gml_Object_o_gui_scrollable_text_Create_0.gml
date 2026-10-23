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
width = 200;
height = 100;
padding = 0;
font = f_gui_medium;
scroll_buttons = false;
skip_visible_check = true;
text_end_position = 0;
text_height = 0;
text_seperation = -1;
text_surf = -1;
text = "";
title = "";

check_scroll = function()
{
    var scroll_down = false;
    var scroll_up = false;
    if (keyboard_check(vk_down))
    {
        scroll_down = true;
    }
    else if (get_mouse_wheel_down() && mouse_over_panel())
    {
        scroll_down = true;
    }
    if (scroll_down)
    {
        scroll();
    }
    if (keyboard_check(vk_up))
    {
        scroll_up = true;
    }
    else if (get_mouse_wheel_up() && mouse_over_panel())
    {
        scroll_up = true;
    }
    if (scroll_up)
    {
        scroll(-1);
    }
};

mouse_over_panel = function()
{
    var scroll_padding = gui_col_x(1);
    return mouse_in_gui_range(x1 - scroll_padding, y1 - scroll_padding, x2 + scroll_padding, y2 + scroll_padding);
};

set_size = function()
{
    x1 = x;
    x2 = x + width;
    y1 = y;
    y2 = y + height;
    scroll_buttons = text_height > height;
};

set_text = function(arg0)
{
    set_default_font(font);
    text = arg0;
    text_width = width - (padding * 2);
    text_end_position = max(-padding, (string_height_ext(arg0, text_seperation, text_width) - height) + padding);
    text_height = string_height_ext(arg0, text_seperation, text_width);
    text_position = -padding;
    set_size();
};

scroll = function(arg0 = 1)
{
    if (!is_numeric(arg0))
    {
        arg0 = 0;
    }
    text_position += (12 * arg0);
    text_position = clamp(text_position, -padding, text_end_position + 30);
};

set_size();
