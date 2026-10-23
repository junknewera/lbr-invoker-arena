function fx_text(arg0, arg1, arg2, arg3, arg4 = false, arg5 = global.layers.fx)
{
    if (arg4)
    {
        o = instance_create_layer(0, 0, arg5, o_fx_text);
        o.x = arg0;
        o.y = arg1;
        o.text = arg2;
        o.depth = -5000;
        o.force_remove = true;
        if (!is_undefined(arg3))
        {
            o.sprite_index = arg3;
        }
        with (o)
        {
            init();
        }
        return o;
    }
    if (ds_list_size(o_game.pool_fx_text_inactive) == 0)
    {
        exit;
    }
    var o = ds_list_find_value(o_game.pool_fx_text_inactive, 0);
    ds_list_add(o_game.pool_fx_text_active, o);
    ds_list_delete(o_game.pool_fx_text_inactive, 0);
    instance_activate_object(o);
    with (o)
    {
        event_perform(ev_create, 0);
    }
    o.x = arg0;
    o.y = arg1;
    o.text = arg2;
    o.depth = -5000;
    if (!is_undefined(arg3))
    {
        o.sprite_index = arg3;
    }
    with (o)
    {
        init();
    }
    return o;
}
