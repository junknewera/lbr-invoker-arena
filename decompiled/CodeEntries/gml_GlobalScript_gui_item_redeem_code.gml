function gui_item_redeem_code(arg0, arg1)
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
    arg1 += draw_description(arg0, arg1, __("Redeem a code to get resources, chests, cards, or something else! You can find codes on the social channels every once in a while. Follow us to get notified!"));
    arg1 += gui_col_y(0.5);
    var social_x = arg0 + gui_col_x(16);
    var social_y = arg1 + gui_col_y(1);
    var si = 0;
    var padding_y = global.is_mobile ? 3 : 2;
    if (gui_button_sprite(social_x, social_y + gui_col_y(padding_y * si++), spr_icon_discord_color, true, undefined, 
    {
        text: "Discord"
    }))
    {
        global.achievements.social_discord.value = true;
        url_open("https://discord.gg/tbBqfgwQWj");
    }
    if (gui_button_sprite(social_x, social_y + gui_col_y(padding_y * si++), spr_icon_reddit, true, undefined, 
    {
        text: "Reddit"
    }))
    {
        global.achievements.social_reddit.value = true;
        url_open("https://www.reddit.com/r/LeafBlowerRevolution/");
    }
    if (gui_button_sprite(social_x, social_y + gui_col_y(padding_y * si++), spr_icon_x, true, undefined, 
    {
        text: "X"
    }))
    {
        global.achievements.social_twitter.value = true;
        url_open("https://x.com/humble_north");
    }
    if (gui_button_sprite(social_x, social_y + gui_col_y(padding_y * si++), spr_icon_yt, true, undefined, 
    {
        text: "YouTube"
    }))
    {
        global.achievements.social_yt.value = true;
        url_open("https://www.youtube.com/@humblenorth/");
    }
    if (gui_button_sprite(social_x, social_y + gui_col_y(padding_y * si++), spr_icon_humblenorth, true, undefined, 
    {
        text: __("News")
    }))
    {
        global.achievements.social_humblenorth.value = true;
        url_open("https://lbr.humblenorth.de/lbr/wp2/");
    }
    arg1 += gui_item_input(arg0, arg1, 
    {
        label_id: "code",
        label: __("Code"),
        tab_index: 0
    });
    var code = get_gui_input_value("code");
    var can_redeem_code = !has_timeout("redeem_code") && !is_empty(code);
    if (gui_button_tl(arg0, arg1, __("Redeem"), can_redeem_code, gui_col_x(4)))
    {
        redeem_code(get_gui_input_value("code"));
        set_timeout("redeem_code", sec(5));
        global.await_async_action_text = __("Checking code") + "...";
    }
    arg1 += gui_col_y(2.5);
    if (gui_button_tl(arg0, arg1, __("Back"), true, gui_col_x(4)))
    {
        open_dialog("account");
    }
    arg1 += gui_col_y(2);
    arg1 += draw_description(arg0, arg1, global.await_async_action_text);
    return 0;
}
