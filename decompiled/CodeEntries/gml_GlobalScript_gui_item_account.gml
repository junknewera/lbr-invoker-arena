function gui_item_account(arg0, arg1)
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
    var button_width = gui_col_x(5);
    var is_logged_in = mp_is_logged_in();
    if (gui_button_tl(arg0, arg1, __("Cloud Saves"), is_logged_in && !mp_is_season(), button_width))
    {
        open_dialog("cloud_saves");
    }
    if (gui_button_tl(arg0 + button_width + gui_col_x(1), arg1, __("Profile"), is_logged_in, button_width))
    {
        open_dialog(gui_item_profile);
    }
    if (!mp_is_season())
    {
        if (is_logged_in)
        {
            if (gui_button_tl(arg0 + gui_col_x(20), arg1, __("Log out"), undefined, gui_col_x(3)))
            {
                confirm_logout();
            }
        }
        if (gui_button_tl(arg0 + gui_col_x(20), arg1 + gui_col_y(3), __("Delete account"), undefined, gui_col_x(3)))
        {
            if (is_logged_in)
            {
                actions_dialog_simple(gui_item_delete_account);
            }
            else
            {
                url_open("https://lbr.humblenorth.de/lbr/wp2/wp-admin/profile.php");
            }
        }
    }
    if (is_ingame())
    {
        arg1 += gui_col_y(3);
        if (gui_button_tl(arg0, arg1, __("Seasons") + " & " + __("Challenges"), is_logged_in, button_width))
        {
            if (!is_struct(global.cloud_data.season_info))
            {
                mp_get_season_info();
            }
            open_nav("seasons", "seasons");
        }
        arg1 += gui_col_y(3);
        if (gui_button_tl(arg0 + gui_col_x(0), arg1, __("Claimable rewards"), is_logged_in && !in_challenge() && !in_mp_challenge(), button_width))
        {
            open_dialog(gui_item_claimable_rewards, __("Claimable Rewards"), __("You may find claimable rewards here."), true);
        }
        if (!global.is_ios)
        {
            if (gui_button_tl(arg0 + button_width + gui_col_x(1), arg1, __("Redeem code"), !in_challenge() && !in_mp_challenge(), button_width))
            {
                open_dialog("redeem_code");
            }
        }
    }
}

function gui_item_claimable_rewards(arg0, arg1)
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
    if (gui_button_tl(arg0, arg1, __("Back"), undefined, gui_col_x(3)))
    {
        open_nav("account");
    }
    if (gui_button_tl(arg0 + gui_col_x(4), arg1, __("Check rewards"), mp_can_get_claimable_rewards(), gui_col_x(4), undefined, 
    {
        text_below: has_async_data("save_get_claim_rewards") ? __("Checking...") : ""
    }))
    {
        mp_get_claimable_rewards();
    }
    arg1 += gui_col_y(3);
    if (!is_array(global.cloud_data.claim_rewards) || array_length(global.cloud_data.claim_rewards) == 0)
    {
        draw_description(arg0, arg1, __("No claimable rewards available."));
        return 100;
    }
    var y_height = 100;
    var __array = global.cloud_data.claim_rewards;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        var item_height_heading = draw_heading(arg0, arg1, mitem.name, gui_col_x(10), undefined, undefined, undefined, false);
        draw_result(arg0 + gui_col_x(11), arg1 - gui_col_y(0.3), struct_get_from_hash(mitem, variable_get_hash("data_object")));
        if (is_undefined(variable_struct_get(o_game.data.stats, mitem.id)))
        {
            var can_claim = !has_async_data("save_claim_reward");
            if (gui_button_tl(arg0 + gui_col_x(18), arg1 - gui_col_y(0.5), __("Claim"), can_claim, gui_col_x(3)))
            {
                claim_reward(mitem.id, mitem.name, mitem.data_object);
            }
        }
        else
        {
            draw_description(arg0 + gui_col_x(18), arg1, __("Already claimed."));
        }
        if (!is_empty(struct_get_from_hash(mitem, variable_get_hash("text"))))
        {
            draw_description(arg0, arg1 + item_height_heading, mitem.text, gui_col_x(10));
        }
        arg1 += gui_col_y(3);
    }
    return arg1 - y_start;
}

