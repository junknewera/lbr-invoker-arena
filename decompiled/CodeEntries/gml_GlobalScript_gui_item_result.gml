function gui_item_result(arg0, arg1, arg2, arg3 = undefined)
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
    if (!is_struct(arg3))
    {
        arg3 = {};
    }
    arg3.inline = true;
    arg3.show_titles = true;
    arg3.skip_zero = true;
    var y_start = arg1;
    arg1 += draw_result(arg0, arg1, arg2, undefined, arg3);
    return arg1 - y_start;
}

function gui_item_action_result(arg0, arg1, arg2)
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
    var result = get_value_ext(arg2.instance, arg2.result, false);
    if (!is_struct(result))
    {
        exit;
    }
    return gui_item_result(arg0, arg1, result, arg2);
}
