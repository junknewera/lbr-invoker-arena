function gui_item_options(arg0, arg1)
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
    if (is_current_dialog_section(global.dialog_sections.options.general))
    {
        draw_sprite_ext(logo_1500x1500_transparent, 0, arg0 + (gui_content_width / 2), arg1 + gui_col_y(3), 1, 1, 0, c_white, 1);
        var social_x_start = arg0 + gui_col_x(3);
        var social_y = arg1 + gui_col_y(8);
        var social_x = social_x_start;
        if (gui_button_sprite(social_x, social_y + gui_col_y(0), spr_icon_steam, true, undefined, 
        {
            text: "Steam"
        }))
        {
            global.achievements.social_steam.value = true;
            url_open("https://store.steampowered.com/app/1468260/Leaf_Blower_Revolution__Idle_Game/");
        }
        if (!global.is_ios)
        {
            if (gui_button_sprite(social_x, social_y + gui_col_y(2), spr_icon_googleplay, true, undefined, 
            {
                text: "Play Store"
            }))
            {
                global.achievements.social_apple.value = true;
                global.achievements.social_googleplay.value = true;
                url_open("https://play.google.com/store/apps/details?id=com.ezplugins.leafblowerrevolution");
            }
        }
        if (gui_button_sprite(social_x, social_y + gui_col_y(4), spr_icon_apple, true, undefined, 
        {
            text: "App Store"
        }))
        {
            global.achievements.social_apple.value = true;
            global.achievements.social_googleplay.value = true;
            url_open("https://apps.apple.com/app/id6443698340");
        }
        social_x = social_x_start + gui_col_x(4.5);
        if (gui_button_sprite(social_x, social_y, spr_icon_discord_color, true, undefined, 
        {
            text: "Discord"
        }))
        {
            global.achievements.social_discord.value = true;
            url_open("https://discord.gg/tbBqfgwQWj");
        }
        if (gui_button_sprite(social_x, social_y + gui_col_y(2), spr_icon_reddit, true, undefined, 
        {
            text: "Reddit"
        }))
        {
            global.achievements.social_reddit.value = true;
            url_open("https://www.reddit.com/r/LeafBlowerRevolution/");
        }
        if (gui_button_sprite(social_x, social_y + gui_col_y(4), spr_icon_x, true, undefined, 
        {
            text: "X"
        }))
        {
            global.achievements.social_twitter.value = true;
            url_open("https://x.com/humble_north");
        }
        social_x = social_x_start + gui_col_x(9);
        if (gui_button_sprite(social_x, social_y + gui_col_y(0), spr_icon_yt, true, undefined, 
        {
            text: "YouTube"
        }))
        {
            global.achievements.social_yt.value = true;
            url_open("https://www.youtube.com/@humblenorth/");
        }
        if (gui_button_sprite(social_x, social_y + gui_col_y(2), spr_icon_wiki, true, undefined, 
        {
            text: "Wiki"
        }))
        {
            global.achievements.social_wiki.value = true;
            url_open("https://leafblowerrevolution.wiki.gg/wiki/Leaf_Blower_Revolution_Wiki");
        }
        if (gui_button_sprite(social_x, social_y + gui_col_y(4), spr_borb, true, undefined, 
        {
            text: __("Merch Shop")
        }))
        {
            global.achievements.social_merch.value = true;
            url_open("https://leaf-blower-revolution-shop.myspreadshop.net/");
        }
        social_x = social_x_start + gui_col_x(13.5);
        if (gui_button_sprite(social_x, social_y + gui_col_y(0), spr_icon_humblenorth, true, undefined, 
        {
            text: "Humble North"
        }))
        {
            global.achievements.social_humblenorth.value = true;
            url_open("https://humblenorth.de/");
        }
        if (gui_button_sprite(social_x, social_y + gui_col_y(2), spr_icon_humblenorth, true, undefined, 
        {
            text: __("News")
        }))
        {
            global.achievements.social_humblenorth.value = true;
            url_open("https://lbr.humblenorth.de/lbr/wp2/");
        }
        if (gui_button_sprite(social_x, social_y + gui_col_y(4), spr_icon_humblenorth, true, undefined, 
        {
            text: __("Translation")
        }))
        {
            global.achievements.social_humblenorth.value = true;
            url_open("https://humblenorth.de/translator-application/");
        }
        var save_quit_button_text = __("Save & Quit");
        var btn_enabled = !global.is_saving;
        if (gui_button_tl(arg0 + gui_col_x(0.5), arg1 + gui_col_y(16), save_quit_button_text, btn_enabled, gui_col_x(4)))
        {
            add_game_log("Save and Quit");
            save_and_end_game();
        }
        if (mp_is_season())
        {
            if (gui_button_tl(arg0 + gui_col_x(6), arg1 + gui_col_y(16), __("Save & return to main game"), can_upload_season_save(), gui_col_x(5)))
            {
                global.cloud_data.last_season_upload = undefined;
                global.cloud_data.last_season_upload_manual = get_time_object();
                global.func_after_cloud_save = game_restart_adv;
                save_game();
                text_dialog(__("Please wait as your character is being uploaded to the cloud. The game will change to your main game automatically..."));
            }
        }
        if (!global.cloud_data.is_season)
        {
            if (gui_button_tl(arg0 + gui_col_x(6), arg1 + gui_col_y(16), __("Save"), true, gui_col_x(2.5)))
            {
                save_game();
            }
        }
        if (gui_button_tl(arg0 + gui_col_x(19), arg1 + gui_col_y(16), __("Return to menu"), true, gui_col_x(4)))
        {
            var text = global.is_mobile ? __("Do you wish to return to the main game? Your game will only save on your local device.") : __("Do you wish to return to the main game?");
            confirm_dialog(text, function()
            {
                save_game();
                global.disable_init_skip_to_start = true;
                room_goto(r_init);
            });
        }
        if (gui_button_sprite((arg0 + gui_content_width) - gui_col_x(2), arg1 + gui_col_y(2), spr_icon_cancel, true))
        {
            confirm_dialog(__("Do you want to exit the game? (Why?)"), function()
            {
                save_game();
                game_end();
            });
        }
    }
    else if (is_current_dialog_section(global.dialog_sections.options.userlog))
    {
        var userlog_text = [];
        var __array = global.user_log;
        var __prop_len = array_length(__array);
        var __i = __prop_len - 1;
        while (__i >= 0)
        {
            var mitem = __array[__i];
            var __ireal = __prop_len - 1 - __i;
            array_push(userlog_text, textr("[time] | [key] | [data]", mitem));
            __i--;
        }
        var text = implode("\n\n", userlog_text);
        arg1 += draw_description(arg0, arg1, text);
    }
    else
    {
        var key = get_current_dialog_section_key();
        var options = variable_struct_get(global.options_sections, key);
        var __array = options;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (!get_value_ext(mitem, mitem.visible_in_options))
            {
                continue;
            }
            arg1 += gui_item_option(arg0, arg1, mitem);
        }
    }
    return arg1 - y_start;
}
