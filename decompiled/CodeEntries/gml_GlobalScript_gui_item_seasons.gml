function gui_item_seasons_wrapper(arg0, arg1)
{
    static previous_seasons_refreshed = false;
    
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
    if (is_current_dialog_section(global.dialog_sections.seasons.seasons))
    {
        if (gui_button_tl(arg0 + gui_col_x(0), arg1 + gui_col_y(0), __("Back"), undefined, gui_col_x(3)))
        {
            open_dialog("account");
        }
        if (gui_button_sprite(arg0 + gui_col_x(22), arg1 + gui_col_y(0.5), spr_icon_refresh, !has_timeout("seasons_refresh"), undefined, 
        {
            tooltip: __("Refresh")
        }))
        {
            mp_get_season_info();
            if (!global.debug)
            {
                set_timeout("seasons_refresh", sec(60));
            }
        }
        arg1 += gui_col_y(2.5);
        if (is_struct(global.cloud_data.season_info))
        {
            arg1 += gui_item_seasons(arg0, arg1);
        }
        else
        {
            var text = "";
            if (global.cloud_data.get_season_info)
            {
                text = __("Getting season information...");
            }
            else
            {
                text = __("No season data. Please try again later.");
            }
            draw_description(arg0, arg1 + gui_col_y(2), text);
        }
    }
    else if (is_current_dialog_section(global.dialog_sections.seasons.previous_seasons))
    {
        if (!previous_seasons_refreshed)
        {
            mp_get_previous_seasons_info();
            if (!global.debug)
            {
                set_timeout("previous_seasons_refresh", sec(60));
            }
            previous_seasons_refreshed = true;
        }
        if (gui_button_tl(arg0 + gui_col_x(0), arg1 + gui_col_y(0), __("Back"), undefined, gui_col_x(3)))
        {
            open_dialog("account");
        }
        if (gui_button_sprite(arg0 + gui_col_x(22), arg1 + gui_col_y(0.5), spr_icon_refresh, !has_timeout("previous_seasons_refresh"), undefined, 
        {
            tooltip: __("Refresh")
        }))
        {
            mp_get_previous_seasons_info();
            if (!global.debug)
            {
                set_timeout("previous_seasons_refresh", sec(60));
            }
        }
        arg1 += gui_col_y(2.5);
        if (global.cloud_data.get_previous_seasons_info)
        {
            arg1 += draw_description(arg0, arg1, __s("Getting season information..."));
        }
        if (!is_struct(global.cloud_data.previous_seasons_info))
        {
            return 0;
        }
        var x1 = arg0;
        var y1 = arg1;
        var x2 = arg0 + gui_col_x(14);
        var y2 = arg1;
        y1 += draw_heading(x1, y1, __("Weekly"), undefined, undefined, undefined, undefined, false);
        var __array = global.cloud_data.previous_seasons_info.seasons.weekly;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (gui_button_tl(x1, y1, mitem.name, undefined, gui_col_x(6)))
            {
                global.cloud_data.season_selected = mitem;
                delay_nav_func(gui_item_season_info, mitem.name, undefined, true, "previous_seasons");
            }
            y1 += gui_col_y(2);
        }
        y2 += draw_heading(x2, y2, __("Daily"), undefined, undefined, undefined, undefined, false);
        __array = global.cloud_data.previous_seasons_info.seasons.daily;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (gui_button_tl(x2, y2 - gui_col_y(0.3), mitem.name, undefined, gui_col_x(6)))
            {
                global.cloud_data.season_selected = mitem;
                delay_nav_func(gui_item_season_info, mitem.name, undefined, true, "previous_seasons");
            }
            y2 += gui_col_y(2);
        }
        arg1 = max(y1, y2);
    }
    return arg1 - y_start;
}

function gui_item_seasons(arg0, arg1)
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
    var text = "";
    var seasons_sorted = global.cloud_data.season_info;
    if (is_undefined(seasons_sorted))
    {
        exit;
    }
    if (is_struct(global.cloud_data.season_info))
    {
        seasons_sorted = struct_to_sorted_array_by(global.cloud_data.season_info, "id", true);
    }
    var seasons_count = 0;
    var __array = seasons_sorted;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        var is_valid_os = in_array(0, mitem.os);
        var can_play_season = mitem.active && is_valid_os;
        var season_type = get_default_struct_value(mitem, "type", "season");
        var item_y_start = arg1;
        arg1 += (draw_heading(arg0, arg1, mitem.name, undefined, undefined, undefined, 0) - gui_col_y(0.25));
        arg1 += draw_description(arg0, arg1, struct_get_from_hash(mitem, variable_get_hash("date_formatted")));
        arg1 += draw_description(arg0, arg1, mitem.description, gui_col_x(8));
        var row_x = arg0 + gui_col_x(9);
        if (gui_button_tl(row_x, item_y_start, __("Play"), can_play_season, gui_col_x(3)))
        {
            global.cloud_data.season_selected = mitem;
            load_season_character();
        }
        if (gui_button_tl(row_x + gui_col_x(5), item_y_start, __("Info"), true, gui_col_x(3)))
        {
            global.cloud_data.season_selected = mitem;
            delay_nav_func(gui_item_season_info, mitem.name, undefined, true);
        }
        if (get_default_struct_value(mitem, "is_speedrun", false))
        {
            if (gui_button_tl(row_x + gui_col_x(10), item_y_start, __("Restart run"), can_play_season && !has_timeout("season_restart_run"), gui_col_x(3)))
            {
                global.cloud_data.season_selected = mitem;
                confirm_restart_season();
            }
        }
        if (get_default_struct_value(mitem, "has_claim_rewards", false))
        {
            var can_claim = not_in_challenge() && !mp_is_season() && mitem.can_claim;
            if (gui_button_tl(row_x + gui_col_x(0), item_y_start + gui_col_y(2.5), __("Claim rewards"), can_claim, gui_col_x(3)))
            {
                text_dialog(__("Checking season character..."));
                post_to_cloud("misc", "claim_season_rewards", 
                {
                    season_id: mitem.id
                }, function(arg0)
                {
                    claim_season_rewards(arg0);
                }, text_dialog);
            }
        }
        if (get_default_struct_value(mitem, "has_salvage", false))
        {
            var can_salvage = not_in_challenge() && !mp_is_season() && mitem.can_salvage;
            if (gui_button_tl(row_x + gui_col_x(5), item_y_start + gui_col_y(2.5), __("Salvage"), can_salvage, gui_col_x(3)))
            {
                text_dialog(__("Checking season character..."));
                post_to_cloud("misc", "salvage_save", 
                {
                    season_id: mitem.id
                }, function(arg0)
                {
                    salvage_season(arg0);
                }, text_dialog);
            }
        }
        arg1 += gui_col_y(1);
    }
    return arg1 - y_start;
}