function gui_item_delete_account(arg0, arg1)
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
    arg1 += draw_description(arg0, arg1, __s("Do you want to delete your account? All your data and progress will be permanently removed."));
    var button_width = gui_col_x(5);
    var button_height = global.is_mobile ? 64 : global.gui_button_height;
    arg1 += gui_item_input(arg0, arg1, 
    {
        label_id: "password",
        label: __("Password"),
        tab_index: 1,
        obfuscated: true,
        max_length: 128,
        allow_special_chars: true
    });
    arg1 += gui_col_y(2);
    var can_cancel = !has_async_data("user_delete_account");
    if (gui_button(arg0 + (global.gui_settings.content_width / 2), arg1, __("Cancel"), can_cancel, button_width, undefined, 
    {
        icon: spr_icon_cancel
    }))
    {
        gui_dialog_close();
    }
    arg1 += gui_col_y(3);
    var password = get_gui_input_value("password");
    var can_delete = !is_empty(password) && !has_async_data("user_delete_account");
    if (gui_button(arg0 + (global.gui_settings.content_width / 2), arg1, __("Delete account"), can_delete, button_width, undefined, 
    {
        icon: spr_icon_check
    }))
    {
        delete_account(password);
    }
}

function gui_item_profile(arg0, arg1)
{
    static get_profile_once = false;
    
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
    titles = 
    {
        title: __("Profile")
    };
    var profile = global.cloud_data.profile;
    if (gui_button_tl(arg0, arg1, __("Back"), undefined, gui_col_x(3)))
    {
        open_nav("account");
    }
    var profile_timeout_key = "get_profile";
    if (!get_profile_once)
    {
        get_profile_once = true;
        mp_get_profile();
        set_timeout(profile_timeout_key, sec(30));
    }
    if (gui_button_sprite_tl(arg0 + gui_col_x(22), arg1, spr_icon_refresh, !has_timeout(profile_timeout_key)))
    {
        mp_get_profile();
        log(global.cloud_data.profile);
    }
    arg1 += gui_col_y(2.5);
    if (has_async_data("save_get_profile"))
    {
        arg1 += draw_description(arg0, arg1, __("Getting profile..."));
        return 0;
    }
    else if (is_undefined(global.cloud_data.profile))
    {
        draw_description(arg0, arg1, __("No profile found."));
        return 0;
    }
    var x1 = arg0;
    var y1 = arg1;
    y1 += draw_heading(x1, y1, struct_get_from_hash(profile, variable_get_hash("name")), undefined, undefined, undefined, undefined, false);
    y1 += draw_description(x1, y1, [__s("ID: %s", struct_get_from_hash(profile, variable_get_hash("id")))]);
    if (is_array(struct_get_from_hash(profile, variable_get_hash("leaderboard_results"))))
    {
        var output = [];
        var __array = struct_get_from_hash(profile, variable_get_hash("leaderboard_results"));
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
        }
        y1 += draw_description(x1, y1, output);
    }
    return arg1 - y1;
}

function gui_item_profile_challenge_data(arg0, arg1, arg2)
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
    var challenge_frames = get_default_struct_value(arg2, "challenge_time_frames", 0);
    var rank = get_default_struct_value(arg2, "rank", 0);
    if (rank == 0)
    {
        rank = __("TBD");
    }
    arg1 += draw_description(arg0, arg1, [__s("Rank: %s", rank), __s("Runs: %s", get_default_struct_value(arg2, "runs", 0)), __s("Fastest time: %s", format_time(secr(challenge_frames), true, true, "-")) + sprintf(" (%s %s)", challenge_frames, __("frames"))], gui_col_x(6));
    return arg1 - y_start;
}
