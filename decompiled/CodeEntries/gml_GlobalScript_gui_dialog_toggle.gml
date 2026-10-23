function gui_dialog_toggle(arg0 = undefined, arg1 = undefined)
{
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
    if (is_undefined(arg0))
    {
        arg0 = o_dialog;
    }
    instance_destroy(o_tooltip);
    reset_tavern_games();
    if (arg0 == -1)
    {
        exit;
    }
    if (instance_exists(o_gui_editor))
    {
        exit;
    }
    with (arg0)
    {
        visible = !visible;
        if (is_undefined(arg1))
        {
            arg1 = tab;
        }
        dialog_visible = visible;
        o_game.is_dialog_open = visible;
        shop_index = 0;
        scroll_y = 0;
        scroll_y_fx = 0;
        if (!is_undefined(variable_struct_get(global.dialog_shop_section_last, dialog_id)))
        {
            set_dialog_section(variable_struct_get(global.dialog_shop_section_last, dialog_id));
        }
        if (!is_undefined(variable_struct_get(global.dialog_shop_index_last, dialog_id)))
        {
            scroll_y = variable_struct_get(global.dialog_shop_index_last, dialog_id);
            scroll_y_fx = scroll_y;
        }
        var section_nav_key = sprintf("%s_%s", dialog_id, current_section.key);
        if (!is_undefined(variable_struct_get(global.dialog_shop_index_last, section_nav_key)))
        {
            scroll_y = variable_struct_get(global.dialog_shop_index_last, section_nav_key);
            scroll_y_fx = scroll_y;
        }
        tab = arg1;
        if (visible)
        {
            dialog_click_delay();
        }
        if (!visible)
        {
            set_game_state(UnknownEnum.Value_0);
        }
        refresh_surface = true;
        hide_gui_instances(visible);
    }
}

enum UnknownEnum
{
    Value_0
}
