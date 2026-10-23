click_action_alarm_set = false;
if (instance_exists(o_gui_editor))
{
    exit;
}
if (get_option(global.options.single_click_nav))
{
    if (global.disable_gui_close_tmp)
    {
        click_action = undefined;
    }
    if (!is_struct(click_action))
    {
        exit;
    }
    open_nav(click_action.key);
    click_action = undefined;
}
