function notify(arg0, arg1 = "notification", arg2 = global.colors.black, arg3 = undefined)
{
    if (!variable_global_exists("layers"))
    {
        return false;
    }
    if (is_empty(arg0))
    {
        return false;
    }
    var tooltip_layer = global.layers.tooltips;
    if (get_option(global.options.notification_behind_menu))
    {
        tooltip_layer = global.layers.tooltips_behind_menu;
    }
    var o = instance_create_layer(0, gui_col_y(25), tooltip_layer, o_notification);
    o.bg_color = arg2;
    o.sprite = arg3;
    o.text = arg0;
    o.type = arg1;
    o.visible = get_option(global.options.enable_notifications);
    if (arg1 == "error")
    {
        o.visible = true;
    }
    with (o)
    {
        init();
    }
    var push_height = o.h + (o.padding * 2) + 24;
    with (o_notification)
    {
        if (id != o.id)
        {
            push(push_height);
        }
    }
    if (instance_exists(o_game))
    {
        o_game.data.stats.notifications++;
    }
    return true;
}

function notify_error(arg0, arg1 = "error")
{
    return notify(arg0, arg1);
}
