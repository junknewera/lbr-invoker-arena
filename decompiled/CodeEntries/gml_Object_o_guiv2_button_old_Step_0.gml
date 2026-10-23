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
button_w = floor(w / 2);
button_h = floor(h / 2);
bl = floor(x);
br = floor(x + (button_w * 2));
bt = floor(y);
bb = floor(y + (button_h * 2));
hover = mouse_in_gui_range(bl, bt, br, bb);
is_in_content_range = mouse_in_gui_content_range();
var is_dialog_item_button_enabled = true;
if (is_dialog_item_button && !is_in_content_range)
{
    is_dialog_item_button_enabled = false;
}
var check_mb_middle_clicked = check_mb_middle ? mouse_click_check_func(3) : false;
var mouse_click_triggered = mouse_click_check_func(1) || mouse_click_check_func(2) || check_mb_middle_clicked;
if (check_mouse_auto_trigger)
{
    mouse_click_triggered = mouse_click_triggered || global.mouse_click_triggered;
}
if (instance_exists(o_mouse) && o_mouse.dragging)
{
    mouse_click_triggered = false;
}
active = !is_empty(enabled) && hover && mouse_click_triggered;
if (active && is_dialog_visible() && !is_dialog_item_button_enabled)
{
    active = false;
}
if (mouse_click_triggered && active)
{
    on_click();
}
