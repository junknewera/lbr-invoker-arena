function gui_item_trades(arg0, arg1, arg2)
{
    set_default_font(f_gui_small);
    var time_diff = date_second_span(date_current_datetime(), get_date_from_object(o_game.data.stats.trades_refresh));
    var refresh_text = sprintf(__("Trades refresh in %s"), format_time(time_diff));
    if (!get_option(global.options.trades_auto_refresh))
    {
        refresh_text = __("Auto refresh disabled.");
    }
    draw_text_ext(arg0, arg1, refresh_text, global.gui_text_line_height, gui_col_x(18));
    arg1 += gui_col_y(2);
    if (array_length(global.trades) == 0)
    {
        draw_text_ext(arg0, arg1, __("No trades available."), global.gui_text_line_height, gui_col_x(18));
        exit;
    }
    var show_detailed_info = get_option(global.options.trades_detailed_info);
    var trade_height = show_detailed_info ? 90 : 60;
    if (global.is_mobile)
    {
        trade_height += 40;
    }
    var __array = global.trades;
    var __prop_len = array_length(__array);
    var __i = __prop_len - 1;
    while (__i >= 0)
    {
        var mitem = __array[__i];
        var __ireal = __prop_len - 1 - __i;
        var item = mitem;
        var name = get_value_ext(item, item.get_name);
        var description = get_value_ext(item, item.get_description);
        set_default_font(f_gui_default);
        draw_text(arg0, arg1, name);
        if (show_detailed_info)
        {
            set_default_font(f_gui_small);
            draw_text_ext(arg0, arg1 + gui_col_y(0.9), description, global.gui_text_line_height, gui_col_x(9));
            set_default_font(f_gui_default);
        }
        var res_x = arg0 + gui_col_x(7);
        draw_resources(res_x, arg1, item.data.input, 1, 
        {
            show_tooltip: true
        });
        gui_draw_sprite(res_x + gui_col_x(3.9), arg1 + gui_col_y(0.4), spr_gui_arrow_right);
        draw_resources(res_x + gui_col_x(4.5), arg1, item.data.reward, 1, 
        {
            inline: true,
            show_tooltip: true
        });
        if (item.can_boost_display())
        {
            if (gui_button(arg0 + gui_col_x(16), arg1 + gui_col_y(0.6), __("Boost"), item.can_boost(), gui_col_x(1.3), false, 
            {
                tooltip: __("Boost to max level")
            }))
            {
                item.boost();
            }
            draw_materials_mini(arg0 + gui_col_x(16), arg1 + gui_col_y(1.35), item.get_boost_cost(), 1, 
            {
                show_tooltip: true
            });
        }
        if (item.data.started)
        {
            if (item.is_finished())
            {
                if (gui_button(arg0 + gui_col_x(22), arg1 + gui_col_y(0.6), __("Collect"), item.can_collect(), -1, false, 
                {
                    icon: spr_icon_check
                }))
                {
                    item.collect();
                }
            }
            else
            {
                var tooltip_text = sprintf(__("Cancel trade for %s"), format_resources_text(item.get_cancel_cost()));
                if (gui_button(arg0 + gui_col_x(19), arg1 + gui_col_y(0.6), __("Cancel"), item.can_cancel(), -1, false, 
                {
                    icon: spr_icon_cancel,
                    tooltip: tooltip_text
                }))
                {
                    item.cancel();
                }
            }
        }
        else
        {
            var button_enabled = item.can_start_trade();
            if (gui_button(arg0 + gui_col_x(22), arg1 + gui_col_y(0.6), __("Start"), button_enabled, 100))
            {
                item.start();
            }
        }
        arg1 += trade_height;
        __i--;
    }
    var trades_height = (array_length(global.trades) + 1) * trade_height;
    return trades_height;
}

function gui_item_trades_add_draw()
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
    draw_resources(gui_x_start, add_text_base_y, global.costs.trades_refresh, 1, 
    {
        prefix: __("Cost:"),
        font: f_gui_small
    });
    var button_enabled = can_refresh_trades();
    if (gui_button_tl(gui_x_start + gui_col_x(2.25), add_button_base_y, __("Refresh"), button_enabled, gui_col_x(2.2)))
    {
        refresh_trades();
    }
    global.options.trades_auto_refresh.draw(gui_x_start + gui_col_x(6), add_button_base_y, undefined, 
    {
        name_width: gui_col_x(3)
    });
    global.options.trades_detailed_info.draw(gui_x_start + gui_col_x(11), add_button_base_y, undefined, 
    {
        name_width: gui_col_x(1.5)
    });
    if (is_unlocked_materials())
    {
        if (gui_button_tl(gui_x_start + gui_col_x(15), add_button_base_y, __("Boost all"), true))
        {
            var __array = global.trades;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                if (!mitem.can_boost())
                {
                    continue;
                }
                mitem.boost();
            }
        }
    }
    if (gui_button_tl(gui_x_start + gui_col_x(20.5), add_button_base_y, __("Collect Trades"), true, -1, false))
    {
        var collect_list = array_filter_custom(global.trades, "is_finished");
        var __array = collect_list;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            mitem.collect();
        }
    }
}
