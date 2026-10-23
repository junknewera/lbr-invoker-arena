function draw_tooltip(arg0, arg1, arg2 = 400, arg3 = 100, arg4 = "", arg5 = undefined)
{
    if (instance_exists(o_tooltip))
    {
        exit;
    }
    var force_show = false;
    if (is_struct(arg5))
    {
        force_show = get_default_value(struct_get_from_hash(arg5, variable_get_hash("force_show_tooltip")), false);
    }
    if (!get_option(global.options.enable_tooltips) && !force_show)
    {
        exit;
    }
    var text_tmp = get_value_ext(-1, arg4);
    if (text_tmp == "")
    {
        exit;
    }
    var o = instance_create_layer(arg0, arg1, global.layers.tooltips, o_tooltip);
    o.w = arg2;
    o.h = arg3;
    o.button_width = arg2;
    o.button_height = arg3;
    o.text = arg4;
    o.options = arg5;
    with (o)
    {
        init();
    }
}
