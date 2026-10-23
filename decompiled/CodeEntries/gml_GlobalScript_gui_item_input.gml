function gui_item_input(arg0, arg1, arg2)
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
    if (!dialog_visible)
    {
        return 0;
    }
    var height = gui_col_y(3);
    var label_instance_exists = false;
    with (o_gui_instance_input)
    {
        if (label_id == arg2.label_id)
        {
            label_instance_exists = true;
            x = arg0;
            y = arg1;
            return height;
        }
    }
    if (label_instance_exists)
    {
        return height;
    }
    var o = instance_create_layer(arg0, arg1, global.layers.gui, o_gui_instance_input);
    apply_struct_to_instance(arg2, o);
    with (o)
    {
        init();
    }
    return height;
}
