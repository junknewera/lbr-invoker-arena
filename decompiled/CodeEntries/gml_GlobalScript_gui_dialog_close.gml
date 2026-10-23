function gui_dialog_close(arg0 = undefined)
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
    if (instance_exists(o_gui_editor))
    {
        exit;
    }
    destroy_gui_instances();
    if (instance_exists(o_game))
    {
        o_game.is_dialog_open = false;
    }
    global.dialog_instance = -1;
    global.selected_card = undefined;
    reset_tavern_games();
    if (is_undefined(arg0))
    {
        arg0 = o_dialog;
    }
    if (arg0 == -1)
    {
        exit;
    }
    with (arg0)
    {
        variable_struct_set(global.dialog_shop_index_last, dialog_id, scroll_y);
        dialog_visible = false;
        set_game_state(UnknownEnum.Value_0);
        if (variable_instance_exists(id, "is_dialog"))
        {
            alarm[1] = 1;
            exit;
        }
        refresh_surface = true;
    }
}

enum UnknownEnum
{
    Value_0
}
