function draw_card(arg0, arg1, arg2, arg3 = gui_col_x(7), arg4 = gui_col_y(14), arg5 = false, arg6 = gui_col_x(8), arg7 = undefined, arg8 = false)
{
    if (!is_struct(arg2))
    {
        return 0;
    }
    var unlocked = arg2.is_unlocked();
    var y_start = arg1;
    draw_sprite_stretched(arg2.type.sprite, 0, arg0, arg1, arg3, arg4);
    set_default_font(f_gui_small, 1, 1);
    draw_text(arg0 + (arg3 / 2), arg1 + (arg4 * 0.21), arg2.get_header_text());
    var text_count = unlocked ? sprintf("%s/%s", arg2.data.count, arg2.max_count()) : "";
    if (!is_undefined(arg7))
    {
        text_count = string(arg7);
    }
    draw_text(arg0 + (arg3 / 2), arg1 + (arg4 * 0.8), text_count);
    var sprite_color = unlocked ? 16777215 : 0;
    if (unlocked && arg2.get_blend_color() != undefined)
    {
        sprite_color = arg2.get_blend_color();
    }
    draw_sprite_contain(arg2.sprite, -1, arg0 + (arg3 / 2), arg1 + (arg4 / 2), ceil(arg3 / 3), 0, sprite_color);
    var text_height = 0;
    if (unlocked && arg5)
    {
        var action_padding_y = gui_col_y(global.is_mobile ? 3.75 : 2.75);
        var salvage_count = get_key_modifier();
        salvage_count = _clamp(salvage_count, 1, arg2.data.count);
        if (gui_button_sprite(arg0 + arg3, y_start + gui_col_y(6), spr_icon_salvage, arg2.can_salvage(salvage_count), false, 
        {
            resources_mini: arg2.get_salvage_resources(salvage_count),
            tooltip: __("Salvage a card for some resources.")
        }))
        {
            arg2.salvage(salvage_count);
        }
        if (!is_undefined(arg2.type.next_rarity_type))
        {
            if (gui_button_tl(arg0, arg1 + arg4, __("Ascend"), arg2.can_ascend(), gui_col_x(4), undefined, 
            {
                resources_mini: arg2.get_ascend_cost(),
                tooltip: __s("Ascend this card to the next higher tier. The count will be decreased by %s.", global.game_settings.cards_min_ascend_count)
            }))
            {
                arg2.ascend();
            }
            var lock_tooltip_ascend = __("Locked cards can't be ascended.");
            gui_button_toggle_lock(arg0 + arg3, arg1 + arg4 + gui_col_y(0.6), arg2, "lockedaa", undefined, 
            {
                tooltip: lock_tooltip_ascend
            });
        }
        arg1 += action_padding_y;
        var transcend_button_text = sprintf("%s [%s/%s]", __("Transcend"), number_format(arg2.data.count), number_format(arg2.get_transcend_cards_count()));
        var can_transcend = arg2.can_transcend();
        if (gui_button_tl(arg0, arg1 + arg4, transcend_button_text, can_transcend, gui_col_x(4), undefined, 
        {
            resources_mini: arg2.get_transcend_resources(),
            tooltip: __s("Transcend a card to get %s.", format_resources_text(arg2.get_transcend_resources()))
        }) || (check_hotkey(global.hotkeys.transcend_card) && can_transcend))
        {
            arg2.transcend();
        }
        var lock_tooltip = __("Locked cards can't be transcended.");
        if (!global.is_mobile)
        {
            lock_tooltip += sprintf("\n%s", __s("Press %s to toggle the card lock.", __("Spacebar")));
        }
        gui_button_toggle_lock(arg0 + arg3, arg1 + arg4 + gui_col_y(0.6), arg2, undefined, undefined, 
        {
            tooltip: lock_tooltip,
            hotkey: 32
        });
        arg1 += action_padding_y;
        set_default_font(f_gui_small, 0, 0);
        var ua_text = arg2.get_full_description();
        draw_text_ext(arg0, arg1 + arg4, ua_text, global.gui_text_line_height, arg6);
        text_height += (string_height_ext(ua_text, global.gui_text_line_height, arg6) + gui_col_y(2.5));
    }
    if (arg8 && mouse_in_gui_range(arg0, arg1, arg0 + arg3, arg1 + arg4))
    {
        draw_tooltip(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), arg3, undefined, arg2.get_full_description(true));
    }
    if (global.debug)
    {
        arg1 += gui_col_y(2);
        if (gui_button_tl(arg0, arg1, "=0"))
        {
            arg2.data.count = 0;
        }
    }
    return arg4 + text_height + gui_col_y(2);
}

function draw_cards_result(arg0, arg1, arg2)
{
    var y_start = arg1;
    var card_width = gui_col_x(7);
    var card_height = gui_col_y(14);
    var width = gui_col_x(23);
    var max_cards = 30;
    var cards_length = get_struct_length(arg2);
    if (cards_length > max_cards)
    {
        arg1 += draw_description(arg0, arg1, __s("Showing the first %s of %s cards.", max_cards, cards_length));
    }
    var col_x = 0;
    var col_y = 0;
    var cx = 0;
    var cy = 0;
    var __struct = arg2;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (__i >= max_cards)
        {
            break;
        }
        var card = variable_struct_get(global.cards, mkey);
        if (!is_struct(card))
        {
            continue;
        }
        var cx_next = arg0 + ((card_width + gui_col_x(0.5)) * col_x);
        if ((cx_next + (card_width / 2)) >= width)
        {
            col_x = 0;
            col_y++;
        }
        cx = arg0 + ((card_width + gui_col_x(0.5)) * col_x);
        cy = arg1 + ((card_height + gui_col_y(0.5)) * col_y);
        var text = sprintf("+%s -> %s", number_format(mitem), number_format(card.data.count));
        if (card.last_transcension_count_pack > 0)
        {
            text += sprintf(" [+%sT]", card.last_transcension_count_pack);
        }
        draw_card(cx, cy, card, card_width, card_height, false, undefined, text, true);
        col_x++;
    }
    arg1 = cy + card_height + gui_col_y(0.5);
    return arg1 - y_start;
}