function gui_item_season_info(arg0, arg1)
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
        open_nav("seasons");
    }
    var season = global.cloud_data.season_selected;
    if (!is_struct(season))
    {
        exit;
    }
    if (!mp_is_season() && get_default_struct_value(season, "active", false))
    {
        if (gui_button_tl(arg0 + gui_col_x(5), arg1, __("Play"), undefined, gui_col_x(3)))
        {
            global.cloud_data.season_selected = season;
            load_season_character();
        }
    }
    arg1 += gui_col_y(2.5);
    var col_y = arg1;
    var desc = get_default_struct_value(season, "description_long", "");
    if (is_array(struct_get_from_hash(season, variable_get_hash("requirements"))))
    {
        desc += "\n\n";
        desc += (__s("Quests") + ":");
        desc += "\n";
        var __array2 = season.requirements;
        var __prop_len2 = array_length(__array2);
        for (var __i2 = 0; __i2 < __prop_len2; __i2++)
        {
            var mitem2 = __array2[__i2];
            desc += ("- " + get_quest_description(mitem2) + "\n");
        }
    }
    if (is_struct(struct_get_from_hash(season, variable_get_hash("game_settings"))) && is_struct(struct_get_from_hash(season.game_settings, variable_get_hash("unlocked"))))
    {
        var mechanics_text = [];
        var __struct = season.game_settings.unlocked;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            array_push(mechanics_text, "- " + get_default_struct_value(global.texts_mechanics, mkey, mkey));
        }
        desc += ("\n" + __s("Unlocked:") + "\n" + implode("\n", mechanics_text));
    }
    arg1 += draw_heading(arg0, arg1, __("Info"), undefined, undefined, undefined, undefined, false);
    arg1 += draw_description(arg0, arg1, desc, gui_col_x(8));
    var player_data = struct_get_from_hash(season, variable_get_hash("player_data"));
    if (is_struct(global.cloud_data.previous_seasons_info) && is_struct(struct_get_from_hash(global.cloud_data.previous_seasons_info, variable_get_hash("player_data"))) && is_struct(variable_struct_get(global.cloud_data.previous_seasons_info.player_data, season.key)))
    {
        player_data = variable_struct_get(global.cloud_data.previous_seasons_info.player_data, season.key);
    }
    if (is_struct(player_data))
    {
        arg1 += gui_item_profile_challenge_data(arg0, arg1, player_data);
    }
    var x2 = arg0 + gui_col_x(10);
    var y2 = col_y;
    if (is_struct(struct_get_from_hash(season, variable_get_hash("reward"))))
    {
        y2 += draw_heading(x2, y2, __("Reward"), undefined, undefined, undefined, undefined, false);
        y2 += draw_result(x2, y2, season.reward);
    }
    var x3 = arg0 + gui_col_x(14);
    var y3 = col_y;
    y3 += draw_heading(x3, y3, __("Leaderboard"), undefined, undefined, undefined, undefined, false);
    if (is_array(struct_get_from_hash(season, variable_get_hash("leaderboard"))))
    {
        if (is_undefined(struct_get_from_hash(season, variable_get_hash("leaderboard_cache"))))
        {
            var players = [[__("Rank"), __("Name"), __("Frames"), __("Time")]];
            if (array_length(season.leaderboard) > 0)
            {
                var __array = season.leaderboard;
                var __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    array_push(players, [mitem.Rank, mitem.Name, mitem.Frames, mitem.Time]);
                }
            }
            else
            {
                array_push(players, ["", "", "", ""]);
                array_push(players, [__("No players.")]);
            }
            season.leaderboard_cache = players;
        }
        set_default_font(f_gui_small);
        y3 += draw_text_table(x3, y3, struct_get_from_hash(season, variable_get_hash("leaderboard_cache")), undefined, gui_col_x(9), 25);
        y3 += gui_col_y(1);
        y3 += draw_description(x3, y3, __s("Leaderboard updates every %s minutes.", 15));
    }
    else
    {
        arg1 += draw_description(x3, y3, __("No players."));
    }
    return y_start - max(arg1, y2, y3);
}
