if (instance_exists(o_dialog) && o_dialog.visible)
{
    exit;
}
if (distance_to_point(mouse_x, mouse_y) > talk_range)
{
    exit;
}
if (refresh_actions_on_click)
{
    init_actions();
}
if (!is_undefined(custom_func))
{
    return custom_func();
}
if (array_length(actions) == 0 && is_undefined(gui_func))
{
    exit;
}
refresh_actions_dialog();
global.disable_gui_close_tmp = true;
