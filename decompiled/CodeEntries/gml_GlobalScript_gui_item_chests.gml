function gui_item_chests()
{
}

function gui_item_chests_add_draw()
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
    var button_enabled = _any(global.chests, function(arg0)
    {
        return arg0.data.count > 0;
    });
    if (gui_button_tl(add_button_base_x, add_button_base_y, __("Open all chests"), button_enabled, gui_col_x(4)))
    {
        open_all_chests();
    }
}
