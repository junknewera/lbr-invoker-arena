function gui_item_checkbox(arg0, arg1, arg2)
{
    if (!dialog_visible)
    {
        exit;
    }
    var label_instance_exists = false;
    with (o_gui_instance_checkbox)
    {
        if (label_id == arg2.label_id)
        {
            label_instance_exists = true;
            x = arg0;
            y = arg1;
            exit;
        }
    }
    if (label_instance_exists)
    {
        exit;
    }
    var o = instance_create_layer(arg0, arg1, global.layers.gui, o_gui_instance_checkbox);
    apply_struct_to_instance(arg2, o);
    with (o)
    {
        init();
    }
}
