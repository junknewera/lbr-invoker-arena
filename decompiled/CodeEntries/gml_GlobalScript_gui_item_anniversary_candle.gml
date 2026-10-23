function gui_item_anniversary_candle(arg0, arg1)
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
    var y_start = arg1;
    if (!instance_exists(o_minigame_candle))
    {
        instance_create_layer(arg0, gui_y_start_items, global.layers.gui, o_minigame_candle);
    }
    else
    {
        o_minigame_candle.visible = is_dialog_visible();
    }
    return arg1 - y_start;
}

function gui_item_anniversary_candle_add_draw()
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
    if (has_bought_shop_item_safe(global.shops.event_anniversary.candle_auto_advance))
    {
        draw_option(global.options.auto_advance_candle_minigame, add_button_base_x, add_button_base_y_tl, undefined, undefined, 5);
    }
}
