function gui_item_events(arg0, arg1)
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
    if (is_current_dialog_section(global.dialog_sections.event.general))
    {
        var __array = global.events_sorted;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            gui_draw_sprite(arg0 + gui_col_x(0.75), arg1 + gui_col_y(1.4), mitem.sprite, undefined, 5);
            var name = mitem.name;
            if (mitem._is_active())
            {
                name = sprintf("%s - [%s]", mitem.name, __("Active"));
            }
            arg1 += draw_heading_description(arg0 + gui_col_x(2), arg1, name, mitem.description, undefined, undefined, undefined, 0);
            var text = mitem.date_text;
            if (mitem.data.activated_manually && is_struct(mitem.auto_artifact) && mitem._is_active())
            {
                text += ("\n" + __s("[Activated by artifact] - Expires in %s", format_remaining_time(mitem.data.expire_timer)));
            }
            arg1 += draw_description(arg0 + gui_col_x(2), arg1, text, gui_col_x(21));
            arg1 += global.ui_gaps.md;
            if (global.debug)
            {
                if (gui_button_tl(arg0 + gui_col_x(20), arg1 - gui_col_y(5), "Expire"))
                {
                    mitem._expire();
                }
                if (gui_button_tl(arg0 + gui_col_x(18), arg1 - gui_col_y(5), "Start"))
                {
                    mitem._activate();
                }
            }
        }
    }
    else if (is_current_dialog_section(global.dialog_sections.event.halloween))
    {
        arg1 += gui_item_shop(arg0, arg1, 
        {
            shop_items: o_shop.shop_items.event_halloween,
            shop_key: "event_halloween"
        });
    }
    else if (is_current_dialog_section(global.dialog_sections.event.nature_season))
    {
        arg1 += gui_item_shop(arg0, arg1, 
        {
            shop_items: o_shop.shop_items.event_nature,
            shop_key: "event_nature"
        });
    }
    else if (is_current_dialog_section(global.dialog_sections.event.anniversary))
    {
        arg1 += draw_heading_description(arg0, arg1, global.titles.minigame_candle.title, global.titles.minigame_candle.subtitle);
        if (gui_button_tl(arg0, arg1, __("Play Minigame"), undefined, gui_col_x(4)))
        {
            actions_dialog_simple(gui_item_anniversary_candle, global.titles.minigame_candle, 
            {
                add_draw: gui_item_anniversary_candle_add_draw
            });
        }
        arg1 += global.ui_gaps.xl;
        arg1 += gui_item_shop(arg0, arg1, 
        {
            shop_items: o_shop.shop_items.event_anniversary,
            shop_key: "event_anniversary"
        });
    }
    else if (is_current_dialog_section(global.dialog_sections.event.anniversary_journey))
    {
        arg1 += gui_item_journey(arg0, arg1, global.journeys.anniversary);
    }
    return arg1 - y_start;
}

function gui_item_events_add_draw()
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
    var res_x = add_text_base_x + gui_col_x(20.5);
    var res_y = add_text_base_y;
    var res = undefined;
    var shop = undefined;
    if (is_current_dialog_section(global.dialog_sections.event.halloween))
    {
        res = global.resources.borb_o_lantern;
        shop = global.shops_sorted.event;
    }
    else if (is_current_dialog_section(global.dialog_sections.event.nature_season))
    {
        res = global.resources.nature_gems;
        shop = global.shops_sorted.event_nature;
    }
    else if (is_current_dialog_section(global.dialog_sections.event.anniversary))
    {
        res = global.resources.party_tokens;
        shop = global.shops_sorted.event_anniversary;
    }
    if (is_struct(res))
    {
        draw_resources(res_x, res_y, build_resource_cost(res, res.data.count), undefined, 
        {
            mini: true
        });
    }
    if (is_array(shop))
    {
        gui_draw_buy_max(add_button_base_x, add_button_base_y, shop);
    }
}
