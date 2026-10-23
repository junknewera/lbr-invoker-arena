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
active = false;
button_text_prefix = undefined;
button_text_suffix = undefined;
button_text_affix_brackets = true;
center = true;
header_text = undefined;
hover = false;
icon = undefined;
is_dialog_item_button = true;
is_in_content_range = false;
min_width = undefined;
selected = false;
text_below = undefined;
text_right = undefined;
text_right_width = gui_col_x(6);
timeout = undefined;
timeout_end = undefined;
materials = undefined;
materials_mini = undefined;
materials_options = undefined;
resources = undefined;
resources_mini = undefined;
resources_options = undefined;
result_mini = undefined;
result_position = "bottom";
scale_text_width = false;
text = "";
tooltip = undefined;
check_mb_middle = false;
check_mwheelup = false;
check_mwheeldown = false;
enabled = true;
w = -1;
h = 32;
w_start = w;
h_start = h;
is_gui = true;
check_mouse_auto_trigger = false;
x_padding_resources = global.is_mobile ? 0.5 : 0.25;
y_padding_resources = global.is_mobile ? 2 : 1.5;
mouse_click_check_func = global.is_mobile ? mouse_check_button_released : mouse_check_button_pressed;
text_color = global.colors.text_default;
btn_bg_color = 16777215;
button_w = floor(w_start / 2);
button_h = floor(h_start / 2);
bl = floor(x);
br = floor(x + (button_w * 2));
bt = floor(y);
bb = floor(y + (button_h * 2));

init = function()
{
    w_start = w;
    h_start = h;
};

on_click = __void;
